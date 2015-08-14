// make all elements draggable
$(function(){
    $(".spot").draggable({
    	stop: function( event, ui ) {
    		var spotId = event.target.id.match(/\d+/)
    		updateSpot($(this).position().left, $(this).position().top, spotId);   		
    	}
    });

    $("#grid").click(function(event){
		addSpot(event);
	})
});

//function updating dropped spot by Ajax
function updateSpot (x, y, spotId) {
	$.ajax({
	  			method: "PATCH",
	  			url: "/spots/"+spotId,
	  			data: { spot: {position_x: x, position_y: y} }
			});
}

//function creating new spot after click on the grid element
function addSpot (event) {
	var name = prompt("Spot name: ", "Spot X")    
	$.ajax({
		  		method: "POST",
		  		url: "/spots.js",
		  		data: { spot: {position_x: event.pageX, position_y: event.pageY, name: name} }
			});
}