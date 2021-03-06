import "bootstrap";
import "../plugins/flatpickr";
import 'select2/dist/css/select2.css';
import 'mapbox-gl/dist/mapbox-gl.css';



import { eventRest } from '../components/event_form';
import { tagFunctionality } from '../components/tag_choice';
import { sliderBudgetValue } from '../components/event_form';
import { initMapbox } from '../plugins/init_mapbox';
import { rouletteWheel } from '../components/roulette';
import { refreshMembers } from '../components/invite_members_refresh.js';
import { existingEdition } from '../components/existing_edition';
import { deleteAlert } from '../components/notifications_swal'
import { initSelect2 } from '../components/init_select2';
import { filterDashboard } from '../components/active_filter';
import { anotherfilterDashboard } from '../components/host_filter';
import { photoUploadButton } from '../components/photo_upload_button';
import { searchBarChange } from '../components/search_bar_change'

// SEARCH BAR CHANGES
const searchBar = document.querySelector("#query");
if (searchBar) {
  searchBarChange();
};

// SELECT MULTIPLE ITEMS
const editionEdit = document.querySelector("#edition-edit");
if (editionEdit) {
  initSelect2();
};

// DASHBOARD FILTERS
const dashboardPage = document.querySelector("#dashboard-page");
if (dashboardPage) {
  filterDashboard();
  anotherfilterDashboard();
};

// // NEW EVENT FORM TAGS / BUDGET
const tagForm = document.querySelector("#new_event");
if (tagForm) {
  sliderBudgetValue();
  tagFunctionality();
  eventRest();
};

// NEW EDITION ROULETTE
const roulettePage = document.querySelector('#chart');
if (roulettePage) {
  rouletteWheel();
};

// REFRESH THE MEMBER JOINING PAGE EVERY 5 SECONDS
const invitePage = document.querySelector('#invite-members');
if (invitePage) {
  refreshMembers();
};

// EDITION MODAL
const editionPage = document.querySelector('#edition-show');
if (editionPage && editionPage.dataset.ongoing === "true") {
  existingEdition();
};

// SWAL
const notificationBell = document.querySelector('#notification-bell');
if (notificationBell) {
  deleteAlert();
};

// PHOTO UPLOAD BUTTON
const photoButton = document.querySelector('.photo-upload-button');
if (photoButton) {
  photoUploadButton();
}

// MAP
initMapbox();
