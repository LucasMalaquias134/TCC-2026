@extends('componentes.master')

@section('titulo','Configurações do Usuário')
@section('Home','Configurações do Usuário')

@section('corpo')

    <div class="d-flex justify-content-center mb-2">
        <img src="{{asset('assets/userProfile.png')}}" class="rounded-circle" width="150" height="150">
    </div>

    <div class="d-flex justify-content-center mb-2">
        <span class="text-white" style='font-size:1.5rem;'>User_name</span>
    </div>

    <hr class="border-3 " style="color: rgb(28, 11, 43) !important;">
    {{-- userName nome , Email , idade , cidade , foto , senha --}}

    <div class="d-flex justify-content-space-between align-items-center mb-4">
        <h1 class='text-white'>Mude suas informações</h1>
    </div>


    <form>

        <div class="mb-3">
            <label for="UserName" class="form-label text-white">Nome do Usuário :</label>
            <input type="text" class="form-control" id="UserName" style="background-color: rgb(28, 11, 43) !important;" placeholder='Nome do Usuário'>
        </div>

        <div class="mb-3">
            <label for="Nome" class="form-label text-white">Nome :</label>
            <input type="text" class="form-control" id="Nome" style="background-color: rgb(28, 11, 43) !important;" placeholder='Nome'>
        </div>
        
        <div class="mb-3">
            <label for="Email" class="form-label text-white">Email :</label>
            <input type="email" class="form-control" id="Email" style="background-color: rgb(28, 11, 43) !important;" placeholder='Email'>
        </div>

        <div class="mb-3">
            <label for="Idade" class="form-label text-white">Idade :</label>
            <input type="number" class="form-control" id="Idade" style="background-color: rgb(28, 11, 43) !important;" placeholder='Idade'>
        </div>

        <div class="mb-3">
            <label for="Cidade" class="form-label text-white">Cidade que nasceu :</label>
            <input type="text" class="form-control" id="Cidade" style="background-color: rgb(28, 11, 43) !important;" placeholder='Cidade que nasceu'>
        </div>

        <div class="mb-5">
            <label for="FotoPerfil" class="form-label text-white">Foto de Perfil :</label>
            <input type="file" class="form-control" id="FotoPerfil" style="background-color: rgb(28, 11, 43) !important;" placeholder='Foto de Perfil'>
        </div>

        <div class="mb-3">
            <label for="Senha" class="form-label text-white">Senha :</label>
            <input type="password" class="form-control" id="Senha" style="background-color: rgb(28, 11, 43) !important;" placeholder='Senha'>
        </div>

        
        <button type="submit" class="btn" style="background-color: rgb(92, 101, 192) !important;" >Salvar</button>
    </form>

@endsection