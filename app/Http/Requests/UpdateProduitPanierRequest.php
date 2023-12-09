<?php

namespace App\Http\Requests;

use App\Models\VarianteCouleurProduit;
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
        $variante = VarianteCouleurProduit::find($this->selectVariante);

        return [
            'selectVariante' => [
                'required',
                'integer',
                Rule::exists('variantecouleurproduit', 'idvariantecouleurproduit')
            ],

            'selectTaille' => [
                'required',
                'integer',
                Rule::exists('produitcontienttaille', 'idtailleproduit')
                    ->where('idproduit', $variante->idproduit)
            ]
        ];
    }
}
