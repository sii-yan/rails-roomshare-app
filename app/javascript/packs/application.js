// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.
//= require rails-ujs


import Rails from "@rails/ujs"
// import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "bootstrap";
import "../stylesheets/application.scss";



Rails.start()
// Turbolinks.start()
ActiveStorage.start()


// カレンダー"flatpickr"を適用
import flatpickr from "flatpickr";
import "flatpickr/dist/flatpickr.min.css";
import { Japanese } from "flatpickr/dist/l10n/ja.js";

flatpickr("#datepicker", {
    locale: Japanese
});

document.addEventListener("DOMContentLoaded", function () {
  flatpickr(".js-picker", {
    dateFormat: "Y-m-d",
    minDate: "today",
    locale: "ja"
  });
});

