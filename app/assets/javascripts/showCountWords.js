document.getElementById('answer_content').addEventListener('keyup', function(event) {

  var count = 0;
  event.target.value.split(" ").forEach(function(val) {
    if (val !== "") {
      count++;
    }
  });
  document.getElementById('words-count').innerText = count;
  // document.getElementById('btn-publish').className.replace("link-visible", "link-hidden");
});

document.getElementById('answer_content').addEventListener('click', function(event) {
  event.target.classList.add("answer-content-grow");
});

document.addEventListener('click', function(event) {
  if (event.target.className.indexOf("answer-content-grow") === -1) {
    document.getElementById('answer_content').classList.remove("answer-content-grow");
  }
});
