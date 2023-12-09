<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Support\Facades\Auth;
use Illuminate\Validation\Rule;

class UpdateUtilisateurRequest extends FormRequest
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
            'idlangue' => 'required|integer',
            'idpays' => 'required|integer',
            'idpaysfavori' => 'required|integer',

            'prenomutilisateur' => 'required|string|max:100',

            'mailutilisateur' => [
                'required',
                'email:rfc,dns',
                Rule::unique('utilisateur')->ignore(Auth::user()->idutilisateur, 'idutilisateur')
            ],

            'datenaissance' => 'required|before:today',
        ];
    }

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
        ];
    }
}
