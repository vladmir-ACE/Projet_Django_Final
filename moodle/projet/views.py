from django.http import HttpResponseRedirect
from django.shortcuts import get_object_or_404, redirect, render

from projet.forms import UserForm ,LoginForm,TacheForm,UserUpdateForm
from django.contrib.auth import login, authenticate ,logout
from .models import Tache ,User
from django.contrib.auth.decorators import login_required
# Create your views here.


def Acceuil(request):
    return redirect("/login/")

def register(request):

    form=UserForm()

    if request.method == "POST":
        form = UserForm(request.POST)
        if form.is_valid():
            form.save()
            return HttpResponseRedirect('/login/')
        else:
            # Afficher les erreurs dans la console
            print("Errors in form:")
            for field_name, errors in form.errors.items():
                print(f"Field: {field_name}")
                for error in errors:
                    print(f"- {error}")

    return render(request,'Auth/register.html',{'form':form})

def Login(request):
    form=LoginForm()
    message = ''
    if request.method=="POST":
        form=LoginForm(request.POST)
        if form.is_valid():
            user = authenticate(
                username=form.cleaned_data['username'],
                password=form.cleaned_data['password'],
            )
            print(user)
            if user is not None:
                login(request, user)
                if user.role == 'etudiant':
                    message = f'Bonjour, {user.username}! Vous êtes connecté.'
                    return HttpResponseRedirect('/etudiant/dashboard/')
                elif user.role == 'enseignant':
                    message = f'Bonjour, {user.username}! Vous êtes connecté.'
                    return HttpResponseRedirect('/enseignant/dashboard/')
                elif user.role == 'admin':
                    message = f'Bonjour, {user.username}! Vous êtes connecté.'
                    return HttpResponseRedirect('/master/dashboard/')
            
            else:
                message = 'Identifiants invalides.'
 
   
    return render(request,'Auth/login.html',context={'form': form, 'message': message})



def logout_page(request):
    logout(request)
    return HttpResponseRedirect('/login/')



# app master

def app_admin(request):
    return render(request,'master/index.html')
@login_required
def app_master_dash(request):
    return render(request,'master/dashboard.html',{'user': request.user})

@login_required
def app_master_create_tache(request):
    if request.method == 'POST':
        form = TacheForm(request.POST, request.FILES)
        if form.is_valid():
            form.save()
            return redirect('/master/ListeTache/')  # Rediriger vers la liste des tâches ou une autre page
    else:
        form = TacheForm()
    return render(request, 'master/G_Taches/save.html', {'form': form,'user': request.user})
@login_required
def app_master_liste_tache(request):
    taches = Tache.objects.all()  # Récupérer toutes les tâches de la base de données
    context = {'Taches': taches,'user': request.user}
    return render(request, 'master/G_Taches/liste.html', context)

@login_required
def app_master_update_tache(request, id):
    tache = get_object_or_404(Tache, id=id)

    if request.method == 'POST':
        form = TacheForm(request.POST, request.FILES, instance=tache)
        if form.is_valid():
            form.save()
            return redirect('/master/ListeTache/')  # Rediriger vers la liste des tâches ou une autre page
    else:
        form = TacheForm(instance=tache)
    return render(request, 'master/G_Taches/update.html', {'form': form,'user': request.user})


@login_required
def app_master_delete_tache(request,id):
    tache = get_object_or_404(Tache, id=id)
    tache.delete()
    return redirect('/master/ListeTache/')  # Rediriger vers la liste des tâches ou une autre page

@login_required
def app_master_update_profile(request):
    user = request.user

    if request.method == 'POST':
        form = UserUpdateForm(request.POST, instance=user)
        if form.is_valid():
            form.save()
            return redirect('/master/dashboard/')  # Rediriger vers la page d'accueil de l'étudiant ou une autre page
    else:
        form = UserUpdateForm(instance=user)
    
    return render(request, 'master/G_profil/update.html', {'form': form,'user': request.user})

