$(function(){
	var num = 0;

function adminOpen(){
	if (num == 0){
		$('.admin').show();
		num = 1;
	}
	else {
		$('.admin').hide();
		num = 0;
	}
}

	if ($('#adminArrow').length>0){
		var admin = document.getElementById('adminArrow');
		admin.addEventListener("click", adminOpen, false);
	}

});
