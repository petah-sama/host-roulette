const searchBarChange = () => {
  const searchOuter = document.querySelector('.search-bar');
  const searchInput = document.querySelector('.search-bar #query');
  const searchButton = document.querySelector('.button-submit');
  const searchClear = document.querySelector('.button-clear');
  const avatar = document.querySelector('.navbar-nav');

  const hideCross = () => {
    avatar.classList.remove('d-none');
    avatar.classList.add('d-flex');
    searchOuter.classList.remove('col-9', 'col-sm-10', 'pr-4');
    searchInput.classList.add('mr-sm-2');
    searchClear.classList.add('invisible');
  }

  const checkInput = () => {
    if (window.outerWidth < 768) {
      if (searchInput.value) {
        avatar.classList.add('d-none');
        avatar.classList.remove('d-flex');
        searchOuter.classList.add('col-9', 'col-sm-10', 'pr-4');
        searchInput.classList.remove('mr-sm-2');
        searchClear.classList.remove('invisible');
      } else {
        hideCross();
      };
    } else if (window.outerWidth >= 768) {
      if (searchInput.value) {
        searchClear.classList.remove('invisible');
      } else {
        hideCross();
      };
    };
  };

  const checkEvents = () => {
    checkInput();
    searchInput.addEventListener('keyup', checkInput);
    searchClear.addEventListener('click', event => {
      searchInput.value = "";
      checkInput();
      searchButton.click();
    });
  };

  window.addEventListener('load', e => {
    checkEvents();
  });

  window.addEventListener('resize', e => {
    checkEvents();
  });
};

export { searchBarChange };
