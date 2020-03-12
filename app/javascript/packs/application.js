import "bootstrap";
import "../plugins/flatpickr";


import { eventRest } from '../components/event_form';
import { tagFunctionality } from '../components/tag_choice';
import { sliderBudgetValue } from '../components/event_form';
import { initMapbox } from '../plugins/init_mapbox';
import { editionRest } from '../components/roulette';
import { refreshMembers } from '../components/invite_members_refresh.js';
import 'mapbox-gl/dist/mapbox-gl.css';
import { existingEdition } from '../components/existing_edition';
import { deleteAlert } from '../components/notifications_swal'
deleteAlert();
// SELECT MUlTIPLE ITEMS

import 'select2/dist/css/select2.css';

import { initSelect2 } from '../components/init_select2';
import { filterDashboard } from '../components/active_filter.js';
import { anotherfilterDashboard } from '../components/host_filter.js';


const editionEdit = document.querySelector("#edition-edit");
if (editionEdit) {
  initSelect2();
};

const dashboardPage = document.querySelector("#dashboard-page");
if (dashboardPage) {
  filterDashboard();
  anotherfilterDashboard();
};

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

//dropdown questions



// Refresh the member joining page every 5 seconds
const invitePage = document.querySelector('#invite-members');
if (invitePage) {
  refreshMembers();
};

// EDITION MODAL
const editionPage = document.querySelector('#edition-show')
if (editionPage && editionPage.dataset.ongoing === "true") {
  existingEdition();
};

initMapbox();









