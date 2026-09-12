@extends('fichasExercicioCrud.listamasterVer')

@section('titulo',"Ficha $ficha->name")
@section('Home',"Voltar")

@section('corpo')
    
    <div class="d-flex justify-content-between align-items-center">
        <p class="mb-3 px-1 fs-3 fw-bold text-white text-truncate">{{$ficha->name}}</p>
        <ul class="navbar-nav">
            <li class="nav-item">
                <a href="{{route('ficha_exercicio.index',['ficha_exercicio'=>encrypt($ficha->id)])}}" class="btn btn-sm btn-outline-warning me-3">
                    <i class="bi bi-pencil"></i>
                </a>
            </li>
        </ul>
    </div>

    @php
        $diasSemanaCompleto = ['Segunda-Feira','Terça-Feira','Quarta-Feira','Quinta-Feira','Sexta-Feira','Sabádo','Domingo'];
        $diasSemana = ['seg' , 'ter' , 'qua' , 'qui' , 'sex' , 'sab' , 'dom'];
        $diasSemanaFicha =collect([]);
        //dd(count($ficha->exercicios));
        foreach ($ficha->exercicios as $exercicio) {
            if(!($diasSemanaFicha->contains($exercicio->pivot->dias_semana))){
                $diasSemanaFicha[]=$exercicio->pivot->dias_semana;
            }
        }
    @endphp        
    @for($i=0;$i<count($diasSemana);$i++)
        @if($diasSemanaFicha->contains($diasSemana[$i]))
            <div class="table-responsive px-4 py-3 rounded-4 shadow-lg mb-4" style="background-color: #1b1437;"> 
                <div class="d-flex align-items-center mb-3 pt-2">
                    <span class="badge fs-6 px-3 py-2 rounded-3 text-white fw-bold shadow-sm" style="background-color: rgb(92, 101, 192);">
                        <i class="bi bi-calendar3 me-2"></i>{{ $diasSemanaCompleto[$i] }}
                    </span>
                </div>

                <table class="table table-dark table-hover table-borderless align-middle m-0" style="--bs-table-bg: transparent;"> 
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
                                <td class="text-center fw-bold text-muted col-ordem">{{ $exercicioForEach->pivot->ordem }}</td>
                                <td class="ps-3 fw-semibold text-white col-treino" data-codigo="{{ $exercicioForEach->id }}">{{ $exercicioForEach->treino }}</td>
                                <td class="text-white-50 small text-truncate col-descricao" style="max-width: 250px;" title="{{ $exercicioForEach->pivot->descricao }}">
                                    {{ $exercicioForEach->pivot->descricao ?? '----' }}
                                </td>
                                <td class="text-center col-series">
                                    @if($exercicioForEach->pivot->qntdSeries) 
                                        <span class="badge bg-opacity-10 bg-light text-white px-2 py-1">{{ $exercicioForEach->pivot->qntdSeries }}</span> 
                                    @else 
                                        <span class="text-muted">-</span> 
                                    @endif
                                </td>
                                <td class="text-center text-light col-reps">{{ $exercicioForEach->pivot->qntdRep ?: '-' }}</td>
                                <td class="text-center text-warning fw-medium col-peso">
                                    {{ $exercicioForEach->pivot->peso ? $exercicioForEach->pivot->peso . ' kg' : '-' }}
                                </td>
                                <td class="text-center text-info small col-descanso">
                                    @if($exercicioForEach->pivot->descanso) 
                                        <i class="bi bi-clock me-1"></i>{{ $exercicioForEach->pivot->descanso }}s
                                    @else 
                                        <span class="text-muted">-</span> 
                                    @endif
                                </td>
                            </tr>
                        @endforeach
                    </tbody>
                </table>
            </div> 
        @else
            <div class="px-4 py-4 rounded-4 shadow-lg mb-4 text-center" style="background-color: #1b1437; border: 1px dashed rgba(255, 255, 255, 0.08);"> 
                <div class="d-flex align-items-center justify-content-between mb-2">
                    <span class="badge fs-6 px-3 py-2 rounded-3 text-white-50 fw-semibold" style="background-color: rgba(255, 255, 255, 0.05);">
                        {{ $diasSemanaCompleto[$i] }}
                    </span>
                </div>

                <div class="py-3">
                    <div class="rounded-circle d-inline-flex align-items-center justify-content-center mb-2" style="width: 50px; height: 50px; background-color: rgba(255, 255, 255, 0.04);">
                        <i class="bi bi-moon-stars text-warning fs-4"></i>
                    </div>
                    <h5 class="fw-bold text-white mb-1">Dia de Descanso</h5>
                    <p class="text-muted small mb-0">Nenhum exercício programado para hoje. Aproveite para recuperar a musculatura!</p>
                </div>
            </div>
        @endif
    @endfor
@endsection