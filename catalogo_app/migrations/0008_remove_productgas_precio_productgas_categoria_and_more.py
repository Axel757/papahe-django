# Generated by Django 4.2.7 on 2023-12-11 16:29

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('catalogo_app', '0007_alter_productmed_categoria'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='productgas',
            name='precio',
        ),
        migrations.AddField(
            model_name='productgas',
            name='categoria',
            field=models.CharField(choices=[('UNIFORMES', 'Uniformes'), ('COLORANTES', 'Colorantes'), ('HERRAMIENTAS', 'Herramienta'), ('REPOSTERIA', 'Reposteria'), ('ADITIVOS', 'Aditivos'), ('CUCHILLOS', 'Cuchillos'), ('OTROS', 'otros'), ('', 'Seleccione una categoría')], default='', max_length=50),
        ),
        migrations.AddField(
            model_name='productgas',
            name='marca',
            field=models.CharField(default=1, max_length=100),
            preserve_default=False,
        ),
        migrations.AlterField(
            model_name='productgas',
            name='nombre',
            field=models.CharField(max_length=100),
        ),
    ]
