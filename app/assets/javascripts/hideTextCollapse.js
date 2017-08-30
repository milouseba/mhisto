// $('.hide-collapse').hide();
$(".show-collapse").click(function() {
  $(this).hide();
  $(this).parent().find(".hide-collapse").show();
  console.log('fhbej');
});
$( ".hide-collapse" ).click(function() {
  $(this).hide();
  $(this).parent().find(".show-collapse").show();
  console.log('fhbej');
});


