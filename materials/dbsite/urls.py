from django.urls import path
from . import views
urlpatterns = [
    path('$/', views.material, name='material'),
]

admin.site.site_header = 'NYUAD Material Database Admin Panel'
admin.site.site_title = 'NYUAD Material Database Admin Panel'
