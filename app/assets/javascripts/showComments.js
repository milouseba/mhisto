$('.answer-comments').hide();
$('#hide-comments').hide();

$( "#show-comments" ).click(function() {
  $( ".answer-comments" ).show( "slow"
  );
  $( this ).hide();
  $( "#hide-comments" ).show();
});


$( "#hide-comments" ).click(function() {
  $( ".answer-comments" ).hide( "slow"
  );
  $( this ).hide();
  $( "#show-comments" ).show();
});
