"use strict";

 $(document).ready(function(){
// console.log("loaded");

// On click increments likes by 1. 
	$("#liking").click(function() {
		console.log('clicked');
		var id = $(this).data("id");
	        $.ajax({
	            url: '/posts/vote',
	            type: 'POST',
	            data: {
	            	id: id,
	            	increment: true
	            },
	            success: function() {
	            	var like_counter = $('#likeit');
	            	var current_count = parseInt($('#likeit').html());
	            	like_counter.html(current_count + 1);	
	            	$("#liking").hide();
	            }
	        });
	    });
});