import "bootstrap";

import { eventRest } from '../components/event_form';
import { tagFunctionality } from '../components/tag_choice';
import { sliderBudgetValue } from '../components/event_form';


import { editionRest } from '../components/roulette';

import { refreshMembers } from '../components/invite_members_refresh.js';

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

// Refresh invitiation page every 5 seconds
const invitePage = document.querySelector('#invite-members');
if (invitePage) {
  refreshMembers();
}
