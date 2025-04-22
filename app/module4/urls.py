from django.urls import path
from rest_framework.routers import DefaultRouter
from .views import InventoryCategoryList

router = DefaultRouter()
router.register(r'inventory-category', InventoryCategoryList, basename=('list') )


urlpatterns = router.urls