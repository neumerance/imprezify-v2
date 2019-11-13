// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.
import 'bootstrap'
import './src/application.scss'

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")

import flatpickr from 'flatpickr';
import { inputAsImageUrl } from './utilities'
import stickybits from 'stickybits';

document.addEventListener('turbolinks:load', () => {
  flatpickr('[data-behaviour="flatpickr"]', {
    altInput: true,
    altFormat: 'F j, Y',
    dateFormat: 'Y-m-d'
  });

  stickybits('[data-behaviour="sticky"]');

  $('[data-behaviour="image-input"]').on('change', (elem) => {
    const imageTag = $(this).attr('data-image-tag');
    inputAsImageUrl(elem);
  });
});

// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)

