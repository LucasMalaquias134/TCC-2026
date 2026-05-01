@extends('componentes.master')

@section('titulo','Suas fichas')
@section('Home','Suas fichas')

@section('corpo')

<div class="row g-3">
    <div class="col-auto">
        <a href="{{ route('lista',['numeroFicha'=>1]) }}" style="width: 250px; background-color: rgb(92, 101, 192);" class="btn rounded d-flex flex-column align-items-center p-3 text-white shadow">
            
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
    </div>
    <div class="col-auto">
        <a href="{{ route('lista',['numeroFicha'=>2]) }}" style="width: 250px; background-color: rgb(92, 101, 192);" class="btn rounded d-flex flex-column align-items-center p-3 text-white shadow">
            
            <h3>Ficha 2</h3>
            
            <hr class="w-100 border-light">
            
            <div class='d-flex justify-content-between align-items-center ' style='width: 100%;height: 30px;'>
                <p class='m-0'>Inicio : 00/00/0000</p>
                <p class='m-0'>Fim : 30/12/9999</p>
            </div>

            <hr class="w-100 border-light">

            <div class='d-flex justify-content-start ' style='width: 100%;'>
                <p class='m-0'>Descrição : Lorem ipsum dolor sit amet consectetur</p>
            </div>

        </a>
    </div>
    
</div>

@endsection 