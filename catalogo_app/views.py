from django.db import IntegrityError
from django.http import HttpResponse, HttpResponseForbidden
from django.shortcuts import get_object_or_404, render
from catalogo_app.models import *
from catalogo_app.forms import *
from django.shortcuts import render, redirect
from django.contrib.auth.forms import AuthenticationForm
from django.contrib.auth import authenticate, login, logout, get_user_model
from django.views.decorators.http import require_http_methods
from django.db.models import Q
from django.contrib import messages
from django.urls import reverse, reverse_lazy
import logging
from .forms import CustomAuthenticationForm
from django.views.generic.edit import DeleteView
from catalogo_app.mixins import *
from django.db import transaction
from django.contrib.auth.decorators import user_passes_test

logger = logging.getLogger(__name__)
CustomUser = get_user_model()
# Create your views here.

# Sistema de validación, registro y logout


def registro2(request):
    if request.method == 'POST':
        form = CustomUserCreationForm(request.POST)
        if form.is_valid():
            user = form.save(commit=False)

            # Verificar si el tipo de usuario es "administrador"
            if form.cleaned_data['tipo_usuario'] == 'administrador':
                user.is_staff = True
                user.is_superuser = True
                user.save()
                messages.success(request, 'Administrador Registrado')

            # Verificar si el tipo de usuario es "vendedor"
            elif form.cleaned_data['tipo_usuario'] == 'vendedor':
                user.is_staff = False
                user.is_superuser = False
                user.save()
                messages.success(request, 'Vendedor Registrado')

            # Autenticar y redirigir al usuario después del registro
            user = authenticate(username=user.username,
                                password=form.cleaned_data['password1'])
            login(request, user)

            return redirect('login')

    else:
        form = CustomUserCreationForm()

    return render(request, 'templatesUser/registro2.html', {'form': form})


def user_login(request):
    if request.method == 'POST':
        form = CustomAuthenticationForm(request, request.POST)
        if form.is_valid():
            name = form.cleaned_data['username']
            password = form.cleaned_data['password']
            user = authenticate(request, username=name, password=password)
            if user is not None:
                login(request, user)
                print("Usuario autenticado con éxito.")
                return redirect('seleccion')
            else:
                messages.error(
                    request, "El usuario o la contraseña son incorrectos.")
        else:
            messages.error(request, "El Nombre o la Clave son incorrectas.")
    else:
        form = CustomAuthenticationForm(request)

    return render(request, 'templatesUser/pphLogin.html', {'form': form})


@login_required
def salir(request):
    logout(request)
    return redirect('papahe/')

# Sistema de catalogo


@login_required
def catalogoData(request):
    tipo_usuario = request.user.tipo_usuario
    username = request.user.username if request.user.is_authenticated else 'Anónimo'
    catalogo = Catalogo.objects.all()
    data = {'username': username, 'catalogo': catalogo,
            'tipo_usuario': tipo_usuario}
    return render(request, "seleccion.html", data)


@login_required
def medicinalData(request):
    search_term = request.GET.get('search', '')
    medicinal = ProductMed.objects.filter(
        Q(nombre__icontains=search_term) | Q(
            categoria__icontains=search_term) | Q(farmacia__icontains=search_term)| Q(ingredientes__icontains=search_term)
    )
    data = {'medicinal': medicinal, 'search_term': search_term}
    return render(request, "ProductMed.html", data)


@login_required
def gastronomicoData(request):
    search_term = request.GET.get('search', '')
    gastronomico = ProductGas.objects.filter(
        Q(nombre__icontains=search_term) | Q(marca__icontains=search_term) | Q(categoria__icontains=search_term)
    )
    categorias = ProductGas.CATEGORIA_CHOICES
    data = {'gastronomico': gastronomico, 'categorias': categorias, 'search_term': search_term}
    return render(request, "ProductGas.html", data)


@login_required
def productInfo(request, producto_id):
    producto = get_object_or_404(ProductMed, pk=producto_id)
    data = {"producto": producto}
    return render(request, "productInfo.html", data)


@login_required
def productInfoGastronomico(request, producto_id):
    producto = get_object_or_404(ProductGas, pk=producto_id)
    data = {"producto": producto}
    return render(request, "productInfoGas.html", data)


@login_required
def medicinalCategoria(request, categoria):
    medicinal = ProductMed.objects.filter(categoria__iexact=categoria)
    data = {'medicinal': medicinal, 'categoria': categoria}
    return render(request, 'ProductMed.html', data)


@login_required
def gastronomiaCategoria(request, categoria):
    gastronomico = ProductGas.objects.filter(categoria__iexact=categoria)
    data = {'gastronomico': gastronomico, 'categoria': categoria}
    return render(request, 'ProductGas.html', data)


# Funcion para validar administradores
def adminVerify(user):
    return user.is_authenticated and user.is_superuser and user.is_staff

# Sistema Crud de productos


