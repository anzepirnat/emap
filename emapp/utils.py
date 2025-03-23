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
        
def pseudo_random(user_id: int) -> str:
    """Pseudo-randomly select an image from the list, with the generated table in RDS

    Args:
        image_list (list): List of images

    Returns:
        str: Image name
    """
    log.debug(f"User ID: {user_id}")
    user_sequences = UserSequence.objects.filter(user_id=user_id).values_list(
        "seq_N1_1", "seq_N1_2", # Naloga N1 
        "seq_N2_1", "seq_N2_2" # Naloga N2
    ).first()
    
    first_25 = user_sequences[0] # Naloga N1, čutsveno neobremenilne (N1_1)
    second_25 = user_sequences[1] # Naloga N1, čutsveno obremenilne (N1_2)
    third_25 = user_sequences[2] # Naloga N2, čutsveno neobremenilne (N2_1)
    fourth_25 = user_sequences[3] # Naloga N2, čutsveno obremenilne (N2_2)
    log.info(f"User {user_id}: first_25={first_25}, second_25={second_25}, third_25={third_25}, fourth_25={fourth_25}")
    
    # For now just use the first in the first 25
    # TODO - implement the logic for the other 3
    image_list = Sequence.objects.values_list('nms_N1_1', flat=True)
    log.info(f"Image list: {image_list}")
    
    # For now just take first image from the list
    # TODO - implement the logic for other images
    image_idx = 0
    image = image_list[image_idx]
    log.info(f"Image/Index selected: {image}/{image_idx}")
    
    return image, image_idx
    