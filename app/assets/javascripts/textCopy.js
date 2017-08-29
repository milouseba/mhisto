document.addEventListener("DOMContentLoaded", function(event) {
  document.getElementById('answer_content').addEventListener("keyup", function(){
     document.getElementById('hello').innerHTML = document.getElementById('answer_content').value;
  });
});

