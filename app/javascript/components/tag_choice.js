const tagFunctionality = () => {
  const tagChoices = document.querySelectorAll(".tag-choice");
  tagChoices.forEach(tag => {
    tag.addEventListener('click', event => {
      event.currentTarget.classList.toggle('active')
      if (event.currentTarget.classList.contains('active')) {
        event.currentTarget.children[0].checked = true;
      } else {
        event.currentTarget.children[0].checked = false;
      }
    });
  });
};

export { tagFunctionality };

