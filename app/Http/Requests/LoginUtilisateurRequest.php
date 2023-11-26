<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class LoginUtilisateurRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     */
    public function authorize(): bool
    {
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array<string, \Illuminate\Contracts\Validation\ValidationRule|array<mixed>|string>
     */
    public function rules(): array
    {
        return [
            'surnomutilisateur' => 'required',
            'motpasse' => 'required'
        ];
    }

    public function attributes()
    {
        return [
            'surnomutilisateur' => 'Nom d\'utilisateur',
            'motpasse' => 'Mot de passe'
        ];
    }
}
