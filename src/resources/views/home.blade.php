@extends('componentes.master')

@section('titulo','Suas fichas')
@section('Home','Suas fichas')

@section('corpo')

@php
    $textos = ['0' => 'Fichas mais Novas', '1' => 'Fichas mais Velhas', '2' => 'A-Z', '3' => 'Z-A'];
    $opcaoAtual = request('ordernar')??0;
@endphp

<div class="row g-3">

    @if(session()->has('msg'))
        <div class="alert alert-success alert-dismissible fade show mb-2" role="alert">
            {{ session()->get('msg') }}
            <button type="button" class="btn-close shadow-none" data-bs-dismiss="alert" aria-label="Close"></button>
        </div>
    @endif

    <form action="{{route('fichas.index')}}" method="get">
        @csrf
        <input type="hidden" id="inputOrdernar" name="ordernar" value="{{ $opcaoAtual }}">
        <label for="filtro" class="form-label text-light small fw-bold">Filtrar Fichas</label>
        <div class="col-12 input-group mb-3">
            <input type="text" 
                class="form-control @error('filtro') is-invalid @enderror" 
                id="filtro" 
                name="filtro" 
                value="{{ old('filtro')??request('filtro') }}"
                style="background-color: rgba(255,255,255,0.07)!important;" 
                placeholder='Pesquisar... '>
            <span class="input-group-text">
                <button type="button" class="btn shadow-none m-0 p-0 text-white" id="botaoCancelar">
                    <i class="bi bi-x-lg"></i>
                </button>
            </span>
        </div>
        <div class="d-flex">
            <div class="dropdown">
                <button class="btn d-flex align-items-center gap-2 px-3 py-2 border-0 rounded-3 shadow-sm text-light font-medium" 
                    type="button" 
                    data-bs-toggle="dropdown" 
                    aria-expanded="false" 
                    style="background-color: rgba(255, 255, 255, 0.07); box-shadow: none;">
                
                <span>Ordenar Fichas por:</span>
                
                <span class="badge px-2 py-1.5 rounded-2 fw-semibold text-white" 
                    style="background-color: rgba(255, 255, 255, 0.08); font-size: 0.85rem; border: 1px solid rgba(255, 255, 255, 0.05);">
                    {{ $textos[$opcaoAtual] }}
                </span>
                
                <i class="bi bi-chevron-down small text-muted ms-1"></i>
            </button>
                <ul class="dropdown-menu dropdown-menu-end border-0 shadow" style="background-color: #2d1b4d;">
                    <li>
                        <button type="button" onclick="alterarOrdenacao('0')" name="ordernar" class="dropdown-item text-light rounded-2 btn-sm text-center">
                            Fichas mais Novas
                        </button>
                    </li>
                    <li>
                        <button type="button" onclick="alterarOrdenacao('1')" name="ordernar" class="dropdown-item text-light rounded-2 btn-sm text-center">
                            Fichas mais Velhas
                        </button>                    
                    </li>
                    <li>
                        <button type="button" onclick="alterarOrdenacao('2')" name="ordernar" class="dropdown-item text-light rounded-2 btn-sm text-center">
                            A-Z
                        </button>                    
                    </li>
                    <li>
                        <button type="button" onclick="alterarOrdenacao('3')" name="ordernar" class="dropdown-item text-light rounded-2 btn-sm text-center">
                            Z-A
                        </button>                    
                    </li>
                </ul>
            </div>
        </div>
    </form>
    @push('scripts')
        <script>
            function alterarOrdenacao(valor) {
                document.getElementById('inputOrdernar').value = valor;
                document.getElementById('inputOrdernar').closest('form').submit();
            }

            meuBotao = document.getElementById("botaoCancelar");
            meuInput = document.getElementById("filtro");

            meuBotao.addEventListener("click", function() {
                document.getElementById('inputOrdernar').value = 0;
                meuInput.value = null;
                meuBotao.closest('form').submit();
            });
        </script>
    @endpush

    <!--<div class="col-auto">

        <a href="{{-- route('lista',['numeroFicha'=>1]) --}}" style="width: 250px; background-color: #1b1437;" class="btn card rounded d-flex flex-column align-items-center p-3 text-white shadow">
            
            <h3>Ficha 1</h3>
            
            <hr class="w-100 border-light">
            
            <div class='d-flex justify-content-between align-items-center ' style='width: 100%;height: 30px;'>
                <p class='m-0'>Inicio : 20/04/2026</p>
                <p class='m-0'>Fim : 1/05/2026</p>
            </div>

            <hr class="w-100 border-light">

            <div class='d-flex justify-content-start ' style='width: 100%;'>
                <p class='m-0'>Descrição : Lorem ipsum dolor sit amet consectetur adipisicing elit. Ipsam sapiente ad praesentium earum eum sit? Voluptatum similique cupiditate nostrum at non aliquid minima iure ipsum impedit, blanditiis sit vero tempora.</p>
            </div>

        </a>
    </div>-->
    @if(auth()->user()->fichas->isEmpty())
        <p class="text-white">Olá! Parece que você ainda não tem um treino cadastrado. Comece a se exercitar clicando <a href="{{route('fichas.create')}}">aqui</a> ou no botão no canto inferior direito.</p>
    @elseif($fichas->isEmpty())
        <p class="text-white">Parece que você não tem nem um treino cadastrado com o nome '{{request('filtro')}}'. Crie um agora clicando <a href="{{route('fichas.create')}}">aqui</a> ou no botão no canto inferior direito.</p>
    @elseif($fichas->isNotEmpty())
        <div class="row g-3"> 
            @foreach($fichas as $ficha)
                <div class="col-12 col-md-6 col-xl-4">
                    <div class="card rounded-4 d-flex flex-row align-items-center p-3 shadow gap-3 text-start w-100 "
                        style="background-color: #1b1437; min-height: 150px;">
                        
                        <a href="{{-- route('lista',['numeroFicha'=>1]) --}}" class="stretched-link" style="text-decoration: none;"></a>
                        
                        <div class="flex-grow-1 text-truncate pe-2">
                            <h4 class="fw-bold text-light m-0 text-truncate" title="{{ $ficha->name }}">
                                {{ $ficha->name }}
                            </h4>
                        </div>
                        
                        <div class="d-flex text-muted small flex-column align-items-center border-start ps-3 flex-shrink-0" 
                            style="width: 60%; max-width: 240px;">
                            
                            <div class="d-flex flex-row justify-content-between align-items-center gap-2 w-100">
                                <div class="text-center">
                                    <span class="d-block text-uppercase text-muted-50" style="font-size: 0.7rem;">Início</span>
                                    <span class="text-light fw-medium">{{ $ficha->data_inicio->format('d/m/Y') }}</span>
                                </div>
                                <div class="text-center">
                                    <span class="d-block text-uppercase text-muted-50" style="font-size: 0.7rem;">Fim</span>
                                    <span class="text-light fw-medium">{{ $ficha->data_fim->format('d/m/Y') }}</span>
                                </div>
                            </div>

                            @if(filled($ficha->descricao))

                                <hr class="w-100  border-white ">

                                <div class="w-100">
                                    <p class="m-0 text-truncate text-start" title="Descrição: {{ $ficha->descricao }}">
                                        <span class="fw-bold text-light-50">Descrição:</span> {{ $ficha->descricao }}
                                    </p>
                                </div>

                            @endif
                        </div>

                        <div class="position-absolute top-0 end-0 mt-2 " style="z-index: 1;">
                            <div class="dropdown">
                                <button class="btn btn-link text-white p-1 border-0" type="button" data-bs-toggle="dropdown" aria-expanded="false" style="box-shadow: none;">
                                    <i class="bi bi-three-dots-vertical"></i>
                                </button>

                                <ul class="dropdown-menu dropdown-menu-end border-0 shadow" style="background-color: #2d1b4d;">
                                    <li>
                                        <form method="GET" action="{{ route('fichas.edit',['ficha'=>encrypt($ficha->id)]) }}" class="m-0 p-1">
                                            @csrf
                                            <button type="submit" class="dropdown-item text-warning rounded-2 btn-sm text-center">
                                                Editar Ficha <i class="bi bi-pencil-square"></i>
                                            </button>
                                        </form>
                                    </li>
                                    <li>
                                        <button type="submit" class="dropdown-item text-danger rounded-2 btn-sm text-center" data-bs-toggle="modal" data-bs-target="#confirmFichaDeletionModal{{$ficha->id}}">
                                            Apagar Ficha <i class="bi bi-trash3"></i>
                                        </button>
                                    </li>
                                </ul>
                            </div>
                        </div>

                    </div>
                </div>
                <div class="modal fade" id="confirmFichaDeletionModal{{$ficha->id}}" tabindex="-1" aria-labelledby="confirmUserDeletionModalLabel" aria-hidden="true" data-bs-theme="dark">
                    <div class="modal-dialog modal-dialog-centered">
                        <div class="modal-content border-0 rounded-4 shadow-lg" style="background-color: #1b1437;">
                            
                            <form method="POST" action="{{ route('fichas.destroy',$ficha) }}" class="m-0">
                                @csrf
                                @method('delete')

                                <div class="modal-header border-0 pb-0">
                                    <h5 class="modal-title fw-bold text-light" id="confirmUserDeletionModalLabel">Você tem certeza que deseja excluir a ficha {{$ficha->name}}?</h5>
                                    <button type="button" class="btn-close shadow-none" data-bs-dismiss="modal" aria-label="Close"></button>
                                </div>

                                <div class="modal-body py-3">
                                    <p class="text-muted small mb-4" style="line-height: 1.5;">
                                        Assim que sua ficha for excluída, todos os seus recursos e dados serão apagados permanentemente.
                                    </p>
                                </div>

                                <div class="modal-footer border-0 pt-0 gap-2">
                                    <button type="button" class="btn btn-secondary px-4 rounded-3" data-bs-dismiss="modal">
                                        Cancelar
                                    </button>
                                    <button type="submit" class="btn btn-danger px-4 rounded-3 fw-bold">
                                        Excluir Ficha
                                    </button>
                                </div>

                            </form>

                        </div>
                    </div>
                </div>
            @endforeach
        </div>
    @endif

    <div class="d-flex fixed-bottom justify-content-end p-3">
        <a href="{{route('fichas.create')}}"> 
            <div class="btn btn-primary bg-success rounded-4 text-white d-flex justify-content-center align-items-center pt-2" style="height:60px;width:60px;"><i class="bi bi-plus-lg fs-4 m-0"></i></div>
        </a>
    </div>
    
</div>

@endsection 