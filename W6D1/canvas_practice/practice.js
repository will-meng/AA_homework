document.addEventListener("DOMContentLoaded", function(){
  const canvas = document.getElementById('mycanvas');
  canvas.width = 500;
  canvas.height = 500;

  const ctx = canvas.getContext('2d');
  ctx.fillStyle = 'rgb(255,128,0)';
  ctx.fillRect(10, 10, 450, 450);

  ctx.beginPath();
  ctx.arc(100,100,50, 0, 2*Math.PI);
  ctx.strokeStyle = 'rgb(0,128,255)';
  ctx.lineWidth = 3;
  ctx.stroke();
  ctx.fillStyle = 'blue';
  ctx.fill();
});
