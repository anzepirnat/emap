from django.db import models
from django.contrib.auth.models import User

class Sequence(models.Model):
    nms_N1_1 = models.CharField(max_length=50)
    nms_N1_2 = models.CharField(max_length=50)
    nms_N1_3 = models.CharField(max_length=50)
    nms_N1_4 = models.CharField(max_length=50)
    nms_N2_1 = models.CharField(max_length=50)
    nms_N2_2 = models.CharField(max_length=50)
    nms_N2_3 = models.CharField(max_length=50)
    nms_N2_4 = models.CharField(max_length=50)
    nms_N3_1 = models.CharField(max_length=50)
    nms_N3_2 = models.CharField(max_length=50)
    nms_N3_3 = models.CharField(max_length=50)
    nms_N3_4 = models.CharField(max_length=50)
    
    def __str__(self):
        return f"Sequence {self.id}"
    
    
class UserSequence(models.Model):
    user = models.ForeignKey(User, on_delete=models.CASCADE)
    seq_N1_1 = models.CharField(max_length=20)  
    seq_N1_2 = models.CharField(max_length=20)  
    seq_N1_3 = models.CharField(max_length=20)  
    seq_N1_4 = models.CharField(max_length=20)  
    seq_N2_1 = models.CharField(max_length=20)  
    seq_N2_2 = models.CharField(max_length=20)  
    seq_N2_3 = models.CharField(max_length=20)  
    seq_N2_4 = models.CharField(max_length=20)  
    
    def __str__(self):
        return f"User {self.user.username} - Sequence {self.id}"
    

class Results(models.Model):
    user = models.ForeignKey(User, on_delete=models.CASCADE)
    image = models.CharField(max_length=50, default="NAN")
    image_idx = models.IntegerField(default=0)
    score = models.CharField(max_length=10)
    
    def __str__(self):
        return f"User {self.user.username} - Image {self.image_idx}: {self.image} - Score {self.score}"

# Just testing 
class TestTableMigration(models.Model):
    test_field = models.CharField(max_length=20)
    some_field = models.IntegerField()
    another_char_field = models.CharField(max_length=20)
    blabla = models.CharField(max_length=20, default='default_value')
    
    def __str__(self):
        return f"TestTableMigration {self.id}"
    
