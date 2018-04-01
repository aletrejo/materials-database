from django.urls import path
from . import views
urlpatterns = [
    path('', views.index, name="index"),
]

# admin.site.site_header = 'NYUAD Material Database Admin Panel'
# admin.site.site_title = 'NYUAD Material Database Admin Panel'
