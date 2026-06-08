<aside class="app-sidebar shadow" data-bs-theme="dark" style="background-color: rgb(65, 59, 107) !important;">
    <div class="sidebar-brand">
        <span class="brand-text fw-bold" style="font-size: 1.5rem; letter-spacing: 1px;">
            Fit<span style="color:rgb(111, 149, 255) !important;">Flow</span>
        </span>
    </div>

    <div class="sidebar-wrapper">
        <nav class="mt-2">
            <ul class="nav sidebar-menu flex-column" data-lte-toggle="treeview" role="menu">
                
                <li class="nav-item">
                    {{-- depois da autenticação tem que colocar o id aqui: --}}
                    <a href="{{ route('user_profile',['id'=>encrypt(51)]) }}" class="nav-link text-white" >
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

                    <ul class="nav nav-treeview">
                        <li class="nav-item">
                            <a href="{{ route('lista',['numeroFicha'=>1]) }}" class="nav-link text-white">
                                <i class="nav-icon bi bi-table"></i>
                                <p>Ficha 1</p>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="{{ route('lista',['numeroFicha'=>2]) }}" class="nav-link text-white">
                                <i class="nav-icon bi bi-table"></i>
                                <p>Ficha 2</p>
                            </a>
                        </li>
                    </ul>
                </li>
            </ul>
        </nav>
    </div>
</aside>