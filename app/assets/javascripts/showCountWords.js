document.getElementById('answer_content').addEventListener('keyup', function(event) {
  var count = 0;

  count = event.target.value.split(" ").length;
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

document.getElementById('answer_content').addEventListener('focusin', function(event) {
  event.currentTarget.classList.add("answer-content-grow");
});

document.getElementById("answer_content").addEventListener('focusout', function(event) {
  event.currentTarget.classList.remove("answer-content-grow");
});
