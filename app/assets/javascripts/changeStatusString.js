document.querySelectorAll("div.dash-answer-exercice-status > p").forEach(function(val)
     {
      if (val.innerHTML === "published") {
        val.innerHTML = "publié".fontcolor("#4CAF50")
      } else {
        val.innerHTML = "brouillon"
      }
    console.log(val.innerHTML)
  });
