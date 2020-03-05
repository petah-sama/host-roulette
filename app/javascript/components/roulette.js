const roulette = () => {
  function rand(min, max) {
    return Math.random() * (max - min) + min;
  }

  let color = ['#051c4a','#93a3c0','#051c4a','#93a3c0','#051c4a','#93a3c0', "#051c4a", "#93a3c0"];
  let label = ['Hugo', 'Pedro', 'Margarida', 'Rui', 'Francisco', 'Vanessa', 'Hamza', "João"];
  let slices = color.length;
  let sliceDeg = 360/slices;
  let deg = rand(0, 360);
  let speed = 0;
  let slowDownRand = 0;
  let ctx = canvas.getContext('2d');
  let width = canvas.width; // size
  let center = width/2;      // center
  let isStopped = false;
  let lock = false;



  function drawCircleCenter() {
    ctx.beginPath();
    ctx.fillStyle = '#586a88';
    ctx.moveTo(center, center);
    ctx.arc(center, center, width/12, 0, 360);
    ctx.lineTo(center, center);
    ctx.fill();
  }

  function deg2rad(deg) {
    return deg * Math.PI/180;
  }

  function drawSlice(deg, color) {
    ctx.beginPath();
    ctx.fillStyle = color;
    ctx.moveTo(center, center);
    ctx.arc(center, center, width/2, deg2rad(deg), deg2rad(deg+sliceDeg));
    ctx.lineTo(center, center);
    ctx.fill();
  }

  function drawText(deg, text) {
    ctx.save();
    ctx.translate(center, center);
    ctx.rotate(deg2rad(deg));
    ctx.textAlign = "right";
    ctx.fillStyle = "#fff";
    ctx.font = '18px Montserrat';
    ctx.fillText(text, 130, 10);
    ctx.restore();
  }

  function drawImg() {
    ctx.clearRect(0, 0, width, width);
    for(var i=0; i<slices; i++){
      drawSlice(deg, color[i]);
      drawText(deg+sliceDeg/2, label[i]);
      deg += sliceDeg;
    }
    drawCircleCenter();
  }

  (function anim() {
    deg += speed;
    deg %= 360;

    // Increment speed
    if(!isStopped && speed<20){
      speed = speed+2 * 0.1;
    }
    // Decrement Speed
    if(isStopped){
      if(!lock){
        lock = true;
        slowDownRand = rand(0.994, 0.998);
      }
      speed = speed>0.1 ? speed*=slowDownRand : 0;
    }
    // Stopped!
    if(lock && !speed){
      var ai = Math.floor(((360 - deg - 90) % 360) / sliceDeg); // deg 2 Array Index
      ai = (slices+ai)%slices; // Fix negative index
      return alert("The host is:\n"+ label[ai] ); // Get Array Item from end Degree
    }

    drawImg();
    window.requestAnimationFrame( anim );
  }());


  setTimeout(function() { isStopped = true; }, 2000);
};



export { roulette };
