$(document).ready(function() {
	$('#t_button').click(function(event){
		event.preventDefault();
		var tweet = $('#t_box').val()
		var data = {my_tweet: tweet}
		$.post('/hey', data, function(response){
			$('.container').after(response)
			$('#t_box').val("")
		});
	});
});
