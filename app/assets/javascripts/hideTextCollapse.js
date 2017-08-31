// $('.hide-collapse').hide();
$(".show-collapse").click(function() {
  $(this).hide();
  $(this).parent().find(".hide-collapse").show();
});

$( ".fa-minus" ).click(function() {
  $(".hide-collapse").hide();
  $(this).parents(".answer").find(".show-collapse").show();
});


