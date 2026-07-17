@extends('welcome.welcomemaster')

@section('titulo','Bem-vindo')

@section('corpo')

    <div class=" container d-flex flex-column align-items-center justify-content-center gap-4 py-4">
    
        <div class="d-flex flex-column flex-sm-row align-items-stretch align-items-sm-center justify-content-end gap-2 w-100 w-sm-auto" style="max-width: 750px;">
            <a href="{{route('login')}}" class="btn botao-outilined2" style="outline: none !important; box-shadow: none !important;">Realizar login</a>
            <a href="{{route('register')}}" class="btn botao-outilined">Fazer cadastro</a>
        </div>
        
        <div class="card rounded-4 p-4 p-md-5 shadow text-white w-100" style="max-width: 750px; background-color: #1b1437;">
            <div class="row align-items-center g-4">
                
                <div class="col-12 col-md-7 text-center text-md-start">
                    <h1 class="display-5 fw-bold">Seja bem-vindo ao <span style="color: #5c65c0;">FitFlow</span></h1>
                    <p class="lead text-muted mb-0">A sua nova plataforma para gerenciar treinos, evolução física e atingir seus objetivos de forma inteligente.</p>
                </div>
                
                <div class="col-12 col-md-5 text-center">
                    <img src="{{asset('assets/Iconemarcaredondo.png')}}" class="img-fluid" style="max-height: 200px; object-fit: contain;" alt="Logo FitFlow">
                </div>
                
            </div>
        </div>

    </div>


@endsection