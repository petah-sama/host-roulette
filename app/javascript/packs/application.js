import "bootstrap";

import { roulette } from '../components/roulette';
const roulettePage = document.querySelector('#wheel');
if (roulettePage) {
  const button = document.getElementById("button-roulette")

  button.addEventListener("click", roulette);

}

// import { updateTextInput } from '../components/event_form';
// updateTextInput();

import { formListen } from '../components/event_form';
import { tagFunctionality } from '../components/tag_choice';
const tagForm = document.querySelector("#new_event");
if (tagForm) {
  tagFunctionality();
  formListen();
};


