$.datepicker.setDefaults({
    dateFormat: "yy-mm-dd",
    altFormat: "dd-mm-yy"
});
$(document).on('turbolinks:load',function(){
    $('.datepicker-i').datepicker({
        maxDate: new Date(),
        changeMonth:true,
        changeYear:true
    })

    $('.datepicker-f').datepicker({
        maxDate: new Date(),
        changeMonth:true,
        changeYear:true
    })
    $('.datepicker').datepicker({
        changeMonth:true,
        changeYear:true,
        yearRange: "1940:2017"
    })
})
$(document).on('cocoon:after-insert', function(e, insertedItem) {
    insertedItem.find('input.datepicker-i').datepicker({maxDate: new Date()})
    insertedItem.find('input.datepicker-f').datepicker({maxDate: new Date()})
})