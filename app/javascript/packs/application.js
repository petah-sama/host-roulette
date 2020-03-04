import "bootstrap";

import { formListen } from '../components/event_form';
formListen();
// import { updateTextInput } from '../components/event_form';
// updateTextInput();

import { tagFunctionality } from '../components/tag_choice';
const tagForm = document.querySelector("#new_event");
if (tagForm) {
  tagFunctionality();
};
