$(document).ready(function(){
	$('.vote-link').on('click', function(event){
		
		var voteCount = $(this).parent().siblings('.vote-count')
		event.preventDefault();

		$.post(this.href, function(response){
			console.log(voteCount)
			voteCount.text(response.new_vote_count*-1);
		});
	})
})