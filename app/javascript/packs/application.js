import "bootstrap";

// import { formListen } from '../components/event_form';
import { eventRest } from '../components/event_form';
import { tagFunctionality } from '../components/tag_choice';
import { sliderBudgetValue } from '../components/event_form';


import { editionRest } from '../components/roulette';
// import { spinRoulette } from '../components/roulette';

// // NEW EVENT FORM
const tagForm = document.querySelector("#new_event");
if (tagForm) {
  sliderBudgetValue();
  tagFunctionality();
  eventRest();
};

// NEW EDITION FORM
const roulettePage = document.querySelector('#wheel');
if (roulettePage) {
  editionRest();
};