@login_required
@user_passes_test(adminVerify)
def agregar(request):
    form = FormProductos()

    if request.method == 'POST':
        form = FormProductos(request.POST, request.FILES)
        try:
            with transaction.atomic():
                if form.is_valid():
                    nombre_producto = form.cleaned_data['nombre']
                    farmacia_producto = form.cleaned_data['farmacia']
                    descripcion_producto = form.cleaned_data['descripcion']

                    existing_product = ProductMed.objects.filter(
                        nombre=nombre_producto, descripcion=descripcion_producto
                    ).exists()

                    if existing_product:
                        messages.error(
                            request,
                            'Ya existe un producto con el nombre "{}" en la farmacia "{}". Por favor, modifique el nombre del producto.'.format(
                                nombre_producto, farmacia_producto
                            )
                        )
                    else:
                        form.save()
                        messages.success(
                            request, 'Producto agregado satisfactoriamente!')
                        return redirect('medicinal')
                else:
                    print(form.errors)
                    messages.error(
                        request, 'Verifique el nombre y los datos correspondientes al producto.')
        except IntegrityError as e:
            messages.error(
                request, 'Error al agregar el producto: {}'.format(str(e)))
            print('Error al agregar el producto:', str(e))

    data = {'form': form, 'titulo': 'Agregar Producto'}
    return render(request, 'Formularios/FormMedicinal.html', data)


@login_required
@user_passes_test(adminVerify)
def modificar(request, producto_id):
    productMed = get_object_or_404(ProductMed, id=producto_id)

    if request.method == 'POST':
        form = FormProductos(request.POST, request.FILES, instance=productMed)
        try:
            if form.is_valid():
                producto_modificado = form.save()
                return redirect('productInfo', producto_id=producto_modificado.id)
            else:
                print(form.errors)
        except ValidationError as e:
            print(f'Error de validación: {e}')
        except Exception as e:
            print(f'Ocurrió un error: {e}')
    else:
        form = FormProductos(instance=productMed)

    return render(request, 'Formularios/FormMedicinal.html', {'form': form, 'producto': productMed})


@login_required
@user_passes_test(adminVerify)
def requestDelete(request, producto_id):
    producto = get_object_or_404(ProductMed, id=producto_id)
    return render(request, 'Formularios/eliminar_producto.html', {'producto': producto})


def eliminar(request, producto_id):
    producto = get_object_or_404(ProductMed, id=producto_id)

    if request.method == 'GET':
        producto.delete()
        return redirect('medicinal')


# CRUD Gastronomico

def agregarGastronomico(request):
    form = FormGastronomia()

    if request.method == 'POST':
        form = FormGastronomia(request.POST, request.FILES)
        try:
            with transaction.atomic():
                if form.is_valid():
                    nombre_producto = form.cleaned_data['nombre']
                    descripcion_producto = form.cleaned_data['descripcion']

                    existing_product = ProductGas.objects.filter(
                        nombre=nombre_producto, descripcion=descripcion_producto).exists()

                    if existing_product:
                        messages.error(
                            request,
                            'Ya existe un producto gastronómico con el nombre "{}". Por favor, modifique el nombre del producto.'.format(
                                nombre_producto
                            )
                        )
                    else:
                        form.save()
                        messages.success(
                            request, 'Producto gastronómico agregado con éxito!')
                        return redirect('gastronomico')
                else:
                    print(form.errors)
                    messages.error(
                        request, form.errors)
        except IntegrityError as e:
            messages.error(
                request, 'Error al agregar el producto {}'.format(str(e)))
            print('Error al agregar el producto gastronómico:', str(e))

    data = {'form': form, 'titulo': 'Agregar Producto Gastronómico'}
    return render(request, 'Formularios/FormGastronomico.html', data)


@login_required
@user_passes_test(adminVerify)
def requestDeleteGas(request, producto_id):
    producto = get_object_or_404(ProductGas, id=producto_id)
    return render(request, 'Formularios/eliminarGastronomico.html', {'producto': producto})


def eliminarGastronomico(request, producto_id):
    producto = get_object_or_404(ProductGas, id=producto_id)

    if request.method == 'GET':
        producto.delete()
        return redirect('gastronomico')


@login_required
@user_passes_test(adminVerify)
def modificarGastronomico(request, producto_id):
    productGas = get_object_or_404(ProductGas, id=producto_id)

    if request.method == 'POST':
        form = FormGastronomia(
            request.POST, request.FILES, instance=productGas)
        try:
            if form.is_valid():
                producto_modificado = form.save()
                return redirect('productInfoGas', producto_id=producto_modificado.id)
            else:
                print(form.errors)
        except ValidationError as e:
            print(f'Error de validación: {e}')
        except Exception as e:
            print(f'Ocurrió un error: {e}')
    else:
        form = FormGastronomia(instance=productGas)

    return render(request, 'Formularios/FormGastronomico.html', {'form': form, 'productoGas': productGas})
