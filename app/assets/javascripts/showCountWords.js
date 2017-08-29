document.getElementById('answer_content').addEventListener('keyup', function(event) {

  var count = 0;
  event.target.value.split(" ").forEach(function(val) {
    if (val !== "") {
      count++;
    }
  });
  document.getElementById('words-count').innerText = count;
  // document.getElementById('btn-publish').className.replace("link-visible", "link-hidden");
  document.getElementById('save-text-auto').click();
  // const token = document.querySelector('meta[name="csrf-token"]').content;
  // const data = { answer: {content: event.target.value}, authenticity_token: token };
  // const url = document.querySelector('.my-answer-form').action;
  // fetch(url, {
  //   method: 'PUT',
  //   headers: {
  //     "Content-Type": "application/json",
  //     'X-CSRF-Token': token
  //   },
  //   body: JSON.stringify(data)
  // })
  // .then(response => console.log(response))
  // .then((data) => {
  //   console.log(data);
  // });
});

document.getElementById('answer_content').addEventListener('click', function(event) {
  event.target.classList.add("answer-content-grow");
});

document.addEventListener('click', function(event) {
  console.log(event.target.id);
  if (event.target.className.indexOf("answer-content-grow") === -1) {
    if (event.target.id != "save-text-auto") {
      console.log('fjbkz');
      document.getElementById('answer_content').classList.remove("answer-content-grow");
     }
  }
});
