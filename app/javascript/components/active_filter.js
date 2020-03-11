const filterDashboard = () => {
  var x = document.getElementById("pending-cards");
  var pieActive = document.querySelector(".stats-card-cool");
  pieActive.addEventListener('click', function() {
    if (!pieActive.classList.contains('clicked')) {
      pieActive.classList.toggle('box-shadow');
      x.style.display = "none";
      pieActive.classList.add("clicked");
    } else {
      x.style.display = "block";
      pieActive.classList.remove("clicked");
      pieActive.classList.remove('box-shadow');
    }
  });
}

export { filterDashboard };
