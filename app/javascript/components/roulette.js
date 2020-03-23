import * as d3 from 'd3';
import swal from 'sweetalert';

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

  let data = [];
  let members = document.querySelectorAll('#user-names');
  members.forEach(function(member) {
    data.push({ "label": member.dataset.name,  "value": member.dataset.id });
  });

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

        oldrotation = rotation;



        let hostId = data[picked].value;

        const rouletteForm = document.querySelector('#roulette-form');


        rouletteForm.insertAdjacentHTML("beforeend", `<input value="${hostId}" type="number" class="form-control numeric integer optional d-none" id="host-input" name="edition[host_id]">`);
        rouletteForm.insertAdjacentHTML("beforeend", `<input type="submit" name="commit" value="See edition!" id="see-edition-button" class="btn btn-lg btn-danger hidden-element d-none" data-disable-with="See edition!">`);


        setInterval(lowerSongVolume, 500);

        return swal({
          title: `🎉 ${data[picked].label} 🎉`,
          text: "is the new Host!",
          button: "See event!",
          closeOnEsc: false,
          closeOnClickOutside: false,
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
      .style({"fill":"#051c4a"});

  //draw spin circle
  container.append("circle")
      .attr("cx", 0)
      .attr("cy", 0)
      .attr("r", 60)
      .style({"fill":"#051c4a"});

  //spin text
  // container.append("text")
  //     .attr("x", 0)
  //     .attr("y", 15)
  //     .attr("text-anchor", "middle")
  //     .text("Host \n Roulette")
  //     .style({"font-weight":"bold", "font-size":"30px", "font-family":"Lobster"});


  function rotTween(to) {
    var i = d3.interpolate(oldrotation % 360, rotation);
    return function(t) {
      return "rotate(" + i(t) + ")";
    };
  }

  const song = document.getElementById('song');

  const lowerSongVolume = () => {
    if (song.volume === 0.3) {
      return;
    }

    song.volume = Math.max(song.volume - 0.1, 0.3);
  }

  const button = document.querySelector("#button-roulette")

  // Click 'Spin to pick host!'
  button.addEventListener("click", event => {
    button.disabled = true;
    spin();
    song.currentTime += 0.5;
    song.play();
  });
};

export { rouletteWheel };
