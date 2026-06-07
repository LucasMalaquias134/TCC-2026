@extends('welcome.welcomemaster')

@section('titulo','Bem-vindo')

@section('corpo')
        
    <div class="d-flex flex-column align-items-center justify-content-around card p-4 shadow" style="width: 100%; max-width: 400px;height:60vh;background-color: rgb(71, 53, 143)!important;">
        <h3 class="text-center ">Seja bem-vindo ao Fit<span style="color:rgb(111, 149, 255) !important;">Flow</span>!</h3>
        
        <div class="d-flex justify-content-center ">
            <img src="{{asset('assets/LogoMaisSombreada.png')}}"  height="100">
        </div>
        
        <p class='d-flex justify-content-center align-items-center fs-5'>Caso tenha conta, realize seu login</p>

        <div class='d-flex justify-content-center align-items-center  '>
            
            <a href="{{route('login')}}" class='btn' style="width: 200px;background-color: rgb(92, 101, 192)!important;">Realizar login</a>
        </div>

        <p class='d-flex justify-content-center align-items-center fs-5'>Caso não tenha conta, faça seu cadastro</p>

        <div class='d-flex justify-content-center align-items-center'>
            <a href="{{route('cadastro')}}" class='btn' style="width: 200px;background-color: rgb(92, 101, 192)!important;">Fazer cadastro</a>
        </div>

    </div>


@endsection