 const toggleButton = () => {
  var ys = document.querySelectorAll(".hosting-card");
  var pieHosting = document.querySelector(".stats-card");
  pieHosting.addEventListener('click', function() {
    if (!pieHosting.classList.contains('clicked')) {
      pieHosting.classList.toggle('box-shadow');
      ys.forEach ( y => {
        y.style.display = "none";
      });
      pieHosting.classList.add("clicked");
    } else {
      pieHosting.classList.remove('box-shadow');
      ys.forEach ( y => {
        y.style.display = "block";
      });
      pieHosting.classList.remove("clicked");
    }
  });
}

