<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class ServiceVenteProduitRequest extends FormRequest
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
            'titreproduit' => 'required|string',
            'descriptionproduit' => 'required|string',

            'categories' => 'nullable|array',
            'categories.*' => 'nullable|exists:categorieproduit,idcategorieproduit',

            'tailles' => 'nullable|array',
            'tailles.*' => 'nullable|exists:tailleproduit,idtailleproduit',
        ];
    }
}
