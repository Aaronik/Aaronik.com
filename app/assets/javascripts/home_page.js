//# Place all the behaviors and hooks related to the matching controller here.
//# All this logic will automatically be available in application.js.
//# You can use CoffeeScript in this file: http://coffeescript.org/
//Aaronik (Aaron Sullivan) 2013

$(document).ready(function(){

	// How fast will the iframe fade in / out go
	var show_speed = 'slow'

	// Close buttons for programs
	$(".close_button").click(function(){
		$(".program_iframe_wrapper").hide('drop',show_speed);
	});

	// Github buttons for programs
	$(".github_button").click(function(event){
		var github_url = "https://github.com/Aaronik/netsec/blob/master/" + event.target.id;
		window.location = github_url;
	});

	// Iframe loading for programs
	$(".program_button > div").click(function(event){		

		// Iframe "when to show" logic, AJAX request, iframe srcdoc population
		if ($("#"+event.target.id+"_iframe_wrapper").is(":visible") == true) {
			$("#"+event.target.id+"_iframe_wrapper").hide('drop','show_speed');
		}else {
			$(".program_iframe_wrapper").hide('drop','show_speed');
			$("#"+event.target.id+"_iframe_wrapper").show('drop','show_speed');
			$('#'+event.target.id+'_iframe').attr('srcdoc','Loading...');
			$.ajax({
				type: 'POST',
				url: "/get_from_github",
				data: {json_string: JSON.stringify(event.target.id)},
				complete: function(data){$('#'+event.target.id+'_iframe').attr('srcdoc','<pre>'+data.responseText+'</pre>');}
			});
		}
	});

	// When you mouse over a corona, make the corresponding key line appear
	$(".coronas").hover(function(event){
		$("#key_line_"+event.target.name).removeClass("hidden2");
	},
	function(){
		$(".key_line").addClass("hidden2");
	}
	);
	
	// Click on the coronas
	$(".coronas").click(function(event){
		$("#sun").addClass("moved_aside");
		$(".corona_divs").addClass("moved_aside");
		
		$(".coronas").removeClass("hidden");  // Other coronas undim, clicked corona dims
		$(event.target).addClass("hidden");
		
		$(".stagers").hide("slow");  // hide whatever current stagers exist
		$("#"+event.target.name).show("fast");  // name of corona corresponds with id of stager, stager shows
	});

	// Click on the sun and everything goes back to bright, all stagers hide
	$("#sun").click(function(){
		$(".coronas").removeClass("hidden");
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

