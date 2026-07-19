@extends('componentesCruds.masterAdd')

@section('titulo','Criar nova ficha')
@section('Home','Voltar')

@section('corpo')

    <div class="d-flex justify-content-center align-items-center">
        <div class="card p-4 rounded-4 shadow" style="background-color: #1b1437!important;max-width:500px">
        
            <div class="d-flex flex-column align-items-center mb-4">
                <h4 class="mb-0 fw-bold text-light">Crie uma nova ficha de treino!</h4>
                <p class="text-muted small">Prepare-se para superar seus limites</p>
            </div>
        
            <form action="{{ route('fichas.store') }}" method="POST">
                @csrf
                <div class="row d-flex justify-content-center g-4">
                    <div class="col-12">
                        <label for="name" class="form-label text-light small fw-bold">Nome da ficha</label>
                        <input required type="text" 
                            class="form-control @error('name') is-invalid @enderror" 
                            id="name" 
                            name="name" 
                            value="{{ old('name')}}"
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
                            value="{{ old('data_inicio') }}"
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
                            value="{{ old('data_fim') }}"
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
                        rows="3" 
                        name="descricao"
                        style="background-color: rgba(255,255,255,0.07)!important;"
                        placeholder="Digite sua descrição aqui...">{{ old('descricao')}}</textarea>
                        @error('descricao')
                            <div class="invalid-feedback">
                                {{ $message }}
                            </div>
                        @enderror
                    </div>

                    <button type="submit" class="btn text-white" style="background-color: rgb(92, 101, 192) !important;max-width:150px;">Criar ficha</button>
                
                </div>
                
            </form>

        </div>
    </div>

@endsection 