// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require twitter/bootstrap
//= require bootstrap-datepicker
//= require jquery-ui/widgets/autocomplete
//= require autocomplete-rails
//= require turbolinks
//= require cocoon
$(document).on('cocoon:after-insert', function(e, insertedItem) {
	$('.datepicker').datepicker({
		format: 'dd/mm/yyyy',
		autoclose: true
	});
})
$(document).on('turbolinks:load',function(){
	$('.datepicker').datepicker({
		format: 'dd/mm/yyyy',
		autoclose: true
	});
	$('#image_logo').fadeIn(4000)
})