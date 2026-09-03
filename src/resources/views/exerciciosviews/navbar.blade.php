<nav class="app-header navbar navbar-expand" data-bs-theme="dark" style="background-color: #130D26 !important;">
    <div class="container-fluid" >
        <ul class="navbar-nav ">
            <li class="nav-item d-none d-md-block" >
                <a class="nav-link text-white">@yield('Home','Home')</a>
            </li>
         </ul>
         <ul class="navbar-nav">
            <li class="nav-item">
                <a href="{{route('admin.dashboard')}}" class="nav-link text-white" >
                    <p>Gerenciar Usuários</p>
                </a>
            </li>
         </ul>
         <ul class="navbar-nav border-bottom border-white">
            <li class="nav-item">
                <a href="{{route('exercicio.index')}}" class="nav-link text-white" >
                    <p>Gerenciar Exercícios Cadastrados</p>
                </a>
            </li>
         </ul>
         <ul class="navbar-nav ms-auto"> 
            
            <li class="nav-item">
                <div class="dropdown">
                    <a class="nav-link text-white d-flex align-items-center gap-2" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                        Sair <i class="bi d-flex align-items-center bi-box-arrow-right"></i>
                    </a>

                    <ul class="dropdown-menu dropdown-menu-end " style="background-color: #2d1b4d;">
                        <li>
                            <form method="POST" action="{{ route('logout') }}">
                                @csrf
                                <button type="submit" class="dropdown-item text-white rounded-2 text-center">
                                    Log out
                                </button>
                            </form>
                        </li>
                    </ul>
                </div>
            </li>
        </ul>
    </div>
</nav>