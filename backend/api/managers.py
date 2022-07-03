from django.contrib.auth.base_user import BaseUserManager
from django.utils.translation import gettext_lazy as _ 


class CustomUserManager(BaseUserManager):
    def create_user(self, email, phoneNumber, password, **extra_fields):
        if not email:
            raise ValueError(_('The email must be passed'))    
        email = self.normalize_email(email)
        user = self.model(email=email, phoneNumber=phoneNumber, **extra_fields)
        user.set_password(password)
        user.save()
        return user 

    def create_superuser(self, email, phoneNumber, password, **extra_fields):
        extra_fields.setdefault('is_staff', True)
        extra_fields.setdefault('is_superuser', True)
        extra_fields.setdefault('is_active', True)

        if extra_fields.get('is_active') is not True:
            raise ValueError(_('Superuser must have is_active=True'))
        if extra_fields.get('is_superuser') is not True:
            raise ValueError(_('Superuser must have is_superuser=True'))
        if extra_fields.get('is_staff') is not True:
            raise ValueError(_('Superuser must have is_staff=True'))

        return self.create_user(email, phoneNumber, password, **extra_fields)