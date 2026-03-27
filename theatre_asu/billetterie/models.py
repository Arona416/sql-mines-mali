from django.db import models
from core.models import Spectacle

class Billet(models.Model):
    STATUT_CHOICES = [
        ('libre', 'Libre'),
        ('reserve', 'Réservé'),
        ('vendu', 'Vendu'),
    ]

    spectacle = models.ForeignKey(Spectacle, on_delete=models.CASCADE)
    numero_place = models.PositiveIntegerField()
    prix = models.DecimalField(max_digits=8, decimal_places=2)
    statut = models.CharField(max_length=10, choices=STATUT_CHOICES)

    class Meta:
        unique_together = ('spectacle', 'numero_place')
