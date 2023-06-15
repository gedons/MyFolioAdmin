<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <title>Laravel</title>
        <style>
            p{
                font-family: sans-serif;
            }
        </style>
    </head>

    <body>
        <h1>New Contact Form Message</h1>
        <p>Name: {{$details['name']}}</p>
        <p>Email: {{$details['email']}}</p>
        <p>Message: {{$details['message']}}</p>        
    </body>

</html>