@login_required
def app_master_liste_compte(request):
    users=User.objects.all()
    context = {'Users': users,'user': request.user}
    return render(request, 'master/G_Compte/liste.html', context)

@login_required
def app_master_update_compte(request, id):

    user=get_object_or_404(User, id=id)

    if request.method == 'POST':
        form = UserForm(request.POST, instance=user)  
        if form.is_valid():
            form.save()
            return redirect('/master/compte/')  
        else:
            # Afficher les erreurs dans la console
            print("Errors in form:")
            for field_name, errors in form.errors.items():
                print(f"Field: {field_name}")
                for error in errors:
                    print(f"- {error}")

    else:
        form = UserForm(instance=user)
        
     
    return render(request, 'master/G_Compte/update.html', {'form': form})


@login_required
def app_master_delete_compte(request, id):

    user=get_object_or_404(User, id=id)

    user.delete()
     
    return redirect('/master/compte/')




# app etudiant
def app_etudiant(request):
    return render(request,'etudiant/index.html')
@login_required
def app_etudiant_liste_tache(request):
    taches = Tache.objects.all()  # Récupérer toutes les tâches de la base de données
    context = {'Taches': taches,'user': request.user}
    return render(request, 'etudiant/G_Taches/liste.html', context)

@login_required
def app_etudiant_dash(request):
    return render(request,'etudiant/dashboard.html',{'user': request.user})


@login_required
def app_etudiant_update_profile(request):
    user = request.user

    if request.method == 'POST':
        form = UserUpdateForm(request.POST, instance=user)
        if form.is_valid():
            form.save()
            return redirect('/etudiant/dashboard/')  # Rediriger vers la page d'accueil de l'étudiant ou une autre page
    else:
        form = UserUpdateForm(instance=user)
    
    return render(request, 'etudiant/G_profil/update.html', {'form': form})


#app enseignant
def app_enseignant(request):
    return render(request,'enseignant/index.html')
@login_required
def app_enseignant_dash(request):
    return render(request,'enseignant/dashboard.html',{'user': request.user})

    #gestion des taches 
@login_required
def app_enseignant_create_tache(request):
    if request.method == 'POST':
        form = TacheForm(request.POST, request.FILES)
        if form.is_valid():
            form.save()
            return redirect('/enseignant/ListeTache/')  # Rediriger vers la liste des tâches ou une autre page
    else:
        form = TacheForm()
    return render(request, 'enseignant/G_Taches/save.html', {'form': form,'user': request.user})
@login_required
def app_enseignant_liste_tache(request):
    taches = Tache.objects.all()  # Récupérer toutes les tâches de la base de données
    context = {'Taches': taches,'user': request.user}
    return render(request, 'enseignant/G_Taches/liste.html', context)

@login_required
def app_enseignant_update_tache(request, id):
    tache = get_object_or_404(Tache, id=id)

    if request.method == 'POST':
        form = TacheForm(request.POST, request.FILES, instance=tache)
        if form.is_valid():
            form.save()
            return redirect('/enseignant/ListeTache/')  # Rediriger vers la liste des tâches ou une autre page
    else:
        form = TacheForm(instance=tache)
    return render(request, 'enseignant/G_Taches/update.html', {'form': form,'user': request.user})


@login_required
def app_enseignant_delete_tache(request,id):
    tache = get_object_or_404(Tache, id=id)
    tache.delete()
    return redirect('/enseignant/ListeTache/')  # Rediriger vers la liste des tâches ou une autre page


@login_required
def app_enseignant_update_profile(request):
    user = request.user

    if request.method == 'POST':
        form = UserUpdateForm(request.POST, instance=user)
        if form.is_valid():
            form.save()
            return redirect('/enseignant/dashboard/')  # Rediriger vers la page d'accueil de l'étudiant ou une autre page
    else:
        form = UserUpdateForm(instance=user)
    
    return render(request, 'enseignant/G_profil/update.html', {'form': form})




    