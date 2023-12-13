# Generated by Django 4.2.5 on 2023-12-04 23:41

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('catalogo_app', '0002_alter_productmed_nombre'),
    ]

    operations = [
        migrations.AlterField(
            model_name='productmed',
            name='categoria',
            field=models.CharField(choices=[('BAJAR DE PESO', 'Bajar de Peso'), ('RESFRIADO', 'Resfriado'), ('INFECCION URINARIA', 'Infección Urinaria'), ('MULTIVITAMÍNICOS', 'Multivitamínicos'), ('ENERGIZANTES', 'Energizantes'), ('COLON', 'Colon'), ('GÁSTRICOS', 'Gástricos'), ('ESTREÑIMIENTO', 'Estreñimiento'), ('TRANQUILIZANTES', 'Tranquilizantes'), ('INSOMNIO', 'Insomnio'), ('REUMÁTICOS', 'Reumáticos'), ('ÓSEOS', 'Óseos'), ('REGENERADORES', 'Regeneradores'), ('LIMPIADORES ORGÁNICOS', 'Limpiadores Orgánicos'), ('RENAL', 'Renal'), ('HEPATOPROTECTORES', 'Hepatoprotectores'), ('COLESTEROL Y TRIGLICÉRIDOS', 'Colesterol y Triglicéridos'), ('CONCENTRACIÓN', 'Concentración'), ('CIRCULACIÓN', 'Circulación'), ('HIPERTENSIÓN', 'Hipertensión'), ('DIABETES', 'Diabetes'), ('SALUD FEMENINA', 'Salud Femenina'), ('SALUD MASCULINA', 'Salud Masculina'), ('PRODUCTOS NATURALES', 'Productos Naturales'), ('SHAMPOO Y ACONDICIONADORES', 'Shampoo y Acondicionadores'), ('LOCIONES', 'Lociones'), ('', 'Sin Categoría')], default='', max_length=50),
        ),
    ]
