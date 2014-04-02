# Simple Rails Contact Form

This is a simple contact form to be used in Rails applications that will hopefully be turned into a gem or a rails engine in the future.
Right now it includes sample code for

- The contact form
- The javascript to submit the contact form
- The controller action to respond to the AJAX submit
- The mailers and corresponding views

## Installation

Right now this is just bunch of code that can be copy and pasted. Hopefully in the future, looking to make this a gem or a rails engine.

## Components / Usage

### Contact Form

Take a look at the contact.html.erb in the pages views.

You'll need to add any fields that you need.

### Controller

Take a look at the PagesController.

You'll need to edit the permitted_contact_params.

### Javascript

Take a look at the contact.js.

You'll need to edit the fields that you're submitting, and the AJAX call.

### Mailers

Take a look at the AdminMailer and the CustomerMailer and their corresponding views.