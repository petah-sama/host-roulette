const refreshMembers = () => {
  const TIMEOUT = 2000;
  const membersList = document.getElementById('member-list');

  setInterval(() => {
    Rails.ajax({
      url: `/events/${membersList.dataset.event_id}/members`,
      type: 'GET',
      data: '',
      success: function(data) {
        membersList.textContent = '';

        data.forEach(member => {
          const item = `<li class = 'invited-member'>${member.first_name} ${member.last_name}</li>`;
          membersList.insertAdjacentHTML('beforeend', item);
        });
      },
      error: function(data) {}
    });
  }, TIMEOUT);
};

export { refreshMembers };
