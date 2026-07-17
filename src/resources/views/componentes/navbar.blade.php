<nav class="app-header navbar navbar-expand" data-bs-theme="dark" style="background-color: rgb(28, 11, 43) !important;">
    <div class="container-fluid" >
        <ul class="navbar-nav">
            <li class="nav-item">
                <a class="nav-link" data-lte-toggle="sidebar" href="#" role="button" >
                    <i class="bi bi-list text-white"></i>
                </a>
            </li>
            <li class="nav-item d-none d-md-block" >
                <a href="#" class="nav-link text-white">@yield('Home','Home')</a>
            </li>
         </ul>
         <ul class="navbar-nav ms-auto"> 
            <li class="nav-item">
                <div class="dropdown">
                    <a class="nav-link text-white d-flex align-items-center gap-2" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                        Sair <i class="bi bi-box-arrow-right"></i>
                    </a>

                    <ul class="dropdown-menu dropdown-menu-end shadow-lg p-3 border-0" style="background-color: #2d1b4d; min-width: 200px;">
                        <li>
                            <div class="text-center mb-2">
                                <p class="text-white small mb-1">Oque deseja fazer?</p>
                            </div>
                        </li>
                        <li><hr class="dropdown-divider border-secondary"></li>
                        <li class="d-flex justify-content-center mb-2">
                            <a class="btn btn-outline-warning" href="{{route('logout')}}" style='width: 150px;'>Log out</a>
                            <form method="POST" action="{{ route('logout') }}">
                            @csrf

                            <x-dropdown-link :href="route('logout')"
                                    onclick="event.preventDefault();
                                                this.closest('form').submit();">
                                {{ __('Log Out') }}
                            </x-dropdown-link>
                        </form>
                        </li>
                        <li class="d-flex justify-content-center mb-2">
                            <a class="btn btn-outline-danger" href="{{route('deleted')}}" style='width: 150px;'>Apagar conta</a>
                        </li>
                        <li class="d-flex justify-content-center mb-2">
                            <button class="btn btn-outline-light" data-bs-dismiss="dropdown" style='width: 150px;'>Cancelar</button>
                        </li>
                    </ul>
                </div>
            </li>
        </ul>
    </div>
</nav>

    {{-- <button class="nav-link text-white ">
        <span class="me-2 text-white">Sair</span>
        <i class="bi bi-box-arrow-right"></i>
    </button> --}}