function miFuncion(){
	$.get('/horarios',function(data){
		$.each(data,function(){
			if(this.status!='ABIERTO'){
				$("#ayuda").html(this.nombre)
			}
		})
	},'JSON')
}
;
