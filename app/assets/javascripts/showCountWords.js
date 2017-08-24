document.getElementById('answer_content').addEventListener('keyup', (event) => {
  let count = 0;
  event.target.value.split(" ").forEach(val => {
    if (val !== "") {
      count++;
    }
  });
  document.getElementById('words-count').innerText = count;

});

