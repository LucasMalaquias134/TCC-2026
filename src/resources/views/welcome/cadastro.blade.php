@extends('welcome.welcomemaster')

@section('titulo','Cadastro')

@section('corpo')

    <div class="card p-4 rounded-4 shadow" style="width:850px;background-color: #1b1437!important;">
    
    <div class="d-flex align-items-center mb-4">
        <a href="{{route('welcome')}}" class="text-white me-3 fs-4"><i class="bi bi-arrow-left"></i></a> 
        <h2 class="h4 mb-0 fw-bold text-light">Realize seu cadastro em segundos!</h2>
    </div>
    
    <form action="{{ route('register') }}" method="POST" enctype="multipart/form-data">
        @csrf

        <div class="row g-3">
            <div class="col-6">
                <label for="user_name" class="form-label text-light small fw-bold">Nome do Usuário</label>
                <input required type="text" 
                       class="form-control @error('user_name') is-invalid @enderror" 
                       id="user_name" 
                       name="user_name" 
                       value="{{ old('user_name') }}"
                       style="background-color: rgba(255,255,255,0.07)!important;" 
                       placeholder='Ex: João_silva'  
                       aria-describedby='userNameAjuda'>
                <div id='userNameAjuda' class="form-text text-muted">(Campo obrigatório)</div>
                @error('user_name')
                    <div class="invalid-feedback">
                        {{ $message }}
                    </div>
                @enderror
            </div>

            <div class="col-6">
                <label for="name" class="form-label text-light small fw-bold">Nome Completo</label>
                <input required type="text" 
                       class="form-control @error('name') is-invalid @enderror" 
                       id="name" 
                       name="name" 
                       value="{{ old('name') }}"
                       style="background-color: rgba(255,255,255,0.07)!important;" 
                       placeholder='Seu nome' 
                       aria-describedby='NameAjuda'>
                <div id='NameAjuda' class="form-text text-muted">(Campo obrigatório)</div>
                @error('name')
                    <div class="invalid-feedback">
                        {{ $message }}
                    </div>
                @enderror
            </div>
            
            <div class="col-6">
                <label for="email" class="form-label text-light small fw-bold">E-mail</label>
                <input required type="email" 
                       class="form-control @error('email') is-invalid @enderror" 
                       id="email" 
                       name="email" 
                       value="{{ old('email') }}"
                       style="background-color: rgba(255,255,255,0.07)!important;" 
                       placeholder='nome@exemplo.com' 
                       aria-describedby='emailAjuda'>
                <div id='emailAjuda' class="form-text text-muted">(Campo obrigatório)</div>
                @error('email')
                    <div class="invalid-feedback">
                        {{ $message }}
                    </div>
                @enderror
            </div>

            <div class="col-6">
                <label for="idade" class="form-label text-light small fw-bold">Idade</label>
                <input type="number" 
                       class="form-control @error('idade') is-invalid @enderror" 
                       id="idade" 
                       name="idade" 
                       value="{{ old('idade') }}"
                       style="background-color: rgba(255,255,255,0.07)!important;" 
                       placeholder='Idade'>
                 @error('idade')
                    <div class="invalid-feedback">
                        {{ $message }}
                    </div>
                @enderror
            </div>

            <div class="col-6">
                <label for="cidadeMora" class="form-label text-light small fw-bold">Cidade onde mora</label>
                <input type="text" 
                       class="form-control @error('cidadeMora') is-invalid @enderror" 
                       id="cidadeMora" 
                       name="cidadeMora" 
                       value="{{ old('cidadeMora') }}"
                       style="background-color: rgba(255,255,255,0.07)!important;" 
                       placeholder='Sua cidade'>
                @error('cidadeMora')
                    <div class="invalid-feedback">
                        {{ $message }}
                    </div>
                @enderror
            </div>

            <div class="col-6">
                <label for="urlImage" class="form-label text-light small fw-bold">Foto de Perfil</label>
                <input type="file" 
                       class="form-control @error('urlImage') is-invalid @enderror" 
                       id="urlImage" 
                       name="urlImage" 
                       style="background-color: rgba(255,255,255,0.07)!important;">
                @error('urlImage')
                    <div class="invalid-feedback">
                        {{ $message }}
                    </div>
                @enderror
            </div>

            <div class="col-6">
                <label for="password" class="form-label text-light small fw-bold">Senha</label>
                <input required type="password" 
                       class="form-control @error('password') is-invalid @enderror" 
                       id="password" 
                       name="password" 
                       style="background-color: rgba(255,255,255,0.07)!important;" 
                       placeholder='Crie uma senha forte' 
                       aria-describedby='senhaAjuda'>
                <div id='senhaAjuda' class="form-text text-muted">(Campo obrigatório)</div>
                @error('password')
                    <div class="invalid-feedback">
                        {{ $message }}
                    </div>
                @enderror
            </div>

            <div class="col-6">
                <label for="password_confirmation" class="form-label text-light small fw-bold">Confirme a Senha</label>
                <input required type="password" 
                       class="form-control @error('password_confirmation') is-invalid @enderror" 
                       id="password_confirmation" 
                       name="password_confirmation" 
                       style="background-color: rgba(255,255,255,0.07)!important;" 
                       placeholder='Digite a mesma senha' 
                       aria-describedby='password_confirmationHelp'>
                <div id='password_confirmationHelp' class="form-text text-muted">(Campo obrigatório)</div>
                @error('password_confirmation')
                    <div class="invalid-feedback">
                        {{ $message }}
                    </div>
                @enderror
            </div>

            <div class='d-flex justify-content-center align-items-center mt-3'>
                <button type="submit" class="btn w-100 text-white" style="background-color: rgb(92, 101, 192) !important;">Realizar cadastro</button>
            </div>
        </div>
        
    </form>
    <div class='d-flex justify-content-center align-items-center mt-3'>
        <a href="{{route('login')}}" class='text-muted text-decoration-none'>Já tenho conta</a>
    </div>

</div>

@endsection