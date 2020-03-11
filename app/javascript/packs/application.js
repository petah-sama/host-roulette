import "bootstrap";
import "../plugins/flatpickr";

import { eventRest } from '../components/event_form';
import { tagFunctionality } from '../components/tag_choice';
import { sliderBudgetValue } from '../components/event_form';
import { initMapbox } from '../plugins/init_mapbox';


import { editionRest } from '../components/roulette';

import { refreshMembers } from '../components/invite_members_refresh.js';

import 'mapbox-gl/dist/mapbox-gl.css';

// SELECT MUlTIPLE ITEMS

import 'select2/dist/css/select2.css';

import { initSelect2 } from '../components/init_select2';

initSelect2();

import { filterDashboard } from '../components/active_filter.js';

import { anotherfilterDashboard } from '../components/host_filter.js';


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

// Refresh the member joining page every 5 seconds
const invitePage = document.querySelector('#invite-members');
if (invitePage) {
  refreshMembers();
}

initMapbox();









