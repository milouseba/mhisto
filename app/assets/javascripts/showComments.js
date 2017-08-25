// $('.answer-comments').hide();
$('.hide-comments').hide();

$(".show-comments").click(function() {
  $(this).parent().find(".answer-comments").show("fast");
  $(this).hide();
  $(this).parent().find(".hide-comments").show();
});


$( ".hide-comments" ).click(function() {
  $(this).parent().find(".answer-comments").hide("fast");
  $(this).hide();
  $(this).parent().find(".show-comments").show();
});
