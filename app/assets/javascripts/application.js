// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require morris
//= require twitter/bootstrap
//= require jquery.turbolinks
//= require underscore
//= require gmaps/google
//= require nvd3/lib/d3.v2
//= require nvd3-rails
//= require turbolinks
//= require_tree .

if ($.browser.webkit) {
     $("your-css-selector").attr('data-no-turbolink', true);
}
