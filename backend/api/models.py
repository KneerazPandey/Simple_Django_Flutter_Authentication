from django.db import models
from django.contrib.auth.models import AbstractUser
from . managers import CustomUserManager


class User(AbstractUser):
    username=None
    email = models.EmailField(max_length=255, unique=True)
    phoneNumber = models.PositiveBigIntegerField(unique=True)

    USERNAME_FIELD = 'email'
    REQUIRED_FIELDS = ['phoneNumber']

    objects = CustomUserManager()

    def __str__(self):
        return self.email

