import "bootstrap";

import { eventRest } from '../components/event_form';
import { tagFunctionality } from '../components/tag_choice';

import { editionRest } from '../components/roulette';

// // NEW EVENT FORM
const tagForm = document.querySelector("#new_event");
if (tagForm) {
  console.log("new event")
  tagFunctionality();
  eventRest();
};

// NEW EDITION FORM
const roulettePage = document.querySelector('#wheel');
if (roulettePage) {
  editionRest();
};

const refreshEventBudgetValue = () => {
  document.querySelector('#event_budget_value').innerHTML = event.target.value;
};

const slider = document.querySelector('#event_budget');
if (slider) {
  document.querySelector('#event_budget_value').innerHTML = slider.value;
  slider.addEventListener('change', refreshEventBudgetValue);
}
