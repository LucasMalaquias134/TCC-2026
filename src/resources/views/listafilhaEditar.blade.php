@extends('componentesCruds.listamasterVer')

@section('titulo',"Editar ficha $ficha->name")
@section('Home',"Voltar")

@section('corpo')


    @php
        $diasSemanaCompleto = ['Segunda-Feira','Terça-Feira','Quarta-Feira','Quinta-Feira','Sexta-Feira','Sabádo','Domingo'];
        $diasSemana = ['seg' , 'ter' , 'qua' , 'qui' , 'sex' , 'sab' , 'dom'];
    @endphp

        @if(session()->has('msg'))
            <div class="alert alert-success position-absolute top-0 start-50 translate-middle-x alert-dismissible fade show mb-2 w-75 z-3" role="alert">
                {{ session()->get('msg') }}
                <button type="button" class="btn-close shadow-none" data-bs-dismiss="alert" aria-label="Close"></button>
            </div>
        @endif
        @if(session()->has('errors'))
            <div class="alert alert-danger position-absolute top-0 start-50 translate-middle-x alert-dismissible fade show mb-2 w-75 z-3" role="alert">
                <ul>
                    @foreach ($errors->all() as $error)
                        <li>{{ $error }}</li>
                    @endforeach
                </ul>
                <button type="button" class="btn-close shadow-none" data-bs-dismiss="alert" aria-label="Close"></button>
            </div>
        @endif
        
        <h2 class="mb-0 fw-bold text-white text-truncate">Editar ficha do Treino {{$ficha->name}}</h2>
        <p class="lead text-muted mb-5">Mude uma ficha de cada vez para ser mais rapido!</p>

        @for($i=0; $i<count($diasSemana); $i++)
        <form action="{{route('fichas.storar', ['ficha' => encrypt($ficha->id)])}}" method="POST" id="original">
            @csrf
            <div class="table-responsive px-4 py-3 rounded-4 shadow-lg" style="background-color: #1b1437;"> 
                <div class="d-flex align-items-center mb-3">
                    <span class="badge fs-6 px-3 py-2 rounded-3 text-white fw-bold" style="background-color: rgb(92, 101, 192);">
                        {{$diasSemanaCompleto[$i]}}
                    </span>
                </div>

                <table class="table table-dark table-hover table-borderless align-middle" style="--bs-table-bg: transparent;"> 
                    <thead> 
                        <tr class="text-muted small text-uppercase" style="border-bottom: 2px solid rgba(255, 255, 255, 0.08);">
                            <th class="text-center py-3" style="width: 8%;">Ordem</th>
                            <th class="ps-3 py-3" style="width: 25%;">Exercício</th>
                            <th class="py-3" style="width: 35%;">Descrição / Obs</th>
                            <th class="text-center py-3" style="width: 8%;">Séries</th>
                            <th class="text-center py-3" style="width: 8%;">Reps</th>
                            <th class="text-center py-3" style="width: 8%;">Carga</th>
                            <th class="text-center py-3" style="width: 8%;">Descanso</th>
                        </tr>
                    </thead>
                    <tbody>
                        @php
                            $ordem = 0;
                            $exerciciosSeparados = $ficha->exercicios->where('pivot.dias_semana', $diasSemana[$i])->sortBy('ordem');
                        @endphp

                        @foreach($exerciciosSeparados as $exercicioForEach)
                            <tr style="border-bottom: 1px solid rgba(255, 255, 255, 0.04);">
                                <td class="text-center fw-bold text-muted">{{$exercicioForEach->ordem}}</td>
                                <td class="ps-3 fw-semibold text-white">{{$exercicioForEach->treino}}</td>
                                <td class="text-white-50 small text-truncate" style="max-width: 250px;">
                                    {{$exercicioForEach->descricao ?? '----'}}
                                </td>
                                <td class="text-center"><span class="badge bg-opacity-10 bg-light text-white px-2 py-1">{{$exercicioForEach->qntdSeries}}</span></td>
                                <td class="text-center text-light">{{$exercicioForEach->qtndRep}}</td>
                                <td class="text-center text-warning fw-medium">{{ $exercicioForEach->peso ? $exercicioForEach->peso . ' kg' : '-' }}</td>
                                <td class="text-center text-info small">
                                    @if($exercicioForEach->descanso) <i class="bi bi-clock me-1"></i> {{$exercicioForEach->descanso}} @else - @endif
                                </td>
                                <td class="text-center small"> 
                                    <button type="button" 
                                            onclick="deletarExercicio('{{ encrypt($exercicioForEach->id) }}')" 
                                            class="btn btn-sm btn-outline-danger m-1" 
                                            title="Deletar">
                                        <i class="bi bi-trash3"></i>
                                    </button>
                                </td>
                            </tr>
                            @php($ordem++)
                        @endforeach

                        <tr style="border-bottom: 1px solid rgba(255, 255, 255, 0.04);">
                            <td class="text-center fw-bold text-muted" title="Ordem do exercicio">
                                    {{($ordem+1)}}
                                    <input type="hidden" id="ordem_{{$i}}" name="ordem" value="{{ ($ordem+1) }}">
                                    <input type="hidden" id="dia_{{$i}}" name="dia" value="{{$i}}">
                                </td>
                                <td class="ps-3 fw-semibold text-white" title="Nome do exercicio"> 
                                    <input type="text" 
                                        class="form-control @error('treino') is-invalid @enderror" 
                                        id="treino_{{$i}}" 
                                        name="treino" 
                                        style="background-color: rgba(255,255,255,0.07)!important;" 
                                        placeholder='Nome do exercicio'>
                                </td>
                                <td class="text-white-50 small text-truncate" style="max-width: 250px;" title="Descrição do exercicio">
                                    <input type="text" 
                                        class="form-control @error('descricao') is-invalid @enderror" 
                                        id="descricao_{{$i}}" 
                                        name="descricao" 
                                        style="background-color: rgba(255,255,255,0.07)!important;" 
                                        placeholder='Descrição do exercicio'>
                                </td>
                                <td class="text-center" title="numero de séries">
                                    <input type="number" 
                                            class="form-control @error('numero_de_series') is-invalid @enderror" 
                                            id="numero de series_{{$i}}" 
                                            name="numero de series" 
                                            style="background-color: rgba(255,255,255,0.07)!important;" 
                                            placeholder='Numero de séries'>
                                </td>
                                <td class="text-center text-light" title="Numero de repetições">
                                    <input type="number" 
                                            class="form-control @error('numero_de_repeticoes') is-invalid @enderror" 
                                            id="numero de repeticoes_{{$i}}" 
                                            name="numero de repeticoes" 
                                            style="background-color: rgba(255,255,255,0.07)!important;" 
                                            placeholder='Numero de repetições'>
                                </td>
                                <td class="text-center text-warning fw-medium" title="Peso em kg">
                                    <input type="number" step="any"
                                            class="form-control @error('peso') is-invalid @enderror" 
                                            id="peso_{{$i}}" 
                                            name="peso" 
                                            style="background-color: rgba(255,255,255,0.07)!important;" 
                                            placeholder='Peso em kg'>
                                </td>
                                <td class="text-center text-info small" title="Descanso em segundos">
                                    <input type="number" 
                                            class="form-control @error('descanso') is-invalid @enderror" 
                                            id="descanso_{{$i}}" 
                                            name="descanso" 
                                            style="background-color: rgba(255,255,255,0.07)!important;" 
                                            placeholder='Descanso em segundos'>
                                </td>
                        </tr>
                    </tbody>
                </table>
            </div>
            <div class="d-flex flex-column align-items-start mb-4 mt-3 ">
                <button type="submit" 
                class="btn text-white px-4 py-2 rounded-3 shadow-lg fw-bold" 
                style="background-color: #6E5CFF !important; max-width: 180px; font-weight: 500;">
                    Salvar alterações
                </button>
            </div>
        </form>
    @endfor

    <form id="formDeletarExercicio" action="" method="POST">
        @csrf
        @method('DELETE')
    </form>

    @push('scripts')
    <script>
        function deletarExercicio(exercicioId) {
            url = "{{ route('fichas.deletar', ['ficha' => encrypt($ficha->id), 'exercicio' => ':EXERCICIO_ID']) }}";
            url = url.replace(':EXERCICIO_ID', exercicioId);
            
            form = document.getElementById('formDeletarExercicio');
            form.action = url;
            form.submit();
        }
    </script>
    @endpush

@endsection