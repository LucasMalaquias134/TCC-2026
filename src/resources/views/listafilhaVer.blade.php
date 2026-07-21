@extends('componentesCruds.listamasterVer')

@section('titulo',"Ficha $ficha->name")
@section('Home',"Voltar")

@section('corpo')
    
    <h2 class="mb-5 px-1 fw-bold text-white text-truncate">Ficha do Treino {{$ficha->name}}</h2>

    @php
        $diasSemanaCompleto = ['Segunda-Feira','Terça-Feira','Quarta-Feira','Quinta-Feira','Sexta-Feira','Sabádo','Domingo'];
        $diasSemana = ['seg' , 'ter' , 'qua' , 'qui' , 'sex' , 'sab' , 'dom'];
        $diasSemanaFicha =collect([]);

        foreach ($ficha->exercicios as $exercicio) {
            if(!($diasSemanaFicha->contains($exercicio->pivot->dias_semana))){
                $diasSemanaFicha[]=$exercicio->pivot->dias_semana;
            }
        }
    @endphp        
    @for($i=0;$i<count($diasSemana);$i++)
        @if($diasSemanaFicha->contains($diasSemana[$i]))
            <div class="table-responsive px-4 py-3 rounded-4 shadow-lg mb-5" style="background-color: #1b1437;"> 
                <div class="d-flex align-items-center mb-3">
                    <span class="badge fs-6 px-3 py-2 rounded-3 text-white fw-bold" style="background-color: rgb(92, 101, 192);">
                        {{$diasSemanaCompleto[$i]}}
                    </span>
                </div>

                <table class="table table-dark table-hover table-borderless align-middle " style="--bs-table-bg: transparent;"> 
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
                            $exerciciosSeparados = $ficha->exercicios->where('pivot.dias_semana', $diasSemana[$i])->sortBy('ordem');
                        @endphp
                        @foreach($exerciciosSeparados as $exercicioForEach)
                            <tr style="border-bottom: 1px solid rgba(255, 255, 255, 0.04); transition: background-color 0.2s;">
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
                            </tr>
                        @endforeach
                    </tbody>
                </table>
            </div> 
        @else
            <div class="px-4 py-3 rounded-4 shadow-lg mb-5" style="background-color: #1b1437;"> 
                <div class="d-flex align-items-center mb-3">
                    <span class="badge fs-6 px-3 py-2 rounded-3 text-white fw-bold" style="background-color: rgb(92, 101, 192);">
                        {{$diasSemanaCompleto[$i]}}
                    </span>
                </div>

                <hr class="border-1 text-muted">

                <div class="d-flex align-items-center mb-3">
                    <span class="fs-3 text-white fw-bold">
                        <h1 class="w-bold">Dia de Descanso</h1>
                    </span>
                </div>

                
            </div>
        @endif
    @endfor
@endsection