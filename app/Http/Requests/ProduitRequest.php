<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Validation\Rule;

class ProduitRequest extends FormRequest
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

        return [
            'selectTaille' => [
                'nullable',
                Rule::exists('produitcontienttaille', 'idtailleproduit')
                    ->where('idproduit', $produit->idproduit)
            ],
            'selectCouleur' => [
                'nullable',
                Rule::exists('variantecouleurproduit', 'idcouleur')
                    ->where('idproduit', $produit->idproduit)
            ]
        ];
    }
}
