import * as d3 from 'd3';


const rouletteWheel = () => {

  const padding = {
    top: 20,
    right: 40,
    bottom: 0,
    left: 0
  }
  const w = 500 - padding.left - padding.right;
  const h = 500 - padding.top  - padding.bottom;
  const r = Math.min(w, h)/2;
  let rotation = 0;
  let oldrotation = 0;
  let picked = 100000;
  let oldpick = [];
  let color = d3.scale.category20();

  const data = [
    { "label": "Tiago Carvalho",  "value": 1 },
    { "label": "Shannon Graybill",  "value": 2 },
    { "label": "Pedro Alberto",  "value": 3 },
    { "label": "Humberto Coelho",  "value": 4 },
    { "label": "Adalberto Bruno",  "value": 5 },
    { "label": "Ricardo Otero",  "value": 6 },
    { "label": "Maria Vacondeus",  "value": 7 },
    { "label": "Patrick Pinto",  "value": 8 },
    { "label": "Rui Vitor Baltazar",  "value": 9 },
    { "label": "Pequeno Eusébio", "value": 10 },
  ];

  oldpick = [{ "label": "Shannon Graybill",  "value": 2 }];

  const svg = d3.select('#chart')
    .append("svg")
    .data([data])
    .attr("width",  w + padding.left + padding.right)
    .attr("height", h + padding.top + padding.bottom);

  const container = svg.append("g")
    .attr("class", "chartholder")
    .attr("transform", "translate(" + (w/2 + padding.left) + "," + (h/2 + padding.top) + ")");

  const vis = container.append("g");

  // same sized parts on a pie chart
  const pie = d3.layout.pie().sort(null).value(function(d){ return 1; });

  // declare an arc generator function
  const arc = d3.svg.arc().outerRadius(r);

  // select paths, use arc generator to draw
  const arcs = vis.selectAll('g.slice')
      .data(pie)
      .enter()
      .append('g')
      .attr('class', 'slice');

  arcs.append("path")
      .attr("fill", function(_d, i){ return color(i); })
      .attr("d", function (d) { return arc(d); });

  // add the text
  arcs.append("text").attr("transform", function(d) {
    d.innerRadius = 0;
    d.outerRadius = r;
    d.angle = (d.startAngle + d.endAngle)/2;
      return "rotate(" + (d.angle * 180 / Math.PI - 90) + ")translate(" + (d.outerRadius -10) +")";
  })
  .attr("text-anchor", "end")
  .text( function(_d, i) {
    return data[i].label;
  });

  // container.on("click", spin);

  function spin() {
    container.on("click", null);

    // all slices have been seen, all done
    if (oldpick.length === data.length) {
      container.on("click", null);
      return;
    }

    let ps = 360/data.length;
    let rng = Math.floor((Math.random() * 1440) + 360);

    rotation = (Math.round(rng / ps) * ps);
    picked = Math.round(data.length - (rotation % 360)/ps);
    picked = picked >= data.length ? (picked % data.length) : picked;

    if (oldpick.indexOf(picked) !== -1){
      d3.select(this).call(spin);
      return;
    } else {
      oldpick.push(picked);
    }

    rotation += 90 - Math.round(ps/2);

    vis.transition()
      .duration(3000)
      .attrTween("transform", rotTween)
      .each("end", function() {
        // mark as picked
        d3.select(".slice:nth-child(" + (picked + 1) + ") path")
          .classed({'selected': true });

        // populate answer
        d3.select("#picked")
          .text(`Picked: ${data[picked].label}`);

        oldrotation = rotation;

        setInterval(lowerSongVolume, 500);

        let hostId = data[picked].label;

        setInterval(lowerSongVolume, 500);

        const hostInput = document.querySelector('#host-input');
        const rouletteForm = document.querySelector('#roulette-form');

        rouletteForm.insertAdjacentHTML("beforeend", `<input value="${hostId}" type="number" class="form-control numeric integer optional d-none" id="host-input" name="edition[host_id]">`);
        rouletteForm.insertAdjacentHTML("beforeend", `<input type="submit" name="commit" id="see-edition-button" class="d-none">`);


        return swal({
          title: data[picked].label,
          text: "is the new Host!",
          button: "See edition!",
        }).then((value) => {
          if (value) {
            const seeEditionButton = document.querySelector('#see-edition-button');
            seeEditionButton.click();
          };
        });
      });
  }

  //make arrow
  svg.append("g")
      .attr("transform", "translate(" + (w + padding.left + padding.right) + "," + ((h/2)+padding.top) + ")")
      .append("path")
      .attr("d", "M-" + (r*.15) + ",0L0," + (r*.05) + "L0,-" + (r*.05) + "Z")
      .style({"fill":"black"});

  //draw spin circle
  container.append("circle")
      .attr("cx", 0)
      .attr("cy", 0)
      .attr("r", 60)
      .style({"fill":"white","cursor":"pointer"});

  //spin text
  container.append("text")
      .attr("x", 0)
      .attr("y", 15)
      .attr("text-anchor", "middle")
      .text("SPIN!")
      .style({"font-weight":"bold", "font-size":"30px"});


  function rotTween(to) {
    var i = d3.interpolate(oldrotation % 360, rotation);
    return function(t) {
      return "rotate(" + i(t) + ")";
    };
  }

  const song = document.getElementById('song');

  const lowerSongVolume = () => {
    if (song.volume === 0.4) {
      return;
    }

    song.volume = Math.max(song.volume - 0.1, 0.4);
  }

  const button = document.querySelector("#button-roulette")

  button.addEventListener("click", event => {
    button.disabled = true;
    spin();
    song.currentTime += 0.5;
    song.play();
  });
};

