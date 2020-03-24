const searchBarChange = () => {
  const searchOuter = document.querySelector('.search-bar');
  const searchInput = document.querySelector('.search-bar #query');
  const searchClear = document.querySelector('.button-clear');
  const avatar = document.querySelector('.navbar-nav');

  const hideCross = () => {
    avatar.classList.remove('d-none');
    avatar.classList.add('d-flex');
    searchOuter.classList.remove('col-9', 'col-sm-10', 'pr-4');
    searchClear.classList.add('invisible', 'position-absolute');
  }

  const checkInput = () => {
    if (window.outerWidth < 768) {
      if (searchInput.value) {
        avatar.classList.add('d-none');
        avatar.classList.remove('d-flex');
        searchOuter.classList.add('col-9', 'col-sm-10', 'pr-4');
        searchClear.classList.remove('invisible', 'position-absolute');
      } else {
        hideCross();
      };
    };
  };

  const checkWindowSize = () => {
    if (window.outerWidth < 768) {
      checkEvents();
    } else {
      hideCross();
    };
  };

  const checkEvents = () => {
    checkInput();
    searchInput.addEventListener('keyup', checkInput);
    searchClear.addEventListener('click', event => {
      searchInput.value = "";
      checkInput();
    });
  };

  window.addEventListener('load', e => {
    checkWindowSize();
  });

  window.addEventListener('resize', e => {
    checkWindowSize();
  });
};

export { searchBarChange };
