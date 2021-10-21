document.addEventListener('turbolinks:load', function() {
  var control = document.querySelector('#clockdiv');

  if (control) { 
    initializeClock() 
  }
})

function initializeClock() {
  const endtime = document.getElementById("testEndTime");
  if(endtime) {
    const innerEndtime = endtime.innerHTML
    const clock = document.getElementById("clockdiv");
    const minutesSpan = clock.querySelector(".minutes");
    const secondsSpan = clock.querySelector(".seconds");

    function updateClock() {
      const t = getTimeRemaining(innerEndtime);
      minutesSpan.innerHTML = ("0" + t.minutes).slice(-2);
      secondsSpan.innerHTML = ("0" + t.seconds).slice(-2);

      if (t.total <= 0) {
        clearInterval(timeinterval);
        window.location.reload();
      }
    }

    updateClock();
    const timeinterval = setInterval(updateClock, 1000);
  }
}

function getTimeRemaining(endtime) {
  const total = Date.parse(endtime) - Date.parse(new Date());
  const seconds = Math.floor((total / 1000) % 60);
  const minutes = Math.floor((total / 1000 / 60) % 60);
  return {
    total,
    minutes,
    seconds,
  };
}