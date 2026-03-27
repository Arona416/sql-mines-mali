from django.db import models

class Salle(models.Model):
    nom = models.CharField(max_length=100)
    capacite = models.PositiveIntegerField()

    def __str__(self):
        return self.nom


class Spectacle(models.Model):
    titre = models.CharField(max_length=200)
    description = models.TextField()
    date_heure = models.DateTimeField()
    salle = models.ForeignKey(Salle, on_delete=models.CASCADE)

    def __str__(self):
        return self.titre
