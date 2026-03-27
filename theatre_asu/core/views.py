from rest_framework import viewsets
from .models import Spectacle
from .serializers import SpectacleSerializer

class SpectacleViewSet(viewsets.ModelViewSet):
    queryset = Spectacle.objects.all()
    serializer_class = SpectacleSerializer