export { rouletteWheel };

// import swal from 'sweetalert';


// const editionRest = () => {
//   const song = document.getElementById('song');

//   function rand(min, max) {
//     return Math.random() * (max - min) + min;
//   };

//   let color = [];
//   let basicColors = ['#051c4a','#93a3c0','#D95140']


//   let label = [];
//   let members = document.querySelectorAll('.user-names');
//   members.forEach(function(member) {
//     label.push([member.dataset.name, member.dataset.last, member.dataset.id]);
//   });

//   for (var i = 0; i < label.length; i++){
//     if (i === 0) {
//       color.push(basicColors[1]);
//     } else if (i % 2 === 0) {
//       color.push(basicColors[0]);
//     } else {
//       color.push(basicColors[2]);
//     };
//   };


//   let slices = color.length;
//   let sliceDeg = 360/slices;
//   let deg = rand(0, 360);
//   let speed = 0;
//   let slowDownRand = 0;
//   let ctx = canvas.getContext('2d');
//   let width = canvas.width; // size
//   let center = width/2;     // center
//   let isStopped = false;
//   let lock = false;

//   function drawCircleCenterInner() {
//     ctx.beginPath();
//     ctx.fillStyle = '#051c4a';
//     ctx.moveTo(center, center);
//     ctx.arc(center, center, width / 15, 0, 10);
//     ctx.lineTo(center, center);
//     ctx.fill();
//   };

//   function drawCircleCenterOutter() {
//     ctx.beginPath();
//     ctx.fillStyle = '#586a88';
//     ctx.moveTo(center, center);
//     ctx.arc(center, center, width / 10, 0, 10);
//     ctx.lineTo(center, center);
//     ctx.fill();
//   };

//   function deg2rad(deg) {
//     return deg * Math.PI/180;
//   };

//   function drawSlice(deg, color) {
//     ctx.beginPath();
//     ctx.fillStyle = color;
//     ctx.moveTo(center, center);
//     ctx.arc(center, center, width / 2, deg2rad(deg), deg2rad(deg+sliceDeg));
//     ctx.lineTo(center, center);
//     ctx.fill();
//   };

//   function drawText(deg, text) {
//     ctx.save();
//     ctx.translate(center, center);
//     ctx.rotate(deg2rad(deg));
//     ctx.textAlign = "left";
//     ctx.fillStyle = "#fff";
//     ctx.font = '35px Montserrat';
//     ctx.fillText(text, 130, 10);
//     ctx.restore();
//   };

//   function drawImg() {

//     ctx.clearRect(0, 0, width, width);
//     for(var i = 0; i < slices; i++){
//       drawSlice(deg, color[i]);
//       let memberName = label[i][0] + " " + label[i][1][0] + ".";
//       drawText(deg + sliceDeg / 2, memberName);
//       deg += sliceDeg;
//     };
//     drawCircleCenterOutter();
//     drawCircleCenterInner();
//   };


//   const roulette = () => {

//     drawImg();
//   };

//   const lowerSongVolume = () => {
//     if (song.volume === 0.4) {
//       return;
//     }

//     song.volume = Math.max(song.volume - 0.2, 0.4);
//   }

//   const spinRoulette = () => {
//     (function anim() {
//       deg += speed;
//       deg %= 360;

//       // Increment speed
//       if(!isStopped && speed < 10) {    // set the last value to 10
//         speed = speed + 2 * 0.1;
//       };
//       // Decrement Speed
//       if (isStopped){
//         if(!lock){
//           lock = true;
//           slowDownRand = rand(0.990, 0.991);
//         };

//         speed = speed > 0.1 ? speed *= slowDownRand : 0;
//       };
//       // Stopped!
//       if(lock && !speed) {
//         var ai = Math.floor(((360 - deg - 90) % 360) / sliceDeg); // deg 2 Array Index
//         ai = (slices + ai) % slices; // Fix negative index

//         let hostId = label[ai][2];
//         let currentRoute = window.location.href;
//         let postRoute = currentRoute.substring(0, currentRoute.length - 3);

//         setInterval(lowerSongVolume, 500);

//         const buttonRoulette = document.querySelector('#button-roulette');
//         const buttonSubmit = document.querySelector('#button-submit');
//         const hostInput = document.querySelector('#host-input');
//         const rouletteForm = document.querySelector('#roulette-form');

//         buttonRoulette.classList.add('d-none');

//         rouletteForm.insertAdjacentHTML("beforeend", `<input value="${hostId}" type="number" class="form-control numeric integer optional d-none" id="host-input" name="edition[host_id]">`);
//         rouletteForm.insertAdjacentHTML("beforeend", `<input type="submit" name="commit" value="See edition!" id="see-edition-button" class="btn btn-lg btn-danger hidden-element" data-disable-with="See edition!">`);


//         // return alert("The next host is:\n" + label[ai][0] + " " + label[ai][1]); // Get Array Item from end Degree
//         return swal({
//           title: label[ai][0] + " " + label[ai][1],
//           text: "is the new Host!",
//           button: "See edition!",
//         }).then((value) => {
//           if (value) {
//             const seeEditionButton = document.querySelector('#see-edition-button');
//             seeEditionButton.click();
//           };
//         });
//       };

//       drawImg();
//       window.requestAnimationFrame( anim );
//     }());

//     setTimeout(function() { isStopped = true; }, 2000);
//   };

//   roulette();
//   const button = document.querySelector("#button-roulette")

//   button.addEventListener("click", event => {
//     button.disabled = true;
//     spinRoulette();
//     song.currentTime += 0.5;
//     song.play();
//   });
// };

// export { editionRest };
