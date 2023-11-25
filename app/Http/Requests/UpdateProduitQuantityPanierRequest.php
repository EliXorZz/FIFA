<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Validation\Rule;

class UpdateProduitQuantityPanierRequest extends FormRequest
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
        $idproduit = $this->idproduit;

        return [
            'idproduit' => 'required|integer|exists:produit',

            'idtailleproduit' => [
                'required',
                'integer',
                Rule::exists('produitcontienttaille', 'idtailleproduit')
                    ->where('idproduit', $idproduit)
            ],

            'idcouleur' => [
                'required',
                'integer',
                Rule::exists('variantecouleurproduit', 'idcouleur')
                    ->where('idproduit', $idproduit)
            ],

            'quantity' => 'required|integer'
        ];
    }
}
