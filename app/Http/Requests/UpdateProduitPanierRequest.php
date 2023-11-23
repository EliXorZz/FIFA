<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Validation\Rule;

class UpdateProduitPanierRequest extends FormRequest
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
        $idproduit = $this->selectProduit;

        return [
            'selectProduit' => 'integer|exists:produit,idproduit',

            'selectTaille' => [
                'integer',
                Rule::exists('produitcontienttaille', 'idtailleproduit')
                    ->where('idproduit', $idproduit)
            ],

            'selectCouleur' => [
                'integer',
                Rule::exists('variantecouleurproduit', 'idcouleur')
                    ->where('idproduit', $idproduit)
            ]
        ];
    }
}
