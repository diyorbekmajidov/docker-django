from django.contrib import admin
from .models import Category

# Register your models here.

@admin.register(Category)
class CategoryAdmin(admin.ModelAdmin):
    list_display = ("name", "parent", "is_active", "level")
    search_fields = ("name", "slug")
    prepopulated_fields = {"slug": ("name",)}