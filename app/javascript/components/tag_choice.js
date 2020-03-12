const tagFunctionality = () => {
  const tagLabel = document.querySelectorAll(".tag-choice label");
  tagLabel.forEach(label => {
    label.addEventListener('click', event => {
      event.currentTarget.parentElement.classList.toggle('active')
      if (event.currentTarget.parentElement.classList.contains('active')) {
        event.currentTarget.checked = true;
      } else {
        event.currentTarget.checked = false;
      }
    });
  });
};


export { tagFunctionality };

