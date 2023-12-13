from django.db import models
from django.contrib.auth.models import AbstractUser, BaseUserManager, Permission, Group
from django.utils.translation import gettext_lazy as _

class CustomUserManager(BaseUserManager):
    def create_user(self, username, password=None, tipo_usuario='vendedor', **extra_fields):
        if not username:
            raise ValueError(_('Este campo es requerido'))
        
        user = self.model(username=username, tipo_usuario=tipo_usuario, **extra_fields)
        user.set_password(password)
        user.save(using=self._db)
        print('Usuario vendedor creado')
        return user

    def create_superuser(self, username, password=None, tipo_usuario='administrador', **extra_fields):
        extra_fields.setdefault('is_staff', True)
        extra_fields.setdefault('is_superuser', True)
        print('usuario administrador creado')
        return self.create_user(username, password, tipo_usuario, **extra_fields)


class CustomUser(AbstractUser):
    TIPO_USUARIO_CHOICES = [
        ('vendedor', 'Vendedor'),
        ('administrador', 'Administrador'),
    ]
    groups = models.ManyToManyField(Group, related_name='custom_user_set', blank=True)
    user_permissions = models.ManyToManyField(Permission, related_name='custom_user_set', blank=True) 
    username = models.CharField(max_length=50, unique=True)
    tipo_usuario = models.CharField(max_length=15, choices=TIPO_USUARIO_CHOICES, default='vendedor')
    objects = CustomUserManager()
    USERNAME_FIELD = 'username'
    def __str__(self):
        return self.username
          
                
class ProductMed(models.Model):
    nombre = models.CharField(max_length=100, unique=True)
    imagen = models.ImageField(upload_to='static/img/Papahe/productos_medicinales/')
    farmacia = models.CharField(max_length=100)
    
    posologia = models.CharField(max_length=256)
    presentacion = models.CharField(max_length=256)
    ingredientes = models.CharField(max_length=256)
    descripcion = models.TextField(max_length=512)
    CATEGORIA_CHOICES = (
        ('BAJAR DE PESO', 'Bajar de Peso'),
        ('RESFRIADO', 'Resfriado'),
        ('INFECCION URINARIA', 'Infección Urinaria'),
        ('MULTIVITAMÍNICOS', 'Multivitamínicos'),
        ('ENERGIZANTES', 'Energizantes'),
        ('COLON', 'Colon'),
        ('GÁSTRICOS', 'Gástricos'),
        ('ESTREÑIMIENTO', 'Estreñimiento'),
        ('TRANQUILIZANTES', 'Tranquilizantes'),
        ('INSOMNIO', 'Insomnio'),
        ('REUMÁTICOS', 'Reumáticos'),
        ('ÓSEOS', 'Óseos'),
        ('REGENERADORES', 'Regeneradores'),
        ('LIMPIADORES ORGÁNICOS', 'Limpiadores Orgánicos'),
        ('RENAL', 'Renal'),
        ('HEPATOPROTECTORES', 'Hepatoprotectores'),
        ('COLESTEROL Y TRIGLICÉRIDOS', 'Colesterol y Triglicéridos'),
        ('CONCENTRACIÓN', 'Concentración'),
        ('CIRCULACIÓN', 'Circulación'),
        ('HIPERTENSIÓN', 'Hipertensión'),
        ('DIABETES', 'Diabetes'),
        ('SALUD FEMENINA', 'Salud Femenina'),
        ('SALUD MASCULINA', 'Salud Masculina'),
        ('PRODUCTOS NATURALES', 'Productos Naturales'),
        ('SHAMPOO Y ACONDICIONADORES', 'Shampoo y Acondicionadores'),
        ('LOCIONES', 'Lociones'),
        ('OTROS', 'otros'),
        ('', 'Seleccione una categoría'),  
        )

    categoria = models.CharField(
        max_length=50,
        choices=CATEGORIA_CHOICES,
        default='',  
    )

    def __str__(self):
        return self.nombre
    class Meta:
        ordering = ['categoria', 'nombre']
        
 
class ProductGas(models.Model):
    nombre = models.CharField(max_length=100)
    marca = models.CharField(max_length=100)
    imagen = models.ImageField(upload_to='static/img/Papahe/productos_gastronomicos/')
    descripcion = models.TextField() 
    CATEGORIA_CHOICES = (
        ('UNIFORMES', 'Uniformes'),
        ('COLORANTES', 'Colorantes'),
        ('HERRAMIENTAS', 'Herramientas'),
        ('REPOSTERIA', 'Reposteria'),
        ('ADITIVOS', 'Aditivos'),
        ('CUCHILLOS', 'Cuchillos'),
        ('MOLDES', 'Moldes'),
        ('OTROS', 'otros'),
        ('', 'Seleccione una categoría'),  
        )

    categoria = models.CharField(
        max_length=50,
        choices=CATEGORIA_CHOICES,
        default='',  
    )  
class Catalogo(models.Model):
    productMed = models.ForeignKey(ProductMed, on_delete=models.CASCADE)
    ProductGas = models.ForeignKey(ProductGas, on_delete=models.CASCADE)
    catalogoType = models.BooleanField(default=False)   
    
     
          