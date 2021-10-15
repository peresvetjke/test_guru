document.addEventListener('turbolinks:load', function() {
  controls = $(".form-inline-link");

  if (controls.length) {
    for (var i = 0; i < controls.length; i++) {
      controls[i].addEventListener('click', formInlineLinkHandler);  
    }
  }

  var errorsResourceId = document.querySelector('.errors').dataset.resource;
  
  if (!!errorsResourceId) {
    console.log('Im in if (!!errorsResourceId) {')
    errorsHandler(errorsResourceId);
  }
})

function formInlineLinkHandler(event) {
  event.preventDefault();

  var testId = this.dataset.testId;

  formInlineHandler(testId);
}

function errorsHandler(testId = errorsResourceId) {
  console.log('im in errors handler!')
  var testTitle = document.querySelector('.test-title[data-test-id="' + testId + '"]');
  var formInline = document.querySelector('.form-inline[data-test-id="' + testId + '"]');

  testTitle.classList.add('hide');
  formInline.classList.remove('hide');
  link.textContent = 'Cancel';
}

function formInlineHandler(testId) {
  var link = document.querySelector('.form-inline-link[data-test-id="' + testId + '"]');
  var testTitle = document.querySelector('.test-title[data-test-id="' + testId + '"]');
  var formInline = document.querySelector('.form-inline[data-test-id="' + testId + '"]');

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

// function showFormInLine
  
//   testTitle.classList.remove('hide');
//   formInline.classList.add('hide');
//   link.textContent = 'Cancel';
//   return;
//   }

// function hideFormInLine