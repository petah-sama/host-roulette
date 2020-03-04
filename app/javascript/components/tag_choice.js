const tagFunctionality = () => {
  const tagChoices = document.querySelectorAll(".tag-choice");
  tagChoices.forEach(tag => {
    tag.addEventListener('click', event => {
      if (event.currentTarget.classList.contains('active')) {
        event.currentTarget.classList.remove('active')
        event.currentTarget.children[0].checked = false;
      } else {
        event.currentTarget.classList.add('active')
        event.currentTarget.children[0].checked = true;
      }
    });
  });
};

export { tagFunctionality };
