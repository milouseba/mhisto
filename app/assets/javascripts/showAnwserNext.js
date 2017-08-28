document.getElementById('answer-next').addEventListener('click', function(event) {

var activeAnswer = document.querySelector('.list-answers.active')

if (activeAnswer.nextSibling.nextSibling != null)
{
  activeAnswer.nextSibling.nextSibling.classList.add('active');
  activeAnswer.classList.remove('active');

  var nextActiveAnswer = document.querySelector('.list-answers.active');

  if (nextActiveAnswer.nextSibling.nextSibling === null)
  {
    document.getElementById('answer-next').classList.add('hide-btn');
  }
  document.getElementById('answer-previous').classList.remove('hide-btn');
}

});

document.getElementById('answer-previous').addEventListener('click', function(event) {

var activeAnswer = document.querySelector('.list-answers.active')

if (activeAnswer.previousSibling.previousSibling != null)
{
  activeAnswer.previousSibling.previousSibling.classList.add('active');
  activeAnswer.classList.remove('active');

  var previousActiveAnswer = document.querySelector('.list-answers.active');

  if (previousActiveAnswer.previousSibling.previousSibling === null)
  {
    document.getElementById('answer-previous').classList.add('hide-btn');
  }
  document.getElementById('answer-next').classList.remove('hide-btn');
}

});


