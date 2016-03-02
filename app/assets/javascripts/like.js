"use strict";

 $(document).ready(function(){
// console.log("loaded");

	var likes = $('#likeit');

// var like = function() {
// 	likes ++;
// 	// votes.text('#likeit');
// };

// 	$('#liking').click(function(){
// 			console.log("clicked")
// 			return likes ++;
// 		like();
// 	});
// });


	$("#liking").click(function() {
		console.log('click')
					console.log('clicking')	    	
	        $.ajax({
	            url: '/posts/15',
	            type: 'POST',
	            data: {increment: true},
	            success: function() { 
	            	alert('Liked') 
	            }
	        });
	        return likes ++;
	    });
});