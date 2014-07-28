	$(function(){
	var lastid;
	var elementNum = 1;

	var main = $('.main-photo');

	if (main.size() != 0){
	var numChildren = $('.gallery').children().length;	
	//Add keyboard functions	
	$(this).keydown(function(e){
  	  if (e.keyCode == 37) { 
      	lDown();
     		return false;
  	  }
	});

	$(this).keydown(function(e){
  	  if (e.keyCode == 39) { 
      	rDown();
      	return false;
    	}
	});	

	//Left arrow clicked?
	var leftArrow = document.getElementById('leftArrow');
	leftArrow.addEventListener("click", lDown, true);
	function lDown(){
		if(elementNum > 1){
		elementNum = elementNum - 1;
		var me = $('.gallery:nth-child(' + elementNum + ')');
		var id = me.data("id");
		page = $.ajax({
			url: '/gallery_images/' + id,
      dataType: 'html',
			success: function(data){
					var stuff = ($(data).find(".stuff"));
					main.html(stuff);
			}
    });
		}
	}

	//Right arrow clicked?
	var rightArrow = document.getElementById('rightArrow');
	rightArrow.addEventListener("click", rDown, true);
	function rDown(){
		if (elementNum < numChildren){
		elementNum = elementNum + 1;
		var me = $('.gallery:nth-child(' + elementNum + ')');
		var id = me.data("id");
		page = $.ajax({
			url: '/gallery_images/' + id,
      dataType: 'html',
			success: function(data){
					var stuff = ($(data).find(".stuff"));
					main.html(stuff);
			}
    });
		}
	}

	//Photo clicked?
	var photo = $('.gallery');
	photo.on('click', function(event){
	var id = $(this).data("id");
	if (id != lastid){
	console.log(id);
		page = $.ajax({
			url: '/gallery_images/' + id,
      dataType: 'html',
			success: function(data){
					var stuff = ($(data).find(".stuff"));
					main.html(stuff);
			}
    });
	}	
	lastid = id;	
	});
}
});
