@extends('componentes.master')

@section('titulo','Configurações do Usuário')
@section('Home','Configurações do Usuário')

@section('corpo')

    <div class="d-flex justify-content-center mb-2">
        <img src="{{(auth()->user()->urlImage!=null ? asset('storage/' . auth()->user()->urlImage) : asset('assets/userProfile.png'))}}" onerror="this.onerror=null; this.src='{{ asset('assets/userProfile.png') }}';" class="rounded-circle shadow border border-2 border-opacity-25 border-white" width="150" height="150" style="object-fit: cover;">
    </div>

    <div class="d-flex justify-content-center mb-2" >
        <span class="text-white text-truncate text-center" style='font-size:1.5rem;width:90%;'>{{auth()->user()->user_name}}</span>
    </div>

    <div class="d-flex justify-content-center mb-4" >

        <div class="card p-4 rounded-4 shadow" style="background-color: #1b1437!important;width:90%">
        
            <div class="d-flex flex-column align-items-start mb-4">
                <h4 class="mb-0 fw-bold text-light">Informações da conta</h4>
                <p class="text-muted small">Atualize as informações da sua conta a qualquer momento!</p>
            </div>
        
            <form action="{{ route('profile.update') }}" method="POST" enctype="multipart/form-data">
                @csrf
                @method('patch')
                <div class="row g-4">
                    <div class="col-12 col-md-6">
                        <label for="user_name" class="form-label text-light small fw-bold">Nome do Usuário</label>
                        <input required type="text" 
                            class="form-control @error('user_name') is-invalid @enderror" 
                            id="user_name" 
                            name="user_name" 
                            value="{{ old('user_name')??auth()->user()->user_name }}"
                            style="background-color: rgba(255,255,255,0.07)!important;" 
                            placeholder='Ex: João_silva'>
                        @error('user_name')
                            <div class="invalid-feedback">
                                {{ $message }}
                            </div>
                        @enderror
                    </div>

                    <div class="col-12 col-md-6">
                        <label for="name" class="form-label text-light small fw-bold">Nome Completo</label>
                        <input required type="text" 
                            class="form-control @error('name') is-invalid @enderror" 
                            id="name" 
                            name="name" 
                            value="{{ old('name')??auth()->user()->name }}"
                            style="background-color: rgba(255,255,255,0.07)!important;" 
                            placeholder='Seu nome'>
                        @error('name')
                            <div class="invalid-feedback">
                                {{ $message }}
                            </div>
                        @enderror
                    </div>
                    
                    <div class="col-12 col-md-6">
                        <label for="email" class="form-label text-light small fw-bold">E-mail</label>
                        <input required type="email" 
                            class="form-control @error('email') is-invalid @enderror" 
                            id="email" 
                            name="email" 
                            value="{{ old('email')??auth()->user()->email }}"
                            style="background-color: rgba(255,255,255,0.07)!important;" 
                            placeholder='nome@exemplo.com'>
                        @error('email')
                            <div class="invalid-feedback">
                                {{ $message }}
                            </div>
                        @enderror
                    </div>

                    <div class="col-12 col-md-6">
                        <label for="idade" class="form-label text-light small fw-bold">Idade</label>
                        <input type="number" 
                            class="form-control @error('idade') is-invalid @enderror" 
                            id="idade" 
                            name="idade" 
                            value="{{ old('idade')??auth()->user()->idade }}"
                            style="background-color: rgba(255,255,255,0.07)!important;" 
                            placeholder='Idade'>
                        @error('idade')
                            <div class="invalid-feedback">
                                {{ $message }}
                            </div>
                        @enderror
                    </div>

                    <div class="col-12 col-md-6">
                        <label for="cidadeMora" class="form-label text-light small fw-bold">Cidade onde mora</label>
                        <input type="text" 
                            class="form-control @error('cidadeMora') is-invalid @enderror" 
                            id="cidadeMora" 
                            name="cidadeMora" 
                            value="{{ old('cidadeMora')??auth()->user()->cidadeMora }}"
                            style="background-color: rgba(255,255,255,0.07)!important;" 
                            placeholder='Sua cidade'>
                        @error('cidadeMora')
                            <div class="invalid-feedback">
                                {{ $message }}
                            </div>
                        @enderror
                    </div>

                    <div class="col-12 col-md-6">
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

                    <div class='d-flex flex-row justify-content-end align-items-center gap-2 mt-5'>
                        @if(session()->has('status'))
                            <p class="m-0 fw-bold text-success text-center">{{session()->get('status')}}</p>
                        @endif
                        <button type="submit" class="btn text-white" style="background-color: rgb(92, 101, 192) !important;">Salvar Alterações</button>
                    </div>
                </div>
                
            </form>

        </div>

    </div>

    <div class="d-flex justify-content-center mb-4" >

        <div class="card p-4 rounded-4 shadow" style="background-color: #1b1437!important;width:90%">
        
            <div class="d-flex flex-column align-items-start mb-4">
                <h4 class="mb-0 fw-bold text-light">Atualize sua senha</h4>
                <p class="text-muted small">Garanta que sua conta esta usando uma senha longa e aleatoria para continuar seguro!</p>
            </div>
        
            <form action="{{ route('password.update') }}" method="POST">
                @csrf
                @method('put')
                <div class="row g-4">
                
                    <div class="col-12 col-md-6">
                        <label for="password" class="form-label text-light small fw-bold">Nova senha</label>
                        <input required type="password" 
                            class="form-control @error('password', 'updatePassword') is-invalid @enderror" 
                            id="password" 
                            name="password" 
                            style="background-color: rgba(255,255,255,0.07)!important;" 
                            placeholder='Crie uma senha forte'>
                        @error('password', 'updatePassword')
                            <div class="invalid-feedback">
                                {{ $message }}
                            </div>
                        @enderror
                    </div>

                    <div class="col-12 col-md-6">
                        <label for="password_confirmation" class="form-label text-light small fw-bold">Confirme a Senha</label>
                        <input required type="password" 
                            class="form-control @error('password_confirmation', 'updatePassword') is-invalid @enderror" 
                            id="password_confirmation" 
                            name="password_confirmation" 
                            style="background-color: rgba(255,255,255,0.07)!important;" 
                            placeholder='Digite a mesma senha' >
                        @error('password_confirmation', 'updatePassword')
                            <div class="invalid-feedback">
                                {{ $message }}
                            </div>
                        @enderror
                    </div>

                    <div class="col-12 col-md-6">
                        <label for="current_password" class="form-label text-light small fw-bold">Senha atual</label>
                        <input required type="password" 
                            class="form-control @error('current_password', 'updatePassword') is-invalid @enderror" 
                            id="current_password" 
                            name="current_password" 
                            style="background-color: rgba(255,255,255,0.07)!important;" 
                            placeholder='Digite a mesma senha' >
                        @error('current_password', 'updatePassword')
                            <div class="invalid-feedback">
                                {{ $message }}
                            </div>
                        @enderror
                    </div>

                    <div class='d-flex flex-row justify-content-end align-items-center gap-2 mt-5'>
                        @if(session()->has('status2'))
                            <p class="m-0 fw-bold text-success text-center">{{session()->get('status2')}}</p>
                        @endif
                        <button type="submit" class="btn text-white" style="background-color: rgb(92, 101, 192) !important;">Salvar Alterações</button>
                    </div>
                </div>
                
            </form>

        </div>

    </div>

    <div class="d-flex justify-content-center mb-2">

        <div class="card p-4 rounded-4 shadow" style="background-color: #1b1437 !important; width: 90%; border: 1px solid rgba(220, 53, 69, 0.4) !important;">
        
            <div class="d-flex flex-column align-items-start mb-3">
                <h4 class="mb-1 fw-bold text-light">Deletar sua Conta</h4>
                <p class="text-muted small mb-0 col-12 col-md-8" style="line-height: 1.6;">
                    Assim que sua conta for excluída, todos os seus recursos e dados serão apagados permanentemente. Antes de excluir sua conta, baixe quaisquer dados ou informações que você deseja manter!
                </p>
            </div>
        
            <div class="d-flex justify-content-start align-items-center">
                <button type="button" class="btn btn-danger fw-bold px-4 rounded-3 shadow-sm" data-bs-toggle="modal" data-bs-target="#confirmUserDeletionModal">
                    Deletar Conta
                </button>
            </div>

        </div>

    </div>

    <div class="modal fade" id="confirmUserDeletionModal" tabindex="-1" aria-labelledby="confirmUserDeletionModalLabel" aria-hidden="true" data-bs-theme="dark">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content border-0 rounded-4 shadow-lg" style="background-color: #1b1437;">
                
                <form method="POST" action="{{ route('profile.destroy') }}" class="m-0">
                    @csrf
                    @method('delete')

                    <div class="modal-header border-0 pb-0">
                        <h5 class="modal-title fw-bold text-light" id="confirmUserDeletionModalLabel">Você tem certeza que deseja excluir sua conta?</h5>
                        <button type="button" class="btn-close shadow-none" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>

                    <div class="modal-body py-3">
                        <p class="text-muted small mb-4" style="line-height: 1.5;">
                            Assim que sua conta for excluída, todos os seus recursos e dados serão apagados permanentemente. Por favor, insira sua senha para confirmar que gostaria de excluir permanentemente sua conta.
                        </p>

                        <div class="mb-2">
                            <label for="password" class="form-label text-light small fw-bold">Sua Senha</label>
                            <input required type="password" 
                                class="form-control @error('userDeletion', 'password') is-invalid @enderror py-2 text-white" 
                                id="password" 
                                name="password" 
                                style="background-color: rgba(255,255,255,0.06); border: 1px solid rgba(255,255,255,0.1);" 
                                placeholder="Digite sua senha para confirmar">
                            
                            @if ($errors->userDeletion->has('password'))
                                <div class="invalid-feedback d-block">
                                    {{ $errors->userDeletion->first('password') }}
                                </div>
                            @endif
                        </div>
                    </div>

                    <div class="modal-footer border-0 pt-0 gap-2">
                        <button type="button" class="btn btn-secondary px-4 rounded-3" data-bs-dismiss="modal">
                            Cancelar
                        </button>
                        <button type="submit" class="btn btn-danger px-4 rounded-3 fw-bold">
                            Excluir Conta
                        </button>
                    </div>

                </form>

            </div>
        </div>
    </div>

    @if ($errors->userDeletion->isNotEmpty())
        @push('scripts')
        <script>
            document.addEventListener("DOMContentLoaded", function() {
                var myModal = new bootstrap.Modal(document.getElementById('confirmUserDeletionModal'));
                myModal.show();
            });
        </script>
        @endpush
    @endif

    

@endsection