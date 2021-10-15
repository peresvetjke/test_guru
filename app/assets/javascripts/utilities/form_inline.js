document.addEventListener('turbolinks:load', function() {
  controls = $(".form-inline-link");

  if (controls.length) {
    for (var i = 0; i < controls.length; i++) {
      controls[i].addEventListener('click', formInlineLinkHandler);  
    }
  }

  var errors = document.querySelector('.errors');
  
})

function formInlineLinkHandler(event) {
  event.preventDefault();

  var testId = this.dataset.testId;

  formInlineHandler(testId);
}

function formInlineHandler(testId, errors = null) {
  var link = document.querySelector('.form-inline-link[data-test-id="' + testId + '"]');
  var testTitle = document.querySelector('.test-title[data-test-id="' + testId + '"]');
  var formInline = document.querySelector('.form-inline[data-test-id="' + testId + '"]');

  console.log(errors);
  if (!!errors) {
    console.log('im in if errors');
    testTitle.classList.remove('hide');
    formInline.classList.add('hide');
    link.textContent = 'Cancel';
    return;
  }

  if (formInline.classList.contains('hide')) {
    testTitle.classList.add('hide');
    formInline.classList.remove('hide');
    link.textContent = 'Cancel';
  } else {
    testTitle.classList.remove('hide');
    formInline.classList.add('hide');
    link.textContent = 'Edit';
  }
}