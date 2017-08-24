document.getElementById('answer_content').addEventListener('keyup', (event) => {

  let count = 0;
  event.target.value.split(" ").forEach(val => {
    if (val !== "") {
      count++;
    }
  });
  document.getElementById('words-count').innerText = count;
  // document.getElementById('btn-publish').className.replace("link-visible", "link-hidden");
});

// document.getElementById('btn-publish').addEventListener('keyup', (event) => {



// }

// <a class="btn-publish link-hidden" hidden="hidden" href="/exercices/236/publish">Publier</a>

// tablinks[i].className.replace(" active", "");
