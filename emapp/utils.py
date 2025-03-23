import pandas as pd
from .models import Sequence, UserSequence
from django.contrib.auth.models import User
from django.db import connection

class log:
    _logger = None

    @classmethod
    def _get_logger(cls):
        if cls._logger is None:
            import logging
            cls._logger = logging.getLogger(__name__)
            logging.basicConfig(level=logging.DEBUG)
        return cls._logger

    @classmethod
    def debug(cls, message):
        cls._get_logger().debug(message)

    @classmethod
    def error(cls, message):
        cls._get_logger().error(message)

    @classmethod
    def info(cls, message):
        cls._get_logger().info(message) 

def replace_space(img_name: str) -> str:
    return img_name.replace(" ", "_")

def excel_to_db(file):
    """Import data from excel to RDS

    Args:
        file (.xlsx): Excel file to import

    Raises:
        Exception: Error processing RndN12_nms sheet
        Exception: Error processing uIDtoBox sheet

    Returns:
        status message: Data imported successfully (if no errors)
    """
    excel_data = pd.read_excel(file, sheet_name=None, engine='openpyxl')

    sheet_rnd = excel_data.get('RndN12_nms')  # Sheet with Sequences    
    sheet_uid = excel_data.get('uIDtoBox')   # Sheet with User Sequences

    try:
        if sheet_rnd is not None:
            for _, row in sheet_rnd.iterrows():
                sequence = Sequence(
                    nms_N1_1=replace_space(row['nms_N1_1']),
                    nms_N1_2=replace_space(row['nms_N1_2']),
                    nms_N1_3=replace_space(row['nms_N1_3']),
                    nms_N1_4=replace_space(row['nms_N1_4']),
                    nms_N2_1=replace_space(row['nms_N2_1']),
                    nms_N2_2=replace_space(row['nms_N2_2']),
                    nms_N2_3=replace_space(row['nms_N2_3']),
                    nms_N2_4=replace_space(row['nms_N2_4']),
                    nms_N3_1=replace_space(row['nms_N3_1']),
                    nms_N3_2=replace_space(row['nms_N3_2']),
                    nms_N3_3=replace_space(row['nms_N3_3']),
                    nms_N3_4=replace_space(row['nms_N3_4'])
                )
                sequence.save()
    except Exception as e:
        log.error(f"Error processing RndN12_nms sheet: {e}")
        raise Exception(f"Error processing RndN12_nms sheet: {e}")

    try: 
        if sheet_uid is not None:
            for _, row in sheet_uid.iterrows():
                # Check if user exists, otherwise cannot import data
                if row['uID_ind'] in set(User.objects.values_list('id', flat=True)):
                    user_sequence = UserSequence(
                        user_id=row['uID_ind'],
                        seq_N1_1=row['seq_N1_1'],
                        seq_N1_2=row['seq_N1_2'],
                        seq_N1_3=row['seq_N1_3'],
                        seq_N1_4=row['seq_N1_4'],
                        seq_N2_1=row['seq_N2_1'],
                        seq_N2_2=row['seq_N2_2'],
                        seq_N2_3=row['seq_N2_3'],
                        seq_N2_4=row['seq_N2_4']
                    )
                    user_sequence.save()
                else:
                    log.error(f"User with uID {row['uID_ind']} does not exist! Data was thus not imported.")
    except Exception as e:
        log.error(f"Error processing uIDtoBox sheet: {e}")
        raise Exception(f"Error processing uIDtoBox sheet: {e}")

    return "Data imported successfully!"

def reset_auto_increment(table_name):
    """ Reset auto-increment counter for a table in MariaDB """
    with connection.cursor() as cursor:
        cursor.execute(f"ALTER TABLE {table_name} AUTO_INCREMENT = 1")
        
def pseudo_random():
    pass