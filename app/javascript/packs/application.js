// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.
//= require jquery3
//= require turbolinks
//= require popper
//= require bootstrap-sprockets
//= require_tree .

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"
import "../../assets/javascripts/utilities/sorting.js"
import "../../assets/javascripts/utilities/confirming_password.js"
import "../../assets/javascripts/utilities/form_inline.js"
import "../../assets/javascripts/utilities/progress_bar.js"
import "../../assets/javascripts/utilities/timer.js"

Rails.start()
Turbolinks.start()
ActiveStorage.start()