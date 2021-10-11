document.addEventListener('turbolinks:load', function() {
  var password = document.querySelector('#user_password');
  var confirm_password = document.querySelector('#user_password_confirmation');

  if (password !== null && confirm_password !== null) {
    document.querySelector('.octicon-check').classList.add('hide');
    document.querySelector('.octicon-x').classList.add('hide');
    document.querySelector('#confirm_fail_message').classList.add('hide');

    password.addEventListener('input', check_match);
    confirm_password.addEventListener('input', check_match);
  }
})

function check_match() {
  var pw = document.querySelector('#user_password');
  var confirmation_pw = document.querySelector('#user_password_confirmation');
  var success_sign = document.querySelector('.octicon-check');
  var failure_sign = document.querySelector('.octicon-x');
  var confirm_fail_message = document.querySelector('#confirm_fail_message');

  if (confirmation_pw.value === '') {
    success_sign.classList.add('hide');
    failure_sign.classList.add('hide');
    confirm_fail_message.classList.add('hide');
  } else if (confirmation_pw.value === pw.value) {
    success_sign.classList.remove('hide');
    failure_sign.classList.add('hide');  
    confirm_fail_message.classList.add('hide');
  } else if (confirmation_pw.value !== pw.value) {
    success_sign.classList.add('hide');
    failure_sign.classList.remove('hide');  
    confirm_fail_message.classList.remove('hide');
  }
}