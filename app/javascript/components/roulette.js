import swal from 'sweetalert';


const editionRest = () => {
  function rand(min, max) {
    return Math.random() * (max - min) + min;
  };

  let color = [];
  let basicColors = ['#051c4a','#93a3c0','#D95140']


  let label = [];
  let members = document.querySelectorAll('.user-names');
  members.forEach(function(member) {
    label.push([member.dataset.name, member.dataset.last, member.dataset.id]);
  });

  for (var i = 0; i < label.length; i++){
    if (i === 0) {
      color.push(basicColors[1]);
    } else if (i % 2 === 0) {
      color.push(basicColors[0]);
    } else {
      color.push(basicColors[2]);
    };
  };


  let slices = color.length;
  let sliceDeg = 360/slices;
  let deg = rand(0, 360);
  let speed = 0;
  let slowDownRand = 0;
  let ctx = canvas.getContext('2d');
  let width = canvas.width; // size
  let center = width/2;     // center
  let isStopped = false;
  let lock = false;

  function drawCircleCenterInner() {
    ctx.beginPath();
    ctx.fillStyle = '#051c4a';
    ctx.moveTo(center, center);
    ctx.arc(center, center, width / 15, 0, 10);
    ctx.lineTo(center, center);
    ctx.fill();
  };

  function drawCircleCenterOutter() {
    ctx.beginPath();
    ctx.fillStyle = '#586a88';
    ctx.moveTo(center, center);
    ctx.arc(center, center, width / 10, 0, 10);
    ctx.lineTo(center, center);
    ctx.fill();
  };

  function deg2rad(deg) {
    return deg * Math.PI/180;
  };

  function drawSlice(deg, color) {
    ctx.beginPath();
    ctx.fillStyle = color;
    ctx.moveTo(center, center);
    ctx.arc(center, center, width / 2, deg2rad(deg), deg2rad(deg+sliceDeg));
    ctx.lineTo(center, center);
    ctx.fill();
  };

  function drawText(deg, text) {
    ctx.save();
    ctx.translate(center, center);
    ctx.rotate(deg2rad(deg));
    ctx.textAlign = "left";
    ctx.fillStyle = "#fff";
    ctx.font = '35px Montserrat';
    ctx.fillText(text, 130, 10);
    ctx.restore();
  };

  function drawImg() {

    ctx.clearRect(0, 0, width, width);
    for(var i = 0; i < slices; i++){
      drawSlice(deg, color[i]);
      let memberName = label[i][0] + " " + label[i][1][0] + ".";
      drawText(deg + sliceDeg / 2, memberName);
      deg += sliceDeg;
    };
    drawCircleCenterOutter();
    drawCircleCenterInner();
  };


  const roulette = () => {

    drawImg();
  };

  const spinRoulette = () => {
    (function anim() {
      deg += speed;
      deg %= 360;

      // Increment speed
      if(!isStopped && speed < 10) {    // set the last value to 10
        speed = speed + 2 * 0.1;
      };
      // Decrement Speed
      if(isStopped){
        if(!lock){
          lock = true;
          slowDownRand = rand(0.970, 0.980);
        };
        speed = speed > 0.1 ? speed *= slowDownRand : 0;
      };
      // Stopped!
      if(lock && !speed) {
        var ai = Math.floor(((360 - deg - 90) % 360) / sliceDeg); // deg 2 Array Index
        ai = (slices + ai) % slices; // Fix negative index

        let hostId = label[ai][2];
        let currentRoute = window.location.href;
        let postRoute = currentRoute.substring(0, currentRoute.length - 3);


        // const setHost = () => {
        //   fetch(postRoute, {
        //     method: "POST",
        //     headers: {
        //       "Content-Type": "application/json",
        //       "X-CSRF-Token": document.querySelector('[name="csrf-token"]').content,
        //     },
        //     body: JSON.stringify({ query: hostId }),
        //     credentials: "same-origin"
        //   })
        //     .then(response => response.json())
        //     .then((data) => {
        //       console.log(data);
        //     });
        // }
        // setHost();


        const buttonRoulette = document.querySelector('#button-roulette');
        const buttonSubmit = document.querySelector('#button-submit');
        const hostInput = document.querySelector('#host-input');
        const rouletteForm = document.querySelector('#roulette-form');

        buttonRoulette.classList.add('d-none');

        rouletteForm.insertAdjacentHTML("beforeend", `<input value="${hostId}" type="number" class="form-control numeric integer optional d-none" id="host-input" name="edition[host_id]">`);
        rouletteForm.insertAdjacentHTML("beforeend", `<input type="submit" name="commit" value="See edition!" id="see-edition-button" class="btn btn-lg btn-danger hidden-element" data-disable-with="See edition!">`);


        // return alert("The next host is:\n" + label[ai][0] + " " + label[ai][1]); // Get Array Item from end Degree
        return swal({
          title: label[ai][0] + " " + label[ai][1],
          text: "is the new Host!",
          button: "See edition!",
        }).then((value) => {
          if (value) {
            const seeEditionButton = document.querySelector('#see-edition-button');
            seeEditionButton.click();
          };
        });
      };

      drawImg();
      window.requestAnimationFrame( anim );
    }());

    setTimeout(function() { isStopped = true; }, 2000);
  };

  roulette();
  const button = document.querySelector("#button-roulette")
  button.addEventListener("click", event => {
    button.disabled = true;
    spinRoulette();
  });
};

export { editionRest };
