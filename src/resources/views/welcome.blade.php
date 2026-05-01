@extends('welcome.welcomemaster')

@section('titulo','Bem-vindo')

@section('corpo')
        
    <div class="card p-4 shadow" style="width: 100%; max-width: 400px;background-color: rgb(71, 53, 143)!important;">
        <h3 class="text-center mb-4">Seja bem-vindo ao Fit<span style="color:rgb(111, 149, 255) !important;">Flow</span>!</h3>
        
        <div class="d-flex justify-content-center mb-2">
            <img src="{{asset('assets/LogoMaisSombreada.png')}}"  height="100">
        </div>
        
        <hr class="border-2">
        
        <p class='d-flex justify-content-center align-items-center'>Caso tenha conta, realize seu login</p>

        <div class='d-flex justify-content-center align-items-center  mb-3'>
            
            <a href="{{route('login')}}" class='btn' style="width: 50%;background-color: rgb(92, 101, 192)!important;">Realizar login</a>
        </div>

        <p class='d-flex justify-content-center align-items-center'>Caso não tenha conta, faça seu cadastro</p>

        <div class='d-flex justify-content-center align-items-center'>
            <a href="{{route('cadastro')}}" class='btn' style="width: 50%;background-color: rgb(92, 101, 192)!important;">Fazer cadastro</a>
        </div>

    </div>


@endsection