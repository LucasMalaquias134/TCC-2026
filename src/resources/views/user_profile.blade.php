@extends('componentes.master')

@section('titulo','Configurações do Usuário')
@section('Home','Configurações do Usuário')

@section('corpo')

    <div class="d-flex justify-content-center mb-2">
        <img src="{{($usuario->urlImage ? asset('assets/photos/' . $usuario->urlImage) : asset('assets/userProfile.png'))}}" onerror="this.onerror=null; this.src='{{ asset('assets/userProfile.png') }}';" class="rounded-circle" width="150" height="150" style="object-fit: cover;">
    </div>

    <div class="d-flex justify-content-center mb-2">
        <span class="text-white" style='font-size:1.5rem;'>User_name</span>
    </div>

    <hr class="border-3 " style="color: rgb(28, 11, 43) !important;">
    {{-- userName nome , Email , idade , cidade , foto , senha --}}

    <div class="d-flex justify-content-space-between align-items-center mb-4">
        <h1 class='text-white'>Mude suas informações</h1>
    </div>

    <form method="post" action="{{route('updateUser',['id'=>$usuario->id])}}" enctype="multipart/form-data">
        @csrf
        <div class="mb-3">
            <label for="user_name" class="form-label text-white">Nome do Usuário :</label>
            <input type="text" class="form-control" id="user_name" name="user_name" value="{{ old('user_name', $usuario->user_name) }}" style="background-color: rgb(28, 11, 43) !important;" placeholder='Nome do Usuário'>
        </div>

        <div class="mb-3">
            <label for="name" class="form-label text-white">Nome :</label>
            <input type="text" class="form-control" id="name" name="name" value="{{ old('name', $usuario->name) }}" style="background-color: rgb(28, 11, 43) !important;" placeholder='Nome'>
        </div>
        
        <div class="mb-3">
            <label for="email" class="form-label text-white">Email :</label>
            <input type="email" class="form-control" id="email" name="email" value="{{ old('email', $usuario->email) }}" style="background-color: rgb(28, 11, 43) !important;" placeholder='Email'>
        </div>

        <div class="mb-3">
            <label for="idade" class="form-label text-white">Idade :</label>
            <input type="number" class="form-control" id="idade" name="idade" value="{{ old('idade', $usuario->idade) }}" style="background-color: rgb(28, 11, 43) !important;" placeholder='Idade'>
        </div>

        <div class="mb-3">
            <label for="cidadeMora" class="form-label text-white">Cidade que mora :</label>
            <input type="text" class="form-control" id="cidadeMora" name="cidadeMora" value="{{ old('cidadeMora', $usuario->cidadeMora) }}" style="background-color: rgb(28, 11, 43) !important;" placeholder='Cidade que mora'>
        </div>

        <div class="mb-3">
            <label for="fotoPerfil" class="form-label text-white">Foto de Perfil :</label>
            <input type="file" class="form-control" id="fotoPerfil" name="fotoPerfil" value="{{ old('fotoPerfil', $usuario->urlImage) }}" style="background-color: rgb(28, 11, 43) !important;" placeholder='Foto de Perfil'>
        </div>

        <div class="mb-5">
            <label for="password" class="form-label text-white">Mudar a senha :</label>
            <input type="password" class="form-control" id="password" name="password" style="background-color: rgb(28, 11, 43) !important;" placeholder='Nova senha' >
        </div>

        <div class="mb-3">
            <label for="senhaConfirma" class="form-label text-white">Confirme sua senha antiga :</label>
            <input type="password" class="form-control" id="senhaConfirma" name="senhaConfirma" style="background-color: rgb(28, 11, 43) !important;" required>
        </div>

        
        <button type="submit" class="btn" style="background-color: rgb(92, 101, 192) !important;" onclick="return confirm('Todas as informações estão corretas?')">Salvar</button>
    </form>

@endsection