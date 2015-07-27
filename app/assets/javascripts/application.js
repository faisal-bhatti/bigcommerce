//= require jquery
//= require jquery.cookie
//= require bootstrap.min

//= require validate

// AngularJS
//= require angular/angular.min
//= require angular/angular-route.min
//= require angular/angular-resource.min
//= require angular/angular-cookies.min
//= require angular/angular-strap.min
//= require angular/angular-strap-tpl.min
//= require angular/angular-sanitize.min
//= require angular/message_center

//= require angular-rails-templates
//= require_tree ./templates
//= require auth
//= require main
//= require config/routes
//= require controllers/app
//= require controllers/products

//= require js-routes
//= require services/session_service

$(function(){
  checkCurrentUser();
});
