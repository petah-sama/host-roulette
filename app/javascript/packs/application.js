import "bootstrap";
import "../plugins/flatpickr";

import { eventRest } from '../components/event_form';
import { tagFunctionality } from '../components/tag_choice';
import { sliderBudgetValue } from '../components/event_form';
import { initMapbox } from '../plugins/init_mapbox';


import { editionRest } from '../components/roulette';

import 'mapbox-gl/dist/mapbox-gl.css';

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


initMapbox();


// SELECT MUlTIPLE ITEMS

import 'select2/dist/css/select2.css';

import { initSelect2 } from '../components/init_select2';

initSelect2();
