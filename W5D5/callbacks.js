window.setTimeout(function(){
  alert('HAMMERTIME');
}, 5000);

const hammerTime = function(time){
  window.setTimeout(function(){
    alert(`${time} is HAMMERTIME`);
  }, 5000);
};

hammerTime(Date.now(), 2000);
