import swal from 'sweetalert';

const existingEdition = () => {
  document.addEventListener('DOMContentLoaded', event => {
    swal({
      icon: "info",
      title: "Warning!",
      text: "There is already an ongoing event!",
      button: "OK!",
    })
  });
};

export { existingEdition };
