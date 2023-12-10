<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Validation\Rule;

class ServiceVenteVarianteRequest extends FormRequest
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
        $produit = $this->produit;

        $idproduit = $produit->idproduit;
        $idcouleur = $this->idcouleur;

        return [
            'idcouleur' => [
                'required',
                'integer',
                'exists:couleur',
                Rule::unique('variantecouleurproduit')->where(function ($query) use($idproduit, $idcouleur) {
                    return $query
                        ->where('idproduit', $idproduit)
                        ->where('idcouleur', $idcouleur);
                })->ignore($idproduit, 'idproduit')
            ],

            'prix' => 'nullable|decimal:0,2',

            'images' => 'nullable|array',
            'images.*' => 'nullable|image|mimes:jpg,png,jpeg'
        ];
    }
}
