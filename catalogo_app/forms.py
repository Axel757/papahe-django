from django.core import validators
from django import forms
from django.core.validators import FileExtensionValidator, MinValueValidator, MaxValueValidator, MaxLengthValidator
from catalogo_app.models import *
from django.contrib.auth import authenticate 
from django.contrib.auth.decorators import login_required
from django.core.validators import ValidationError
from django.utils.translation import gettext_lazy as _
from django.contrib.auth.forms import UserCreationForm, AuthenticationForm
from django.contrib.auth.models import User

#Validacion de imagenes


        
#Formulario de registro        
class CustomUserCreationForm(UserCreationForm):
    tipo_usuario = forms.ChoiceField(
        choices=[
            ('vendedor', 'Vendedor'),
            ('administrador', 'Administrador'),
        ],
        widget=forms.RadioSelect(),
    )

    class Meta:
        model = CustomUser
        fields = ['username', 'password1', 'password2', 'tipo_usuario']

    def save(self, commit=True):
        user = super().save(commit=False)
        user.tipo_usuario = self.cleaned_data['tipo_usuario']

        if commit:
            user.save()

        return user
    
class CustomAuthenticationForm(AuthenticationForm):
    def confirm_login_allowed(self, user):
        if not user.is_active:
            raise forms.ValidationError(
                self.error_messages['inactive'],
                code='inactive',
            )

        # Validación adicional para contraseña incorrecta
        if not user.check_password(self.cleaned_data.get('password')):
            raise forms.ValidationError(
                self.error_messages['incorrect_password'],
                code='incorrect_password',
            )
    error_messages = {
        'invalid_login': 'Nombre o Clave Incorrectas.',
        'inactive': 'Esta cuenta está inactiva.',
    }
    
    class Meta:
        model = CustomUser 
        fields = ['username', 'password']      

#Formulario de Productos
def validate_image_extension(value):
    valid_extensions = ['jpg', 'jpeg', 'png', 'PNG', 'JPG', 'JPEG']
    extension = value.name.split('.')[-1].lower()
    if extension not in valid_extensions:
        raise ValidationError(_('Imagen inválida. Solo se permiten imágenes JPG, JPEG y PNG.'))

class CustomImageField(forms.ImageField):
    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        self.validators.append(validate_image_extension)

class FormProductos(forms.ModelForm):
    nombre = forms.CharField(
        label='Nombre',
        widget=forms.TextInput(attrs={'class': 'form-control', 'placeholder': 'Ingrese el nombre del producto'}),
        validators=[
            validators.MinLengthValidator(1),
        ],
        error_messages={
            'unique': 'Ya existe un producto con este nombre. Por favor, modifíquelo.'
        }
    )

    
    farmacia = forms.CharField(
        label='Farmacia',
        widget=forms.TextInput(attrs={'class': 'form-control', 'placeholder': 'Ingrese la farmacia del producto'}),
        validators=[
            validators.MinLengthValidator(1),
        ]
    )
    imagen = CustomImageField(
        label='Imagen',
        widget=forms.ClearableFileInput(attrs={'class': 'form-control', 'placeholder': 'Seleccione una imagen'}),
    )
    posologia = forms.CharField(
        label='Posología',
        widget=forms.TextInput(attrs={'class': 'form-control', 'placeholder': 'Ingrese la posología del producto'}),
        validators=[
            validators.MinLengthValidator(1),
        ]
    )
    presentacion = forms.CharField(
        label='Presentación',
        widget=forms.TextInput(attrs={'class': 'form-control', 'placeholder': 'Ingrese la presentación del producto'}),
        validators=[
            validators.MinLengthValidator(1),
        ]
    )
    ingredientes = forms.CharField(
        label='Ingredientes',
        widget=forms.TextInput(attrs={'class': 'form-control', 'placeholder': 'Ingrese los ingredientes del producto'}),
        validators=[
            validators.MinLengthValidator(1),
        ]
    )
    descripcion = forms.CharField(
        label='Descripción',
        widget=forms.Textarea(attrs={'class': 'form-control', 'placeholder': 'Describa las propiedades del producto'}),
        validators=[
            validators.MinLengthValidator(1)
        ]
    )
    categoria = forms.ChoiceField(
        label='Categoría',
        choices=ProductMed.CATEGORIA_CHOICES,
        widget=forms.Select(attrs={'class': 'form-control', 'placeholder': 'Seleccione la categoría del producto', 'required': 'required'})
    )

    class Meta:
        model = ProductMed
        fields = '__all__'
        
 
 
 #Formulario Gastronomico        
class FormGastronomia(forms.ModelForm): 
    nombre = forms.CharField(
        label='Nombre',
        widget=forms.TextInput(attrs={'class': 'form-control', 'placeholder':
            'Ingrese el nombre del producto'}),
        validators=[
            validators.MinLengthValidator(1),
        ],
        error_messages={
            'unique': 'Ya existe un producto con este nombre. Por favor, modifíquelo.'
        }
    )
    
    marca = forms.CharField(
        label='Marca',
        widget=forms.TextInput(attrs={'class': 'form-control', 'placeholder': 'Ingrese la marca del producto'}),
        validators=[
            validators.MinLengthValidator(1),
        ]
    )
    
    categoria = forms.ChoiceField(
        label='Categoría',
        choices=ProductGas.CATEGORIA_CHOICES,
        widget=forms.Select(attrs={'class': 'form-control', 'placeholder': 'Seleccione la categoría del producto', 'required': 'required'})
    )
    
    imagen = CustomImageField(
        label='Imagen',
        widget=forms.ClearableFileInput(attrs={'class': 'form-control', 'placeholder': 'Seleccione una imagen'}),
    )
    
    descripcion = forms.CharField(
        label='Descripción',
        widget=forms.Textarea(attrs={'class': 'form-control', 'placeholder': 'Describa la función del producto'}),
        validators=[
            validators.MinLengthValidator(1)
        ]
    )
    
    class Meta:
        model = ProductGas
        fields = '__all__'
    