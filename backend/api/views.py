from rest_framework.response import Response
from rest_framework import status
from rest_framework.decorators import api_view
from . serializers import UserRegisterSerializer, UserLoginSerializer
from django.contrib.auth import authenticate


@api_view(['POST'])
def register_user(request):
    serializer = UserRegisterSerializer(data=request.data)
    if serializer.is_valid(raise_exception=True):
        serializer.save()
        return Response(serializer.data, status=status.HTTP_201_CREATED)
    return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

@api_view(['POST'])
def login_user(request):
    serializer = UserLoginSerializer(data=request.data)
    if serializer.is_valid(raise_exception=True):
        email = request.data.get('email')
        password = request.data.get('password')
        user = authenticate(request, email=email, password=password)
        if user is not None:
            return Response({'success': 'Login Successfull'}, status=status.HTTP_200_OK)
        return Response({'error': 'Email and password did not match'}, status=status.HTTP_400_BAD_REQUEST)
    return Response({'error': 'Email and password did not match'}, status=status.HTTP_400_BAD_REQUEST)
        