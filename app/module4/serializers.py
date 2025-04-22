from rest_framework import serializers

from inventory.models import (
    Category,
)

class InventoryCategorySerializers(serializers.ModelSerializer):
    class Meta:
        model = Category
        fields = ['id', 'parent', 'name', 'slug', 'is_active', 'level']