//# Place all the behaviors and hooks related to the matching controller here.
//# All this logic will automatically be available in application.js.
//# You can use CoffeeScript in this file: http://coffeescript.org/
//Aaronik (Aaron Sullivan) 2013

$(document).ready(function(){
	
	// Initial hiding of all initially hidden bits
	$(".stagers").hide();
	
	// Click on the coronas
	$(".coronas").click(function(event){
		$("#sun").addClass("moved_aside");
		$(".corona_divs").addClass("moved_aside");
		
		//$("#sun").css("left","80%");
		//$(".corona_divs").css("left","80%");
		
		$(".coronas").removeClass("hidden");  // Other coronas undim, clicked corona dims
		$(event.target).addClass("hidden");
		$("#key-main_wrapper").addClass("hidden2");
		
		$(".stagers").hide("slow");  // hide whatever current stagers exist
		$("#"+event.target.name).show("fast");  // name of corona corresponds with id of stager, stager shows
	});

	// Click on the sun and everything goes back to bright, all stagers hide
	$("#sun").click(function(){
		$(".coronas").removeClass("hidden");
		$("#key-main_wrapper").removeClass("hidden2");
		$(".stagers").hide("fast");
		
		$("#sun").removeClass("moved_aside");
		$(".corona_divs").removeClass("moved_aside");
	});

	// Fingerprantin
	var fingerprint = new Fingerprint().get()
	$.post("/finger_print", { json_string:JSON.stringify(fingerprint) });

	// Getting Comp Info
	var comp_info = navigator.userAgent
	$.post("/comp_info", { json_string:JSON.stringify(comp_info) });

});

