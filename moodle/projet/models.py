from django.db import models

from django.contrib.auth.models import  AbstractUser
from django.utils import timezone


# Create your models here.


class User(AbstractUser):
    role=models.CharField(max_length=255)
    date_naissance=models.DateField(default=timezone.now)
    numero=models.IntegerField(null=True)


class Tache(models.Model):
    intituler=models.CharField(max_length=255)
    matiere=models.CharField(max_length=255)
    projet = models.FileField(upload_to='projet_pdfs/')
    statut=models.CharField(max_length=100)

    







    


