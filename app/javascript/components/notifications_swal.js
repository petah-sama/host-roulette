import swal from 'sweetalert';

const deleteNotificationsBtn = document.querySelector('#icon-notification-text');
const deleteNotificationsConfirm = document.querySelector('#delete-all-notifications');

const deleteAlert = () => {
  deleteNotificationsBtn.addEventListener('click', event => {
    swal({
      title: "Are you sure?",
      text: "Once deleted, you will not be able to see these notifications anymore!",
      icon: "warning",
      buttons: true,
      dangerMode: true,
    })
    .then((willDelete) => {
      if (willDelete) {
        setTimeout(function() {
            deleteNotificationsConfirm.click();
          }, 1000);
        swal("Poof! Your notifications are gone!", {
          icon: "success",
          buttons: false,
        });
      } else {
        swal("No notifications deleted!");
      }
    });
  });
};

export { deleteAlert }
