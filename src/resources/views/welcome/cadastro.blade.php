@extends('welcome.welcomemaster')

@section('titulo','Cadastro')

@section('corpo')

    <div class="card p-4 shadow" style="width: 100%; max-width: 400px;background-color: rgb(71, 53, 143)!important;">
    
        <a href="{{route('welcome')}}" class='nav-link'> <i class='bi bi-arrow-left'></i></a>
        <h3 class="text-center">Realize seu cadastro em apenas alguns segundos!</h3>
        
        <hr class="border-2">
        
        <form action="{{route('cadastrohome')}}" method="POST">

        <div class="mb-3">
            <label for="UserName" class="form-label text-white">Nome do Usuário :</label>
            <input required type="text" class="form-control" id="UserName" style="background-color: rgb(28, 11, 43) !important;" placeholder='Nome do Usuário'  aria-describedby='userNameAjuda'>
            <div id='userNameAjuda' class="form-text">(Campo obrigatório)</div>
        </div>

        <div class="mb-3">
            <label for="Nome" class="form-label text-white">Nome :</label>
            <input required type="text" class="form-control" id="Nome" style="background-color: rgb(28, 11, 43) !important;" placeholder='Nome' aria-describedby='NameAjuda'>
            <div id='NameAjuda' class="form-text">(Campo obrigatório)</div>
        </div>
        
        <div class="mb-3">
            <label for="Email" class="form-label text-white">Email :</label>
            <input required type="email" class="form-control" id="Email" style="background-color: rgb(28, 11, 43) !important;" placeholder='Email' aria-describedby='emailAjuda'>
            <div id='emailAjuda' class="form-text">(Campo obrigatório)</div>
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
            <input required type="password" class="form-control" id="Senha" style="background-color: rgb(28, 11, 43) !important;" placeholder='Senha' aria-describedby='senhaAjuda'>
            <div id='senhaAjuda' class="form-text">(Campo obrigatório)</div>
        </div>

        <div class='d-flex justify-content-center align-items-center'>
            <button type="submit" class="btn " style="background-color: rgb(92, 101, 192) !important;" >Realizar cadrasto</button>
        </div>
    </form>
        <div class='d-flex justify-content-center align-items-center mt-3'>
            <a href="{{route('login')}}" class='icon-link'>Já tenho conta</a>
        </div>

    </div>

@endsection