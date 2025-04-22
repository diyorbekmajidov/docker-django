from django.shortcuts import render

# Create your views here.
from .serializers import InventoryCategorySerializers
from inventory.models import Category
from rest_framework.viewsets import ModelViewSet,ViewSet
from rest_framework.response import Response

# class InventoryCategoryModelViewSet(ModelViewSet):
#     queryset = Category.objects.all()
#     serializers_class = InventoryCategorySerializers


class InventoryCategoryList(ViewSet):
    def list(request):
        data = Category.objects.all()
        serializer = InventoryCategorySerializers(data=data, many=True)
        return Response(serializer.data)

