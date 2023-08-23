from django import forms
from django.contrib.auth import get_user_model
from django.contrib.auth.forms import UserCreationForm 
from .models import Tache

User=get_user_model()

class UserForm(UserCreationForm):
    ROLES = (
        ('etudiant', 'Étudiant'),
        ('enseignant', 'Enseignant'),
        ('admin', 'Admin'),
    )

    role = forms.ChoiceField(choices=ROLES, widget=forms.Select(attrs={'class': 'form-control'}), label='Rôle')
    first_name = forms.CharField(widget=forms.TextInput(attrs={'class': 'form-control'}), label='Prénom')
    last_name = forms.CharField(widget=forms.TextInput(attrs={'class': 'form-control'}), label='Nom')
    username = forms.CharField(widget=forms.TextInput(attrs={'class': 'form-control'}), label='Nom d\'utilisateur')
    password1 = forms.CharField(widget=forms.PasswordInput(attrs={'class': 'form-control'}), label='Mot de passe')
    password2 = forms.CharField(widget=forms.PasswordInput(attrs={'class': 'form-control'}), label='Confirmez le mot de passe')
    numero = forms.CharField(widget=forms.TextInput(attrs={'class': 'form-control'}), label='Numéro')
    date_naissance = forms.DateField(widget=forms.DateInput(attrs={'class': 'form-control', 'id': 'date_naissance'}), label='Date de naissance')


    class Meta(UserCreationForm.Meta):
        model = User
        fields = ['last_name','first_name','username','role','numero','date_naissance']


class LoginForm(forms.Form):
        username=forms.CharField(required=False,widget=forms.TextInput(attrs={'class': 'form-control'}), label='Nom d\'utilisateur')
        password = forms.CharField(widget=forms.PasswordInput(attrs={'class': 'form-control'}), label='Mot de passe')



class TacheForm(forms.ModelForm):

    STATUT = (
        ('en cours', 'en cours'),
        ('soumis', 'soumis'),
        ('corrigé', 'corrigé'),
        ('traité', 'traité'),
        ('archivé', 'archivé'),

    )
    statut = forms.ChoiceField(choices=STATUT, widget=forms.Select(attrs={'class': 'form-control'}), label='statut')
    class Meta:
        model = Tache
        fields = ['intituler', 'matiere', 'projet', 'statut']
        widgets = {
            'intituler': forms.TextInput(attrs={'class': 'form-control'}),
            'matiere': forms.TextInput(attrs={'class': 'form-control'}),
            'projet': forms.ClearableFileInput(attrs={'class': 'form-control-file'}),
            
        }


class UserUpdateForm(forms.ModelForm):
    ROLES = (
        ('etudiant', 'Étudiant'),
        ('enseignant', 'Enseignant'),
        ('admin', 'Admin'),
    )

    role = forms.ChoiceField(choices=ROLES, widget=forms.Select(attrs={'class': 'form-control'}), label='Rôle')
    first_name = forms.CharField(widget=forms.TextInput(attrs={'class': 'form-control'}), label='Prénom')
    last_name = forms.CharField(widget=forms.TextInput(attrs={'class': 'form-control'}), label='Nom')
    username = forms.CharField(widget=forms.TextInput(attrs={'class': 'form-control'}), label='Nom d\'utilisateur')
    class Meta:
        model = User
        fields = ['last_name','first_name','username','role', 'date_naissance', 'numero']
        widgets = {
            
            'date_naissance': forms.DateInput(attrs={'class': 'form-control', 'type': 'date'}),
            'numero': forms.TextInput(attrs={'class': 'form-control'}),
        }
        
