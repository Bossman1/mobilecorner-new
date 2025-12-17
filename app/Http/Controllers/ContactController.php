<?php

namespace App\Http\Controllers;

use App\Mail\SendMail;
use App\Rules\RecaptchaV3;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Mail;


class ContactController extends Controller
{
    public function index(){
        return view('pages.contact');
    }

    public function store(Request $request)
    {
        // ------------------------------
        // Validate
        // ------------------------------
        $validated = $request->validate([
            'name'    => 'required|string|max:255',
            'subject' => 'required|string|max:255',
            'phone'   => 'required|string|max:50',
            'email'   => 'required|email',
            'message' => 'required|string',
            'g-recaptcha-response' => [new RecaptchaV3('contact')],
        ]);

        // ------------------------------
        // Transaction Start
        // ------------------------------
        try {
            \DB::beginTransaction();

            // Save into database
            $contact = \App\Models\Contact::create([
                'name'    => $validated['name'],
                'subject' => $validated['subject'],
                'email'   => $validated['email'],
                'phone'   => $validated['phone'],
                'message' => $validated['message'],
            ]);

            \DB::commit();

        } catch (\Exception $e) {
            \DB::rollBack();
            return back()->withErrors(['error' => 'Something went wrong! Try again.']);
        }

        // ------------------------------
        // Send Email AFTER COMMIT
        // ------------------------------
        try {
            $content = [
                'name'    => $contact->name,
                'email'   => $contact->email,
                'phone'   => $contact->phone,
                'subject' => $contact->subject,
                'message' => $contact->message,
            ];
            $emails = explode(',', config('siteconfig.contact_email'));

            Mail::to($emails)->send(new SendMail($content, 'contact-form', $contact->subject));

        } catch (\Exception $e) {
            // email failure should NOT remove saved contact
            \Log::error("Contact form email failed: " . $e->getMessage());
        }

        // ------------------------------
        // Response
        // ------------------------------
        return back()->with('success', 'თქვენი შეტყობინება წარმატებით გაიგზავნა!');
    }

}
