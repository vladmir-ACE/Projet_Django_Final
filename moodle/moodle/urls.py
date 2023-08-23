"""
URL configuration for moodle project.

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/4.2/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.conf import settings
from django.contrib import admin
from django.urls import path
from django.conf.urls.static import static
from projet.views import app_master_create_tache, app_master_dash, app_master_delete_tache, app_master_liste_tache, app_master_update_profile, app_master_update_tache

from projet.views import register,Login , logout_page ,app_admin,app_enseignant,app_etudiant, app_enseignant_dash, app_enseignant_create_tache, app_enseignant_liste_tache, app_etudiant_liste_tache ,app_etudiant_dash,app_enseignant_update_tache
from projet.views import app_enseignant_delete_tache ,app_etudiant_update_profile,app_enseignant_update_profile ,app_master_liste_compte, app_master_update_compte,app_master_delete_compte,Acceuil
urlpatterns = [
    path('', Acceuil),
    path('admin/', admin.site.urls),
    path('register/', register,name="register"),
    path('login/',Login , name="login" ),
    path('logout/',logout_page,name='logout'),
    #admin path
    path('master/',app_admin , name="master" ),
    path('master/dashboard/',app_master_dash, name="dashAd"),
    path('master/saveTache/',app_master_create_tache, name="SaveTacheAd"),
    path('master/ListeTache/',app_master_liste_tache, name="ListeTacheAd"),
    path('master/updateTache/<int:id>/',app_master_update_tache, name="UpdateTacheAd"),
    path('master/DeleteTache/<int:id>/',app_master_delete_tache, name="DeleteTacheAd"),
    path('master/profile/',app_master_update_profile, name="profileAd"),
    path('master/compte/',app_master_liste_compte, name="ListeCompte"),
    path('master/updateCompte/<int:id>/',app_master_update_compte, name="UpdateCompte"),
    path('master/deleteCompte/<int:id>/',app_master_delete_compte, name="DeleteCompte"),



   
    #etudiant path
    path('etudiant/',app_etudiant , name="etudiant" ),
    path('etudiant/dashboard/',app_etudiant_dash , name="dashEt" ),
    path('etudiant/ListeTache/',app_etudiant_liste_tache, name="ListeTacheEt"),
    path('etudiant/profile/',app_etudiant_update_profile, name="profileEt"),

    #enseignant path
    path('enseignant/',app_enseignant , name="enseignant" ),
    path('enseignant/dashboard/',app_enseignant_dash, name="dashEn"),
    path('enseignant/saveTache/',app_enseignant_create_tache, name="SaveTacheEn"),
    path('enseignant/ListeTache/',app_enseignant_liste_tache, name="ListeTacheEn"),
    path('enseignant/updateTache/<int:id>/',app_enseignant_update_tache, name="UpdateTacheEn"),
    path('enseignant/DeleteTache/<int:id>/',app_enseignant_delete_tache, name="DeleteTacheEn"),
    path('enseignant/profile/',app_enseignant_update_profile, name="profileEn"),

    
]

if settings.DEBUG:
    urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)
