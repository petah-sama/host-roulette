const dashboardFilters = () => {
  const hostingFilter = () => {
    const hostCards = document.querySelectorAll(".hosting-card");
    const hPie = document.querySelector(".stats-card-hosting");
    hPie.addEventListener('click', event => {
      if (!hPie.classList.contains('clicked')) {
        hPie.classList.add('box-shadow');
        hostCards.forEach ( hcard => {
          hcard.style.display = "none";
        });
        hPie.classList.add("clicked");
      } else {
        hPie.classList.remove('box-shadow');
        hostCards.forEach ( hcard => {
          hcard.style.display = "block";
        });
        hPie.classList.remove("clicked");
      }
    });
  };

  const scheduledFilter = () => {
    const scheduleCards = document.getElementById("pending-card-section");
    const sPie = document.querySelector(".stats-card-scheduled");
    sPie.addEventListener('click', event => {
      if (!sPie.classList.contains('clicked')) {
        scheduleCards.style.display = "none";
        sPie.classList.add('box-shadow');
        sPie.classList.add("clicked");
      } else {
        scheduleCards.style.display = "block";
        sPie.classList.remove("clicked");
        sPie.classList.remove('box-shadow');
      }
    });
  };

  hostingFilter();
  scheduledFilter();
};

export { dashboardFilters };
