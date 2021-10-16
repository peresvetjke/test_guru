document.addEventListener('turbolinks:load', function() {   
  var elem = document.getElementById("test-bar");
  var width = parseInt(elem.dataset.prevProgress);
  var progress = parseInt(elem.dataset.progress);

  elem.style.width = width + "%";
  elem.innerHTML = width  + "%";

  var id = setInterval(frame, 10);
  
  function frame() {
    if (width >= progress) {
    clearInterval(id);
    } else {
      width++;
      elem.style.width = width + "%";
      elem.innerHTML = width + "%";
    }
  }

})