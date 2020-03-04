var filterHost = document.getElementById('filter-by-host');

var list = document.querySelectorAll("active-card");
var filterActive = document.getElementById('filter-by-state');


 function hidingPending () {
  var x = document.getElementById("active-cards");
  if (x.style.display === "none") {
    filterActive.innerHTML = "Active";
    x.style.display = "block";
  } else {
    filterActive.innerHTML = "Pending";
    x.style.display = "none";
  };
};

