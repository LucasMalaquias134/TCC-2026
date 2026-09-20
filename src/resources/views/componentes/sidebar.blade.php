<aside class="app-sidebar shadow" data-bs-theme="dark" style="background-color: #282143 !important;">
    <div class="sidebar-brand">
        <a href="{{route('welcome')}}" class="text-decoration-none">
            <span class="brand-text fw-bold" style="font-size: 1.5rem; letter-spacing: 1px;">
                Fit<span style="color:rgb(111, 149, 255) !important;">Flow</span>
            </span>
        </a>
    </div>

    <div class="sidebar-wrapper">
        <nav class="mt-2">
            <ul class="nav sidebar-menu flex-column" data-lte-toggle="treeview" role="menu">
                <li class="nav-item">
                    <div class="d-flex justify-content-center mb-2">
                        <a href="{{ route('profile.edit') }}" class="text-decoration-none">
                            @if(auth()->user()->urlImage)
                                <img src="{{ auth()->user()->urlImage }}" class="rounded-circle object-fit-cover shadow-sm border border-white border-opacity-10"style="width: 100px; height: 100px;">
                            @else
                                <div class="rounded-circle d-flex align-items-center justify-content-center text-white fw-bold fs-1 shadow-sm flex-shrink-0" 
                                    style="width: 100px; height: 100px; background-color: rgb(92, 101, 192);">
                                    {{ strtoupper(substr(auth()->user()->name, 0, 1)) }}
                                </div>
                            @endif
                        </a>
                    </div>
                </li>
                <li class="nav-item">
                    <div class="d-flex justify-content-center mb-3">
                        <a href="{{ route('profile.edit') }}" class="text-decoration-none">
                            <span class="text-white text-truncate" style='font-size:1.5rem;'>{{auth()->user()->name}}</span>
                        </a>
                    </div>
                </li>
                <li class="nav-item">
                    {{-- depois da autenticação tem que colocar o id aqui: --}}
                    <a href="{{ route('profile.edit') }}" class="nav-link text-white" >
                        <i class="nav-icon bi bi-person"></i>
                        <p>Configurações do usuário</p>
                    </a>
                </li>
                <li class="nav-item">
                    <a href="{{ route('home') }}" class="nav-link text-white" >
                        <i class="nav-icon bi bi-card-list"></i>
                        <p>Suas fichas</p>
                    </a>
                </li>

                <li class="nav-item">
                    <a href="#" class="nav-link text-white">
                        <i class="nav-icon bi bi-list-nested"></i>
                        <p>Fichas<i class="nav-arrow bi bi-chevron-right"></i></p>
                    </a>

                    <ul class="nav nav-treeview ps-3">
                        @if(auth()->user()->fichas->isEmpty())
                            <p class="text-white">Sem fichas Cadastradas! <br> Crie uma <a class="text-primary" href="{{route('fichas.create')}}">aqui</a></p>
                        @else
                            @foreach(auth()->user()->fichas as $ficha)
                                <li class="nav-item">
                                    <a href="{{ route('fichas.show',['ficha'=>encrypt($ficha->id)]) }}" class="nav-link text-white">
                                        <i class="nav-icon bi bi-table"></i>
                                        <p>{{$ficha->name}}</p>
                                    </a>
                                </li>
                            @endforeach
                        @endif
                    </ul>
                </li>
            </ul>
        </nav>
    </div>
</aside>