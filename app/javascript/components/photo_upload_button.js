// import $ from 'jquery';

const photoUploadButton = () => {
  const photoButton = document.querySelector('.photo-upload-button');
  const hiddenPhotoButton = document.querySelector('.hidden-photo-button');
  photoButton.addEventListener('click', event => {
    hiddenPhotoButton.click();
  });
  hiddenPhotoButton.addEventListener('change', event => {

    const preview = document.querySelector('.uploaded-image');
    const file = hiddenPhotoButton.files[0];
    const reader = new FileReader();

    reader.addEventListener("load", function () {
      // convert image file to base64 string
      preview.src = reader.result;
    }, false);

    if (file) {
      reader.readAsDataURL(file);
    };
  });
};

export { photoUploadButton };
