@extends('welcome.welcomemaster')

@section('titulo','Login')

@section('corpo')

    <div class="card p-4 shadow" style="width: 100%; max-width: 400px;background-color: rgb(71, 53, 143)!important;">
    
        <a href="{{route('welcome')}}" class='nav-link'> <i class='bi bi-arrow-left'></i></a>
        <h3 class="text-center">Faça o seu login em alguns passos!</h3>
        
        <hr class="border-2">
        
        <form action="{{route('loginhome')}}" method="POST">

            <div class="mb-3">
                <label for="login" class="form-label text-white">Preencha :</label>
                <input required type="text" class="form-control" id="login" style="background-color: rgb(28, 11, 43) !important;" placeholder='Nome do Usuário ou Email'  aria-describedby='loginAjuda'>
                <div id='userNameAjuda' class="form-text">(Campo obrigatório)</div>
            </div>

            <div class="mb-3">
                <label for="Senha" class="form-label text-white">Senha :</label>
                <input required type="password" class="form-control" id="Senha" style="background-color: rgb(28, 11, 43) !important;" placeholder='Senha' aria-describedby='senhaAjuda'>
                <div id='senhaAjuda' class="form-text">(Campo obrigatório)</div>
            </div>

            <div class='d-flex justify-content-center align-items-center'>
                <button type="submit" class="btn " style="background-color: rgb(92, 101, 192) !important;" >Realizar login</button>
            </div>
        </form>
        <div class='d-flex justify-content-center align-items-center mt-3'>
            <a href="{{route('cadastro')}}" class='icon-link'>Não tenho conta</a>
        </div>

    </div>

@endsection