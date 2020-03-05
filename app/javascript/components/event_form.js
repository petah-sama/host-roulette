const eventRest = () => {

  // dom variables
  var msf_getFsTag = document.getElementsByClassName("field-slide");

  // declaring the active fieldset & the total fieldset count
  var msf_form_nr = 0;

  var fieldset = msf_getFsTag[msf_form_nr];
  fieldset.classList.add("msf_show");
  fieldset.classList.remove("msf_hide");
  fieldset.classList.remove("msf_showhide");

  // creates and stores a number of bullets
  var msf_bullet_nr = "<div class='msf_bullet'></div>";
  var msf_length = msf_getFsTag.length;
  for (var i = 1; i < msf_length; ++i) {
    msf_bullet_nr += "<div class='msf_bullet'></div>";
  };
  // injects bullets
  var msf_bullet_o = document.getElementsByClassName("msf_bullet_o");
  for (var i = 0; i < msf_bullet_o.length; ++i) {
    var msf_b_item = msf_bullet_o[i];
    msf_b_item.innerHTML = msf_bullet_nr;
  };

  // removes the first back button & the last next button
  document.getElementsByName("back")[0].className = "msf_hide";
  document.getElementsByName("next")[msf_bullet_o.length - 1].className = "msf_hide";

  // Makes the first dot active
  var msf_bullets = document.getElementsByClassName("msf_bullet");
  msf_bullets[msf_form_nr].className += " msf_bullet_active";

// Validation loop & goes to the next step
const msf_btn_next = () => {

  var msf_val = true;

  const tagTag = document.querySelectorAll(".tag-choices");
  if(tagTag == false) {

    var msf_fs = document.getElementsByClassName("field-slide")[msf_form_nr];
    var msf_fs_i_count = msf_fs.querySelectorAll("input").length;

    for (var i = 0; i < msf_fs_i_count; ++i) {
      var msf_input_s = msf_fs.querySelectorAll("input")[i];
      if (msf_input_s.getAttribute("type") === "button") {
          // nothing happens
      } else {
        if (msf_input_s.value === "") {
          msf_input_s.style.backgroundColor = "lightgray";
          msf_val = false;
        } else {
          if (msf_val === false) {} else {
              msf_val = true;
              msf_input_s.style.backgroundColor = "white";
          }
        }
      };
    };

  };


  if (msf_val === true) {
    // goes to the next step
    var selection = msf_getFsTag[msf_form_nr];
    selection.classList.add("msf_hide");
    selection.classList.remove("msf_showhide");
    selection.classList.remove("msf_show");

    msf_form_nr = msf_form_nr + 1;
    var selection = msf_getFsTag[msf_form_nr];
    selection.classList.add("msf_showhide");
    selection.classList.remove("msf_hide");
    selection.classList.remove("msf_show");
    // refreshes the bullet
    var msf_bullets_a = msf_form_nr * msf_length + msf_form_nr;
    msf_bullets[msf_bullets_a].className += " msf_bullet_active";
  }
};

// goes one step back
const msf_btn_back = () => {

  msf_getFsTag[msf_form_nr].classList.add("msf_hide");
  msf_getFsTag[msf_form_nr].classList.remove("msf_showhide");
  msf_getFsTag[msf_form_nr].classList.remove("msf_show");
  msf_form_nr = msf_form_nr - 1;
  msf_getFsTag[msf_form_nr].classList.add("msf_showhide");
  msf_getFsTag[msf_form_nr].classList.remove("msf_hide");
  msf_getFsTag[msf_form_nr].classList.remove("msf_show");
};


// listen to the buttons
const formListen = () => {

  const buttonNext1 = document.querySelector('#button-next1');
  buttonNext1.addEventListener('click', event => { msf_btn_next(); });

  const buttonBack2 = document.querySelector('#button-back2');
  buttonBack2.addEventListener('click', event => { msf_btn_back(); });
  const buttonNext2 = document.querySelector('#button-next2');
  buttonNext2.addEventListener('click', event => { msf_btn_next(); });

  const buttonBack3 = document.querySelector('#button-back3');
  buttonBack3.addEventListener('click', event => { msf_btn_back(); });
  const buttonNext3 = document.querySelector('#button-next3');
  buttonNext3.addEventListener('click', event => { msf_btn_next(); });

  const buttonBack4 = document.querySelector('#button-back4');
  buttonBack4.addEventListener('click', event => { msf_btn_back(); });
};
formListen();

};

export { eventRest };
