<?php

namespace App\Http\Requests;

use App\Models\User;
use Illuminate\Contracts\Validation\ValidationRule;
use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Validation\Rule;

class ProfileUpdateRequest extends FormRequest
{
    /**
     * Get the validation rules that apply to the request.
     *
     * @return array<string, ValidationRule|array<mixed>|string>
     */
    public function rules(): array
    {
        return [
            'user_name' => ['required', 'string','max:255','min:3',Rule::unique(User::class)->ignore($this->user()->id)],
            'name' => ['required', 'string', 'max:255'],
            'email' => [
                'required',
                'string',
                'lowercase',
                'email',
                'max:255',
                Rule::unique(User::class)->ignore($this->user()->id),
            ],
            'idade' => ['nullable','integer','min:10','max:120'],
            'cidadeMora' => ['nullable','string','max:255','min:3'],
            'urlImage' => ['nullable','image','mimes:jpeg,png,jpg','max:2048'],
        ];
    }
}
