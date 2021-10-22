import Rails from '@rails/ujs';

document.addEventListener('turbolinks:load', function() {
  const control = $("#clockdiv");
  
  if (control) { 
    initializeClock();
  }

})

function initializeClock() {
  const endtime = $("#testEndTime")[0];
  if(endtime) {
    const innerEndtime = endtime.innerHTML;
    const minutesSpan = $("#clockdiv .minutes")[0];
    const secondsSpan = $("#clockdiv .seconds")[0];

    function updateClock() {
      const t = getTimeRemaining(innerEndtime);
      minutesSpan.innerHTML = ("0" + t.minutes).slice(-2);
      secondsSpan.innerHTML = ("0" + t.seconds).slice(-2);

      if (t.total <= 0) {
        clearInterval(timeinterval);
        requestForResult();
      }
    }

    updateClock();
    const timeinterval = setInterval(updateClock, 1000);
  }
}

function requestForResult() {
  const testPassageId = parseInt($(".form-check")[0].dataset.testPassage)

  Rails.ajax({
  url: "/test_passages/" + testPassageId,
  type:'PATCH',
  });
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