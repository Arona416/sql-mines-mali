from django.db import models
from core.models import Spectacle

class Ressource(models.Model):
    TYPE_CHOICES = [
        ('decor', 'Décor'),
        ('costume', 'Costume'),
        ('materiel', 'Matériel'),
        ('personnel', 'Personnel'),
    ]

    nom = models.CharField(max_length=200)
    type_ressource = models.CharField(max_length=20, choices=TYPE_CHOICES)
    quantite = models.PositiveIntegerField()
    disponible = models.BooleanField(default=True)


class UtilisationRessource(models.Model):
    spectacle = models.ForeignKey(Spectacle, on_delete=models.CASCADE)
    ressource = models.ForeignKey(Ressource, on_delete=models.CASCADE)
    quantite_utilisee = models.PositiveIntegerField()
