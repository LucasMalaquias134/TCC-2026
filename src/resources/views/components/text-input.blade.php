@props(['disabled' => false])

<input @disabled($disabled) {{ $attributes->merge(['class' => 'form-control rounded-md text-white','style'=>"background-color: rgba(255,255,255,0.07)!important;"]) }}>
