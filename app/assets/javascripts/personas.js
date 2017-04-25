$(document).on('click','.current',function(){
	var f=$(this).parents('tr').find('.datepicker-f')
	if($(this).is(':checked')){
		var date=new Date()
		f.val(date.getFullYear()+"/"+date.getMonth()+'/'+date.getDate())
		f.prop('disabled',true)

	}
	else{
		f.val('')
		f.prop('disabled',false)
	}

})