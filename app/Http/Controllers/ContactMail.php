<?php

namespace App\Http\Controllers;

use App\Models\Contact;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Mail;
use Illuminate\Support\Facades\Validator;
use App\Mail\ContactMailSend;

class ContactMail extends Controller
{

    public function index()
    {
        $contacts = Contact::all();
        return response()->json($contacts);
    }


    public function store(Request $request)
    {
        // Validate the form data
        $validatedData = $request->validate([
            'name' => 'required',
            'email' => 'required|email',
            'message' => 'required',
        ]);

        // Create a new Contact model instance
        $contact = new Contact();
        $contact->name = $validatedData['name'];
        $contact->email = $validatedData['email'];
        $contact->message = $validatedData['message'];

        // Save the contact form data
        $contact->save();

        // Return a response indicating success
        return response()->json(['message' => 'Form data saved successfully']);
    }

    public function sendEmail(Request $request){
       
        $details = [
         'name' => $request->name,
         'email' => $request->email,
         'message' => $request->message,
        ];
         Mail::to('gedoniani@gmail.com')->send(new ContactMailSend($details));
 
         return response()->json(['message' => 'Email sent successfully']);
       
     }
}
