@extends('exerciciosviews.master')

@section('titulo','Pagina admin')
@section('Home','Exercícios')

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
    @error('treino')
        <div class="alert alert-danger alert-dismissible fade show mb-2" role="alert">
            {{ $message }}
            <button type="button" class="btn-close shadow-none" data-bs-dismiss="alert" aria-label="Close"></button>
        </div>
    @enderror
    @error('grupo_muscular')
        <div class="alert alert-danger alert-dismissible fade show mb-2" role="alert">
            {{ $message }}
            <button type="button" class="btn-close shadow-none" data-bs-dismiss="alert" aria-label="Close"></button>
        </div>
    @enderror

    <form action="{{route('exercicio.index')}}" method="get">
        @csrf
        <label for="filtro" class="form-label text-light small fw-bold">Filtrar usuarios</label>
        <div class="col-12 input-group mb-3">
            <input type="text" 
                class="form-control @error('filtro') is-invalid @enderror" 
                id="filtro" 
                name="filtro" 
                value="{{ old('filtro')??request('filtro') }}"
                style="background-color: #1b1437!important;" 
                placeholder='Nome do treino ou grupo muscular ou ID ...'>
            <span class="input-group-text">
                <button type="button" class="btn shadow-none m-0 p-0 text-white" id="botaoCancelar">
                    <i class="bi bi-x-lg"></i>
                </button>
            </span>
        </div>
    </form>

    @if($exercicios->isEmpty())
        <p class="text-white text-center">Nenhum exercicio encontrado ou cadastrado!</p>
    @else
        <div class="table-responsive px-4 py-3 rounded-4 shadow-lg mb-5" style="background-color: #1b1437;"> 
            <div class="d-flex align-items-center mb-3">
                <span class="badge fs-6 px-3 py-2 rounded-3 text-white fw-bold" style="background-color: rgb(92, 101, 192);">
                    Gerenciamento de exercicios cadastrados
                </span>
            </div>

            <table class="table table-dark table-hover table-borderless align-middle " style="--bs-table-bg: transparent;"> 
                <thead> 
                    <tr class="text-muted small text-uppercase" style="border-bottom: 2px solid rgba(255, 255, 255, 0.08);">
                        <th class="text-center py-3" style="width: 10%;">ID</th>
                        <th class="ps-3 py-3" style="width: 25%;">Nome de exercicios</th>
                        <th class="py-3" style="width: 30%;">Grupo muscular</th>
                    </tr>
                </thead>
                <tbody>
                    @foreach($exercicios as $exercicio)
                        <tr style="border-bottom: 1px solid rgba(255, 255, 255, 0.04); transition: background-color 0.2s;" id="tr{{$exercicio->id}}">
                            <td class="text-center fw-bold text-muted" id="infoID">{{$exercicio->id}}</td>
                            <td class="ps-3 fw-semibold text-white" style="max-width: 250px;" id="infoTreino">{{$exercicio->treino}}</td>
                            <td class="text-white-50 small text-truncate" id="infoGrupo">{{$exercicio->grupo_muscular}}</td>
                            <td class="text-center" id="infoAcoes">
                                <button type="submit" class="btn btn-sm btn-danger text-white" id="apagar" data-bs-toggle="modal" data-bs-target="#confirma{{$exercicio->id}}">
                                    <i class="bi bi-trash3"></i>
                                </button>
                                <button type="submit" class="btn btn-sm btn-warning text-white" onclick="editar({{$exercicio->id}})" id="editar">
                                    <i class="bi bi-pencil"></i>
                                </button>
                            </td>
                        </tr>

                        <div class="modal fade" id="confirma{{$exercicio->id}}" tabindex="-1" aria-labelledby="confirmUserDeletionModalLabel" aria-hidden="true" data-bs-theme="dark">
                            <div class="modal-dialog modal-dialog-centered">
                                <div class="modal-content border-0 rounded-4 shadow-lg" style="background-color: #1b1437;">
                                    
                                    <form method="POST" action="{{route('exercicio.destroy',['exercicio'=>encrypt($exercicio->id)])}}" class="m-0">
                                        @csrf
                                        @method('delete')

                                        <div class="modal-header border-0 pb-0">
                                            <h5 class="modal-title fw-bold text-light" id="confirmUserDeletionModalLabel">Você tem certeza que deseja excluir o exercicio {{$exercicio->treino}}?</h5>
                                            <button type="button" class="btn-close shadow-none" data-bs-dismiss="modal" aria-label="Close"></button>
                                        </div>

                                        <div class="modal-body py-3">
                                            <p class="text-muted small mb-4" style="line-height: 1.5;">
                                                Assim que o exercicio for excluído, todos os seus recursos e dados serão apagados permanentemente de todas as fichas dos usuarios.
                                            </p>
                                        </div>

                                        <div class="modal-footer border-0 pt-0 gap-2">
                                            <button type="button" class="btn btn-secondary px-4 rounded-3" data-bs-dismiss="modal">
                                                Cancelar
                                            </button>
                                            <button type="submit" class="btn btn-danger px-4 rounded-3 fw-bold">
                                                Excluir exercicio
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
            @if ($exercicios->onFirstPage())
                <span class="text-muted small opacity-50">« Anterior</span>
            @else
                <a href="{{ $exercicios->previousPageUrl() }}" class="text-white text-decoration-none fw-bold">
                    « Anterior
                </a>
            @endif
            <span class="text-white-50">|</span>
            @if ($exercicios->hasMorePages())
                <a href="{{ $exercicios->nextPageUrl() }}" class="text-white text-decoration-none fw-bold">
                    Próximo »
                </a>
            @else
                <span class="text-muted small opacity-50">Próximo »</span>
            @endif
        </div>
    @endif

    <div class="position-fixed bottom-0 end-0 p-4">
        <button type="submit" class="btn bg-success rounded-4 text-white d-flex justify-content-center align-items-center pt-2" style="height:60px;width:60px;" data-bs-toggle="modal" data-bs-target="#criarExercicio">
            <div ><i class="bi bi-plus-lg fs-4 m-0"></i></div>
        </button>
    </div>

    <div class="modal fade" id="criarExercicio" tabindex="-1" aria-labelledby="criarExercicioLabel" aria-hidden="true" data-bs-theme="dark">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content border-0 rounded-4 shadow-lg" style="background-color: #1b1437;">
                
                <form method="POST" action="{{route("exercicio.store")}}" class="m-0">
                    @csrf

                    <div class="modal-header border-0 pb-0">
                        <h5 class="modal-title fw-bold text-light" id="criarExercicioLabel">Criação de novo um Exercicio </h5>
                        <button type="button" class="btn-close shadow-none" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>

                    <div class="modal-body py-3">
                        <label for="treino" class="form-label text-light small fw-bold">Nome do exercicio</label>
                        <div class="col-12 input-group mb-3">
                            <input type="text" 
                                class="form-control" 
                                id="treino" 
                                name="treino" 
                                value="{{ old('treino')??request('treino') }}"
                                style="background-color: #1b1437!important;" 
                                placeholder='Nome do exercicio' required>
                        </div>
                        <label for="grupo_muscular" class="form-label text-light small fw-bold">Grupo muscular :</label>
                        <div class="col-12 input-group mb-3">
                            <input type="text" 
                                class="form-control" 
                                id="grupo_muscular" 
                                name="grupo_muscular" 
                                value="{{ old('grupo_muscular')??request('grupo_muscular') }}"
                                style="background-color: #1b1437!important;" 
                                placeholder='Nome do grupo muscular' required>
                        </div>
                    </div>

                    <div class="modal-footer border-0 pt-0 gap-2">
                        <button type="button" class="btn btn-secondary px-4 rounded-3" data-bs-dismiss="modal">
                            Cancelar
                        </button>
                        <button type="submit" class="btn btn-primary px-4 rounded-3 fw-bold">
                            Criar novo Exercicio
                        </button>
                    </div>
                </form>

            </div>
        </div>
    </div>

    @push('scripts')
        <script>

            meuBotao = document.getElementById("botaoCancelar");
            meuInput = document.getElementById("filtro");

            meuBotao.addEventListener("click", function() {
                meuInput.value = null;
                meuBotao.closest('form').submit();
            });

            function editar(id){

                stringTR = 'tr'+id;
                meuTR = document.getElementById(stringTR);

                botoesEditar = document.querySelectorAll('#editar');
                botoesEditar.forEach((botao)=>{
                    botao.disabled = true;
                });
                botoesApagar = document.querySelectorAll('#apagar');
                botoesApagar.forEach((botao)=>{
                    botao.disabled = true;
                });

                meuForm = document.createElement('form');
                meuForm.action = "{{ route('exercicio.update', ['exercicio' => ':id']) }}".replace(':id', id);
                meuForm.method = 'POST';
                meuForm.id="meuEditarForm";
                document.body.appendChild(meuForm); 
                //---------------crsf e metodo patch --------------------------
                tokenInput = document.createElement('input');
                tokenInput.type = 'hidden';
                tokenInput.name = '_token';
                tokenInput.value = "{{ csrf_token() }}";
                meuForm.appendChild(tokenInput);

                methodInput = document.createElement('input');
                methodInput.type = 'hidden';
                methodInput.name = '_method';
                methodInput.value = 'PATCH';
                meuForm.appendChild(methodInput);
                //-------------------------------------------------------------

                console.log(meuForm);

                filhos = meuTR.children;

                Array.from(filhos).forEach(filho => {
                    switch (filho.id) {
                        case "infoTreino":
                            novoElemento = document.createElement('input');

                            novoElemento.value = filho.innerHTML;
                            novoElemento.id = filho.id; 
                            novoElemento.classList.add("form-control");
                            novoElemento.style.backgroundColor = "#1b1437";
                            novoElemento.setAttribute('form', 'meuEditarForm');
                            novoElemento.setAttribute('name', 'treino');

                            filho.replaceChildren(novoElemento);
                            break;
                        case "infoGrupo":
                            novoElemento2 = document.createElement('input');

                            novoElemento2.value = filho.innerHTML;
                            novoElemento2.id = filho.id; 
                            novoElemento2.classList.add("form-control");
                            novoElemento2.style.backgroundColor = "#1b1437";
                            novoElemento2.setAttribute('form', 'meuEditarForm');
                            novoElemento2.setAttribute('name', 'grupo_muscular');

                            filho.replaceChildren(novoElemento2);
                            break;
                        case "infoAcoes":
                            novoElemento3 = document.createElement('button');

                            novoElemento3.type = 'submit';
                            novoElemento3.classList.add('btn', 'btn-sm', 'btn-success', 'text-white','me-1');
                            novoElemento3.innerHTML = '<i class="bi bi-check-lg"></i>';

                            novoElemento3.onclick = function() {
                                meuForm.submit();
                            };

                            filho.replaceChildren(novoElemento3);

                            novoElemento4 = document.createElement('button');

                            novoElemento4.type = 'button';
                            novoElemento4.classList.add('btn', 'btn-sm', 'btn-warning', 'text-white','ms-1');
                            novoElemento4.innerHTML = '<i class="bi bi-x-lg"></i>';

                            novoElemento4.onclick = function() {
                                window.location.replace("{{route('exercicio.index')}}");
                            };

                            filho.appendChild(novoElemento4);
                            break;
                    }
                });


            }
        </script>
    @endpush

@endsection 