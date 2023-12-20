from django.urls import path
from catalogo_app.views import *
from django.contrib.auth.decorators import login_required
from django.contrib.auth.views import LogoutView
from django.conf import settings
from django.conf.urls.static import static


urlpatterns = [

    path('salir/', LogoutView.as_view(), name='salir'),

    path('seleccion/', catalogoData, name='seleccion'),
    path('usuarios/',Usuariosdata, name='Usuariosdata'),
    path('catalogo/medicinal/', medicinalData, name='medicinal'),
    path('catalogo/gastronomico/', gastronomicoData, name='gastronomico'),

    path('catalogo/medicinal/<int:producto_id>/',
         productInfo, name='productInfo'),
    path('catalogo/gastronomico/<int:producto_id>/',
         productInfoGastronomico, name='productInfoGas'),

    path('catalogo/gastronomico/<str:categoria>/',
         gastronomiaCategoria, name='gastronomiaCategoria'),
    path('catalogo/medicinal/<str:categoria>/',
         medicinalCategoria, name='medicinalCategoria'),


    # Crud productos medicinales
    path('catalogo/agregar/medicinal/', agregar, name='agregarmedicinal'),
    path('catalogo/medicinal/modificar/<int:producto_id>/',
         modificar, name='modificarmedicinal'),

    path('catalogo/medicinal/eliminar/<int:producto_id>/',
         requestDelete, name='solicitareliminacion'),

    path('eliminar/<int:producto_id>/', eliminar, name='eliminar_producto'),


    # Crud productos gastronomicos

    path('catalogo/gastronomico/modificar/<int:producto_id>/',
         modificarGastronomico, name='modificarGastronomico'),
    path('catalogo/agregar/gastronomico/', agregarGastronomico, name='agregargastronomico'),
    path('catalogo/gastronomico/eliminar/<int:producto_id>/',
         requestDeleteGas, name='requestDeleteGas'),

    path('catalogo/<int:producto_id>/',
         eliminarGastronomico, name='eliminarGastronomico'),
    
     path('eliminar_usuario/<int:usuario_id>/', eliminar_usuario, name='eliminar_usuario'),

] + static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)