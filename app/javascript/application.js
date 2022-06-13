// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
//= require jquery
//= require jquery_ujs
//= require turbolinks import "trix"
import "@rails/actiontext"


document.addEventListener('DOMContentLoaded', function() {
    var buttonElement = document.getElementById('click');
    buttonElement.addEventListener('click', function(event){
      console.log('An event was triggered: ' + event.type);  
    });
});