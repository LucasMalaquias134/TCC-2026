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
                            <img src="{{(auth()->user()->urlImage!=null ? asset('storage/' . auth()->user()->urlImage) : asset('assets/userProfile.png'))}}" onerror="this.onerror=null; this.src='{{ asset('assets/userProfile.png') }}';" class="rounded-circle shadow border border-2 border-opacity-25 border-primary" width="100" height="100" style="object-fit: cover;">
                        </a>
                    </div>
                </li>
                <li class="nav-item">
                    <div class="d-flex justify-content-center mb-3">
                        <a href="{{ route('profile.edit') }}" class="text-decoration-none">
                            <span class="text-white text-truncate" style='font-size:1.5rem;'>{{auth()->user()->user_name}}</span>
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