<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Validation\Rules\Password;

class RegisterUtilisateurRequest extends FormRequest
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
            'idlangue' => 'required',
            'idpays' => 'required',
            'idpaysfavori' => 'required',

            'prenomutilisateur' => 'required|max:100',
            'surnomutilisateur' => 'required|unique:utilisateur|max:100',
            'mailutilisateur' => 'required|unique:utilisateur|max:100|email:rfc,dns',
            'datenaissance' => 'required|before:today',

            'motpasse' => ['required', 'confirmed', Password::defaults()],
        ];
    }

    /**
     * Get custom attributes for validator errors.
     *
     * @return array
     */
    public function attributes()
    {
        return [
            'idlangue' => 'Langue',
            'idpays' => 'Pays',
            'idpaysfavori' => 'Pays favori',

            'prenomutilisateur' => 'Prénom',
            'surnomutilisateur' => 'Nom d\'utilisateur',
            'mailutilisateur' => 'Adresse mail',
            'datenaissance' => 'Date de naissance',

            'motpasse' => 'Mot de passe'
        ];
    }
}
