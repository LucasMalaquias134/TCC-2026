@extends('componentesCruds.masterAdd')

@section('titulo',"Editar a ficha $ficha->name")
@section('Home','Voltar')

@section('corpo')

    <div class="d-flex justify-content-center align-items-center">
        <div class="card p-4 rounded-4 shadow " style="background-color: #1b1437!important;max-width:500px">
        
            <div class="d-flex flex-column align-items-center mb-4">
                <h4 class="mb-0 fw-bold text-light text-truncate text-center w-100">Editar a ficha de treino {{$ficha->name}}</h4>
                <p class="text-muted small">Obtenha seus melhores resultados!</p>
            </div>
        
            <form action="{{ route('fichas.update', ['ficha'=>encrypt($ficha->id)]) }}" method="POST">
                @csrf
                @method('patch')
                <div class="row d-flex justify-content-center g-4">
                    <div class="col-12">
                        <label for="name" class="form-label text-light small fw-bold">Nome da ficha</label>
                        <input required type="text" 
                            class="form-control @error('name') is-invalid @enderror" 
                            id="name" 
                            name="name" 
                            value="{{ old('name')??$ficha->name}}"
                            style="background-color: rgba(255,255,255,0.07)!important;" 
                            placeholder='Ex: Treino de Hipertrofia'>
                        @error('name')
                            <div class="invalid-feedback">
                                {{ $message }}
                            </div>
                        @enderror
                    </div>

                    <div class="col-12 col-md-6">
                        <label for="data_inicio" class="form-label text-light small fw-bold">Data de Inicio</label>
                        <input required type="date" 
                            class="form-control @error('data_inicio') is-invalid @enderror" 
                            id="data_inicio" 
                            name="data_inicio" 
                            value="{{ old('data_inicio')??$ficha->data_inicio->format('Y-m-d') }}"
                            style="background-color: rgba(255,255,255,0.07)!important;">
                        @error('data_inicio')
                            <div class="invalid-feedback">
                                {{ $message }}
                            </div>
                        @enderror
                    </div>

                    <div class="col-12 col-md-6">
                        <label for="data_fim" class="form-label text-light small fw-bold">Data de Fim</label>
                        <input required type="date" 
                            class="form-control @error('data_fim') is-invalid @enderror" 
                            id="data_fim" 
                            name="data_fim" 
                            value="{{ old('data_fim')??$ficha->data_fim->format('Y-m-d') }}"
                            style="background-color: rgba(255,255,255,0.07)!important;">
                        @error('data_fim')
                            <div class="invalid-feedback">
                                {{ $message }}
                            </div>
                        @enderror
                    </div>

                    <div class="col-12">
                        <label for="descricao" class="form-label">Descrição</label>
                        <textarea class="form-control @error('descricao') is-invalid @enderror" 
                        id="descricao" 
                        rows="5" 
                        name="descricao"
                        style="background-color: rgba(255,255,255,0.07)!important;"
                        placeholder="Digite sua descrição aqui...">{{old('descricao')??$ficha->descricao}}</textarea>
                        @error('descricao')
                            <div class="invalid-feedback">
                                {{ $message }}
                            </div>
                        @enderror
                    </div>

                    <button type="submit" class="btn text-white" style="background-color: rgb(92, 101, 192) !important;max-width:150px;">Atualizar ficha</button>
                
                </div>
                
            </form>

        </div>
    </div>

@endsection 