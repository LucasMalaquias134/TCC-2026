@extends('admviews.master')

@section('titulo','Pagina admin')
@section('Home','Pagina admin')

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
                            </td>
                        </tr>

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