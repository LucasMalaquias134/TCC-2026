@extends('fichasExercicioCrud.listamasterVer')

@section('titulo',"Editar ficha $ficha->name")
@section('Home',"Voltar")

@section('corpo')


    @php
        $diasSemanaCompleto = ['Segunda-Feira','Terça-Feira','Quarta-Feira','Quinta-Feira','Sexta-Feira','Sabádo','Domingo'];
        $diasSemana = ['seg' , 'ter' , 'qua' , 'qui' , 'sex' , 'sab' , 'dom'];

        $agrupados = [];
        foreach ($exercicios as $exercicio) {
            $grupo = $exercicio->grupo_muscular;
            $agrupados[$grupo][] = $exercicio;
        }

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
        
        <div class="d-flex justify-content-between align-items-center">
            <p class="mb-3 px-1 fs-3 fw-bold text-white text-truncate">{{$ficha->name}}</p>
            @if($naoEdicao == true)
            <ul class="navbar-nav">
                <li class="nav-item">
                    <a href="{{route('ficha_exercicio.index',['ficha_exercicio'=>$ficha->id])}}" class="btn btn-sm btn-outline-warning me-3">
                        <i class="bi bi-pencil"></i>
                    </a>
                </li>
            </ul>
            @else
            <ul class="navbar-nav">
                <li class="nav-item">
                    <a href="{{route('fichas.show',['ficha'=>$ficha->id])}}" class="btn btn-sm btn-warning me-3">
                        <i class="bi bi-pencil"></i>
                    </a>
                </li>
            </ul>
            @endif
        </div>

        @for($i=0; $i<count($diasSemana); $i++)
        <form action="{{route('ficha_exercicio.store', ['ficha_exercicio' => encrypt($ficha->id)])}}" method="POST" id="original">
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
                            <th class="text-center py-3" style="width: 6,6667%;">Ordem</th>
                            <th class="ps-3 py-3" style="width: 25%;">Exercício</th>
                            <th class="py-3" style="width: 35%;">Descrição / Obs</th>
                            <th class="text-center py-3" style="width: 6,6667%;">Séries</th>
                            <th class="text-center py-3" style="width: 6,6667%;">Reps</th>
                            <th class="text-center py-3" style="width: 6,6667%;">Carga</th>
                            <th class="text-center py-3" style="width: 6,6667%;">Descanso</th>
                            <th class="text-center py-3" style="width: 6,6667%;">Ações</th>
                        </tr>
                    </thead>
                    <tbody id='bodyDaTabela{{$i}}'>
                        @php
                            $ordem = 1;
                            $exerciciosSeparados = $ficha->exercicios->where('pivot.dias_semana', $diasSemana[$i])->sortBy('ordem');
                            //dd(count($exerciciosSeparados));
                        @endphp

                        @foreach($exerciciosSeparados as $exercicioForEach)
                            <tr style="border-bottom: 1px solid rgba(255, 255, 255, 0.04);">
                                <td class="text-center fw-bold text-muted" id='ordem'>{{$exercicioForEach->pivot->ordem}}</td>
                                <td class="ps-3 fw-semibold text-white" id='treino' data-codigo="{{$exercicioForEach->id}}">{{$exercicioForEach->treino}}</td>
                                <td class="text-white-50 small text-truncate" style="max-width: 250px;" id='descricao'>
                                    {{$exercicioForEach->pivot->descricao ?? '----'}}
                                </td>
                                <td class="text-center" id='qntdSeries'>@if($exercicioForEach->pivot->qntdSeries) <span class="badge bg-opacity-10 bg-light text-white px-2 py-1">{{$exercicioForEach->pivot->qntdSeries}}</span> @else - @endif </td>
                                <td class="text-center text-light" id='qntdRep'>{{$exercicioForEach->pivot->qntdRep ? $exercicioForEach->pivot->qntdRep : '-' }}</td>
                                <td class="text-center text-warning fw-medium" id='peso'>{{ $exercicioForEach->pivot->peso ? $exercicioForEach->pivot->peso . ' kg' : '-' }}</td>
                                <td class="text-center text-info small" id='descanso'>
                                    @if($exercicioForEach->pivot->descanso) <i class="bi bi-clock me-1"></i> {{$exercicioForEach->pivot->descanso}} @else - @endif
                                </td>
                                <td class="text-center small d-flex align-items-start justify-content-center" id='acoes'> 
                                    <button title="Deletar" type="button" class="btn btn-sm btn-outline-danger m-1" id="apagar" data-bs-toggle="modal" data-bs-target="#deletar{{$exercicioForEach->pivot->id}}">
                                        <i class="bi bi-trash3"></i>
                                    </button>
                                    <button type="button"  
                                            onclick="editarExercicio(this.parentElement.parentElement,{{$exercicioForEach->pivot->id}},{{$ficha->id}})" 
                                            class="btn btn-sm btn-outline-warning m-1" 
                                            id="editar"
                                            title="Editar">
                                        <i class="bi bi-pencil"></i>
                                    </button>
                                </td>
                            </tr>
                            @php($ordem++)
                        @endforeach

                        <tr id="filhoAntigoTr">
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td class="text-center"><button type='button' class="btn bg-success rounded-4 text-white" id="criar" onclick="adicionarLinha({{$i}})"><i class="bi bi-plus-lg"></i></button></td>
                        </tr>

                    </tbody>
                </table>
            </div>
            <div class="d-flex flex-column align-items-start mb-4 mt-3 ">
                <button type="submit" 
                class="btn text-white px-4 py-2 rounded-3 shadow-lg fw-bold" 
                style="background-color: #6E5CFF !important; max-width: 180px; font-weight: 500;" id='enviar'>
                    Salvar alterações
                </button>
            </div>
        </form>

        @foreach($exerciciosSeparados as $exercicioForEach)
            <div class="modal fade" id="deletar{{$exercicioForEach->pivot->id}}" tabindex="-1" aria-hidden="true" data-bs-theme="dark">
                <div class="modal-dialog modal-dialog-centered">
                    <div class="modal-content border-0 rounded-4 shadow-lg" style="background-color: #1b1437;">
                        
                        <form method="POST" action="{{route('ficha_exercicio.destroy', ['ficha_exercicio' => $exercicioForEach->pivot->id])}}" class="m-0">
                            @csrf
                            @method('delete')

                            <div class="modal-header border-0 pb-0">
                                <h5 class="modal-title fw-bold text-light">
                                    Você tem certeza que deseja excluir o exercício {{$exercicioForEach->treino}}?
                                </h5>
                                <button type="button" class="btn-close shadow-none" data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>

                            <div class="modal-footer border-0 pt-0 gap-2">
                                <button type="button" class="btn btn-secondary px-4 rounded-3" data-bs-dismiss="modal">Cancelar</button>
                                <button type="submit" class="btn btn-danger px-4 rounded-3 fw-bold">Excluir exercício</button>
                            </div>
                        </form>

                    </div>
                </div>
            </div>
        @endforeach
        
    @endfor

    @push('scripts')
    <script>
        function editarExercicio(pai,id,fichaId){
            //console.log(pai);

            trNovos = document.querySelectorAll('#trNovo')
            trNovos.forEach((tr)=>{
                tr.remove();
            });
            botoesEditar = document.querySelectorAll('#editar');
            botoesEditar.forEach((botao)=>{
                botao.disabled = true;
            });
            botoesApagar = document.querySelectorAll('#apagar');
            botoesApagar.forEach((botao)=>{
                botao.disabled = true;
            });
            botoesCriar = document.querySelectorAll('#criar');
            botoesCriar.forEach((botao)=>{
                botao.disabled = true;
            });
            botoesEnviar = document.querySelectorAll('#enviar');
            botoesEnviar.forEach((botao)=>{
                botao.disabled = true;
            });
            
            meuForm = document.createElement('form');
            meuForm.action = "{{ route('ficha_exercicio.update', ['ficha_exercicio' => ':id']) }}".replace(':id', id);
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

            filhos = pai.children;

            Array.from(filhos).forEach(filho=>{
                switch (filho.id) {
                    case 'treino':
                        valorASerGuardado = filho.dataset.codigo;
                        valorASerGuardado2 = filho.innerText;
                        filho.innerHTML = 
                        `
                        <select form='meuEditarForm' name="exercicio" class="form-select border-0 text-white" style="background-color: rgba(255, 255, 255, 0.08) !important;">
                            
                            <optgroup label="Opção Atual" style="background-color: #1b1437; color: rgb(120, 130, 230);">
                                <option value="${valorASerGuardado}" style="background-color: #1b1437; color: #ffffff;">${valorASerGuardado2}</option>    
                            </optgroup>
                            
                            @foreach ($agrupados as $grupo => $listaExercicios)
                                <optgroup label="{{ $grupo }}" style="background-color: #1b1437; color: rgb(120, 130, 230);">
                                    @foreach ($listaExercicios as $exercicio)
                                        <option value="{{ $exercicio->id }}" style="background-color: #1b1437; color: #ffffff;">
                                            {{ $exercicio->treino }}
                                        </option>
                                    @endforeach
                                </optgroup>
                            @endforeach
                        </select>
                        `;
                        break;
                
                    case 'descricao':
                        valorASerGuardado = filho.innerText;
                        filho.innerHTML = 
                        `
                            <input type="text" form='meuEditarForm' class="form-control border-0 text-white" value="${valorASerGuardado}" name="descricao" style="background-color: rgba(255,255,255,0.07)!important;" placeholder="Descrição do exercício">
                        `;
                        break;

                    case 'qntdSeries':
                        valorASerGuardado = filho.innerText.replace('-','');
                        filho.innerHTML=
                        `
                            <input type="number" form='meuEditarForm' class="form-control border-0 text-white" value='${valorASerGuardado}' name="numero_de_series" style="background-color: rgba(255,255,255,0.07)!important;" placeholder="Séries">
                        `;
                        break;

                    case 'qntdRep':
                        valorASerGuardado = filho.innerText.replace('-','');
                        filho.innerHTML=
                        `
                            <input type="number" form='meuEditarForm' value='${valorASerGuardado}' class="form-control border-0 text-white" name="numero_de_repeticoes" style="background-color: rgba(255,255,255,0.07)!important;" placeholder="Repetições">
                        `;
                        break;

                    case 'peso':
                        valorASerGuardado = filho.innerText.replace(' kg','');
                        filho.innerHTML=
                        `
                            <input type="number" form='meuEditarForm' step="any" value='${valorASerGuardado}' class="form-control border-0 text-white" name="peso" style="background-color: rgba(255,255,255,0.07)!important;" placeholder="Peso em kg">
                        `;
                        break;

                    case 'descanso':
                        valorASerGuardado = filho.innerText.replace(' ','');
                        filho.innerHTML=
                        `
                            <input type="number" form='meuEditarForm' value="${valorASerGuardado}" class="form-control border-0 text-white" name="descanso" style="background-color: rgba(255,255,255,0.07)!important;" placeholder="Descanso (s)">
                        `;
                        break;

                    case 'acoes':
                        novoElemento3 = document.createElement('button');

                        novoElemento3.type = 'button';
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
                            url = "{{route('ficha_exercicio.index',['ficha_exercicio'=> ':fichaId' ])}}".replace(':fichaId',fichaId);
                            window.location.replace(url);
                        };

                        filho.appendChild(novoElemento4);
                        break;
                }
             });

        }

        function adicionarLinha(dia) {
            antigoElementoBody = document.getElementById('bodyDaTabela' + dia);

            antigoElementoFilhoTr = antigoElementoBody.querySelector('#filhoAntigoTr');
            novoElemento = document.createElement('tr');

            numeroDeExercicios = antigoElementoBody.querySelectorAll('tr').length;
            novoElemento.id = 'trNovo';

            novoElemento.innerHTML = `
                <td class="text-center fw-bold text-muted" title="Ordem do exercicio">
                    <input type="hidden" name="dia" value="${dia}">
                    <input type="hidden" id='ordem' name="ordem[]" value="${numeroDeExercicios}"> 
                    ${numeroDeExercicios}
                </td>
                <td class="ps-3 fw-semibold text-white" title="Nome do exercicio"> 
                    <select name="exercicio[]" class="form-select border-0 text-white" style="background-color: rgba(255, 255, 255, 0.08) !important;">
                        <option value="" style="background-color: #1b1437; color: #ffffff;">Selecione um exercício</option>
                        
                        @foreach ($agrupados as $grupo => $listaExercicios)
                            <optgroup label="{{ $grupo }}" style="background-color: #1b1437; color: rgb(120, 130, 230);">
                                @foreach ($listaExercicios as $exercicio)
                                    <option value="{{ $exercicio->id }}" style="background-color: #1b1437; color: #ffffff;">
                                        {{ $exercicio->treino }}
                                    </option>
                                @endforeach
                            </optgroup>
                        @endforeach
                    </select>
                </td>
                <td class="text-white-50 small text-truncate" style="max-width: 250px;" title="Descrição do exercicio">
                    <input type="text" class="form-control border-0 text-white" name="descricao[]" style="background-color: rgba(255,255,255,0.07)!important;" placeholder="Descrição do exercício">
                </td>
                <td class="text-center" title="Número de séries">
                    <input type="number" class="form-control border-0 text-white" name="numero_de_series[]" style="background-color: rgba(255,255,255,0.07)!important;" placeholder="Séries">
                </td>
                <td class="text-center text-light" title="Número de repetições">
                    <input type="number" class="form-control border-0 text-white" name="numero_de_repeticoes[]" style="background-color: rgba(255,255,255,0.07)!important;" placeholder="Repetições">
                </td>
                <td class="text-center text-warning fw-medium" title="Peso em kg">
                    <input type="number" step="any" class="form-control border-0 text-white" name="peso[]" style="background-color: rgba(255,255,255,0.07)!important;" placeholder="Peso em kg">
                </td>
                <td class="text-center text-info small" title="Descanso em segundos">
                    <input type="number" class="form-control border-0 text-white" name="descanso[]" style="background-color: rgba(255,255,255,0.07)!important;" placeholder="Descanso (s)">
                </td>
                <td class="text-center text-info small" title="Cancelar">
                    <button type="button" id='botaoDeCancelar' class="btn btn-sm btn-danger text-white ms-1" onclick="deletarLinha(this.parentNode.parentNode,${dia})"> <i class="bi bi-x-lg"></i> </button>
                </td>
            `;

            antigoElementoBody.insertBefore(novoElemento, antigoElementoFilhoTr);
        }

        function deletarLinha(nomeTr,dia){

            pai = nomeTr.parentElement;
            nomeTr.remove();

            numeroDeTrNovos = pai.querySelectorAll('#trNovo').length;

            ordemNova = numeroDeTrNovos;

            trTodos = pai.querySelectorAll('tr');

            for (let i = 0; i < numeroDeTrNovos; i++) {
                if(trTodos[i].id!='filhoAntigoTr'){
                    trTodos[i].querySelector('#ordem').parentNode.innerHTML=
                        `<input type="hidden" name="dia" value="${dia}">
                        <input type="hidden" id='ordem' name="ordem[]" value="${i+1}"> 
                        ${i+1}`;
                }
            }
        }

    </script>
    @endpush

@endsection

{{--<tr style="border-bottom: 1px solid rgba(255, 255, 255, 0.04);">
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
                        </tr>--}}