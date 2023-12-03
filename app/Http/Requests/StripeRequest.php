<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Validation\Rule;
use Stripe\Checkout\Session;
use Stripe\Exception\ApiErrorException;

class StripeRequest extends FormRequest
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
            'session' => [
                'required',
                function ($attribute, $value, $fail) {
                    try {
                        Session::retrieve($value);
                    } catch (ApiErrorException $e) {
                        $fail("$attribute is invalid");
                    };
                }
            ],
        ];
    }
}
