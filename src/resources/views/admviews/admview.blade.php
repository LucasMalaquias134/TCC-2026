@extends('admviews.master')

@section('titulo','Pagina admin')
@section('Home','Usuários')

@section('corpo')

    @if(session()->has('msg'))
        <div class="alert alert-success alert-dismissible fade show mb-2" role="alert">
            {{ session()->get('msg') }}
            <button type="button" class="btn-close shadow-none" data-bs-dismiss="alert" aria-label="Close"></button>
        </div>
    @endif
    @if(session()->has('msg2'))
        <div class="alert alert-warning alert-dismissible fade show mb-2" role="alert">
            {{ session()->get('msg2') }}
            <button type="button" class="btn-close shadow-none" data-bs-dismiss="alert" aria-label="Close"></button>
        </div>
    @endif

    <form action="{{route('admin.search')}}" method="get">
        @csrf
        <label for="filtro" class="form-label text-light small fw-bold">Filtrar usuarios</label>
        <div class="col-12 input-group mb-3">
            <input type="text" 
                class="form-control @error('filtro') is-invalid @enderror" 
                id="filtro" 
                name="filtro" 
                value="{{ old('filtro')??request('filtro') }}"
                style="background-color: #1b1437!important;" 
                placeholder='Nome, Nome de usuario, Email, ID... '>
            <span class="input-group-text">
                <button type="button" class="btn shadow-none m-0 p-0 text-white" id="botaoCancelar">
                    <i class="bi bi-x-lg"></i>
                </button>
            </span>
        </div>
    </form>

    @if($usuarios->isEmpty())
        <p class="text-white text-center">Nenhum usuario encontrado ou cadastrado!</p>
    @else
        <div class="table-responsive px-4 py-3 rounded-4 shadow-lg mb-5" style="background-color: #1b1437;"> 
            <div class="d-flex align-items-center mb-3">
                <span class="badge fs-6 px-3 py-2 rounded-3 text-white fw-bold" style="background-color: rgb(92, 101, 192);">
                    Gerenciamento de usuarios
                </span>
            </div>

            <table class="table table-dark table-hover table-borderless align-middle " style="--bs-table-bg: transparent;"> 
                <thead> 
                    <tr class="text-muted small text-uppercase" style="border-bottom: 2px solid rgba(255, 255, 255, 0.08);">
                        <th class="text-center py-3" style="width: 10%;">ID</th>
                        <th class="ps-3 py-3" style="width: 25%;">Nome de usuario</th>
                        <th class="py-3" style="width: 30%;">Nome</th>
                        <th class="text-center py-3" style="width: 25%;">Email</th>
                    </tr>
                </thead>
                <tbody>
                    @foreach($usuarios as $usuario)
                        <tr style="border-bottom: 1px solid rgba(255, 255, 255, 0.04); transition: background-color 0.2s;">
                            <td class="text-center fw-bold text-muted">{{$usuario->id}}</td>
                            <td class="ps-3 fw-semibold text-white" style="max-width: 250px;">{{$usuario->user_name}}</td>
                            <td class="text-white-50 small text-truncate">{{$usuario->name}}</td>
                            <td class="text-center">{{$usuario->email}}</td>
                            <td class="text-center">
                                <button type="submit" class="btn btn-sm btn-danger text-white" data-bs-toggle="modal" data-bs-target="#confirma{{$usuario->id}}">
                                    <i class="bi bi-trash3"></i>
                                </button>
                                <button type="submit" class="btn btn-sm btn-primary text-white" data-bs-toggle="modal" data-bs-target="#vizualiza{{$usuario->id}}">
                                    <i class="bi bi-eye"></i>
                                </button>
                            </td>
                        </tr>

                        <div class="modal fade" id="vizualiza{{$usuario->id}}" tabindex="-1" aria-labelledby="vizualizaUser{{$usuario->id}}" aria-hidden="true" data-bs-theme="dark">
                            <div class="modal-dialog modal-dialog-centered">
                                <div class="modal-content border-0 rounded-4 shadow-lg overflow-hidden" style="background-color: #1b1437;">
                                    
                                    <div class="modal-header border-0 pb-0 pt-4 px-4 d-flex align-items-center justify-content-between">
                                        <div class="d-flex align-items-center gap-3">
                                            
                                            @if($usuario->urlImage)
                                                <img src="{{ $usuario->urlImage }}" class="rounded-circle object-fit-cover shadow-sm border border-white border-opacity-10"style="width: 48px; height: 48px;">
                                            @else
                                                <div class="rounded-circle d-flex align-items-center justify-content-center text-white fw-bold fs-5 shadow-sm flex-shrink-0" 
                                                    style="width: 48px; height: 48px; background-color: rgb(92, 101, 192);">
                                                    {{ strtoupper(substr($usuario->name, 0, 1)) }}
                                                </div>
                                            @endif

                                            <div>
                                                <h5 class="modal-title fw-bold text-light mb-0" id="vizualizaUser{{$usuario->id}}">
                                                    {{ $usuario->name }}
                                                </h5>
                                                <span class="text-white-50 small">@<span>{{ $usuario->user_name }}</span></span>
                                            </div>
                                        </div>
                                        <button type="button" class="btn-close shadow-none align-self-start" data-bs-dismiss="modal" aria-label="Close"></button>
                                    </div>

                                    <div class="modal-body p-4">
                                        <div class="row g-3">
                                            <div class="col-6">
                                                <div class="p-3 rounded-3" style="background-color: rgba(255, 255, 255, 0.04);">
                                                    <div class="text-white-50 small mb-1 d-flex align-items-center gap-1">
                                                        <i class="bi bi-hash"></i> ID
                                                    </div>
                                                    <span class="fw-semibold text-white">#{{ $usuario->id }}</span>
                                                </div>
                                            </div>

                                            <div class="col-6">
                                                <div class="p-3 rounded-3" style="background-color: rgba(255, 255, 255, 0.04);">
                                                    <div class="text-white-50 small mb-1 d-flex align-items-center gap-1">
                                                        <i class="bi bi-calendar-event"></i> Idade
                                                    </div>
                                                    <span class="fw-semibold text-white">{{ $usuario->idade }} anos</span>
                                                </div>
                                            </div>

                                            <div class="col-12">
                                                <div class="p-3 rounded-3" style="background-color: rgba(255, 255, 255, 0.04);">
                                                    <div class="text-white-50 small mb-1 d-flex align-items-center gap-1">
                                                        <i class="bi bi-envelope"></i> E-mail
                                                    </div>
                                                    <span class="fw-semibold text-white text-break">{{ $usuario->email }}</span>
                                                </div>
                                            </div>

                                            <div class="col-12">
                                                <div class="p-3 rounded-3" style="background-color: rgba(255, 255, 255, 0.04);">
                                                    <div class="text-white-50 small mb-1 d-flex align-items-center gap-1">
                                                        <i class="bi bi-geo-alt"></i> Cidade
                                                    </div>
                                                    <span class="fw-semibold text-white">{{ $usuario->cidadeMora }}</span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="modal-footer border-0 p-4 pt-0">
                                        <button type="button" class="btn text-white w-100 py-2 rounded-3 fw-semibold shadow-sm" 
                                                data-bs-dismiss="modal" 
                                                style="background-color: rgb(92, 101, 192) !important;">
                                            Fechar
                                        </button>
                                    </div>

                                </div>
                            </div>
                        </div>

                        <div class="modal fade" id="confirma{{$usuario->id}}" tabindex="-1" aria-labelledby="confirmUserDeletionModalLabel" aria-hidden="true" data-bs-theme="dark">
                            <div class="modal-dialog modal-dialog-centered">
                                <div class="modal-content border-0 rounded-4 shadow-lg" style="background-color: #1b1437;">
                                    
                                    <form method="POST" action="{{route('admin.destroy',['id'=>encrypt($usuario->id)])}}" class="m-0">
                                        @csrf
                                        @method('delete')

                                        <div class="modal-header border-0 pb-0">
                                            <h5 class="modal-title fw-bold text-light" id="confirmUserDeletionModalLabel">Você tem certeza que deseja excluir o usuario {{$usuario->user_name}}?</h5>
                                            <button type="button" class="btn-close shadow-none" data-bs-dismiss="modal" aria-label="Close"></button>
                                        </div>

                                        <div class="modal-body py-3">
                                            <p class="text-muted small mb-4" style="line-height: 1.5;">
                                                Assim que o usuario for excluído, todos os seus recursos e dados serão apagados permanentemente.
                                            </p>
                                        </div>

                                        <div class="modal-footer border-0 pt-0 gap-2">
                                            <button type="button" class="btn btn-secondary px-4 rounded-3" data-bs-dismiss="modal">
                                                Cancelar
                                            </button>
                                            <button type="submit" class="btn btn-danger px-4 rounded-3 fw-bold">
                                                Excluir Usuario
                                            </button>
                                        </div>
                                    </form>

                                </div>
                            </div>
                        </div>
                    @endforeach
                </tbody>
            </table>
        </div>

        <div class="d-flex justify-content-center align-items-center gap-3 my-4">
            @if ($usuarios->onFirstPage())
                <span class="text-muted small opacity-50">« Anterior</span>
            @else
                <a href="{{ $usuarios->previousPageUrl() }}" class="text-white text-decoration-none fw-bold">
                    « Anterior
                </a>
            @endif
            <span class="text-white-50">|</span>
            @if ($usuarios->hasMorePages())
                <a href="{{ $usuarios->nextPageUrl() }}" class="text-white text-decoration-none fw-bold">
                    Próximo »
                </a>
            @else
                <span class="text-muted small opacity-50">Próximo »</span>
            @endif
        </div>
    @endif

    @push('scripts')
        <script>

            meuBotao = document.getElementById("botaoCancelar");
            meuInput = document.getElementById("filtro");

            meuBotao.addEventListener("click", function() {
                meuInput.value = null;
                meuBotao.closest('form').submit();
            });
        </script>
    @endpush

@endsection