<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Validation\Rule;

class VoteRequest extends FormRequest
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
        $themevote = $this->idthemevote;

        return [
            'idthemevote' => 'required',
            'check_1' =>
                    [
                        'required',
                        Rule::exists('themevotecontientjoueur', 'idjoueur')
                            ->where('idthemevote', $themevote),

                    ],
            'check_2' =>
                    [
                        'required',
                        Rule::exists('themevotecontientjoueur', 'idjoueur')
                            ->where('idthemevote', $themevote),

                    ],
            'check_3' =>
                    [
                        'required',
                        Rule::exists('themevotecontientjoueur', 'idjoueur')
                            ->where('idthemevote', $themevote),

                    ],
        ];
    }

    public function attributes()
    {
        return [
            'check_1' => 'Rank 1',
            'check_2' => 'Rank 2',
            'check_3' => 'Rank 3'
        ];
    }
}
