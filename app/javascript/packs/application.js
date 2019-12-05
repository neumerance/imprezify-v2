// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.
import './src/application.scss'

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")
require("jquery")
require("bootstrap/dist/js/bootstrap")

import flatpickr from 'flatpickr';
import { inputAsImageUrl } from './utilities'
import stickybits from 'stickybits';
import alertify from 'alertifyjs'
import Rails from "@rails/ujs";

alertify.defaults.glossary.title = 'Imprezify';

const getOffset = (element, horizontal = false) => {
  if(!element) return 0;
  return getOffset(element.offsetParent, horizontal) + (horizontal ? element.offsetLeft : element.offsetTop);
}

window.moveToHash = (container = 'html, body') => {
  $(document).ready(() => {
    if (window.location.hash) {
      setTimeout(() => {
        const anchor = jQuery(`a[name="${window.location.hash.substring(1)}"]`);
          $(container).animate({
            scrollTop: getOffset(anchor.get(0)) - 100
          }, 1000);
      }, 200);
    }
  });
}

window.addMoreField = (elem) => {
  const el = $(elem);
  const input_button = $('<div class="input-group-append mb-2">').html($('<button class="btn btn-sm btn-outline-danger" onclick="removeField(this)">').text('Remove'));
  const input_group = $('<div class="input-group">');
  input_group.append(`<input name="${el.attr('data-object-name')}" class="form-control mb-2" placeholder="Put description here" onchange="submitForm(this)" />`);
  input_group.append(input_button);
  el.before(input_group);
}

window.removeField = (elem) => {
  $(elem).parents('.input-group').remove();
  Rails.fire($(el).parents('form')[0], 'submit');
}

window.destroySection = (elem, model_id, model_name) => {
  const el = $(elem);
  alertify.confirm('Are you sure you want to delete this?', () => {
    const section = el.parents('.section');
    const card = section.parents('.card');
    if (model_id) {
      section.append(`<input type="hidden" name="${model_name}[_destroy]" value="true" />`);
    }
    Rails.fire($(el).parents('form')[0], 'submit');
    card.remove();
  });
}

window.submitForm = (el) => {
  Rails.fire($(el).parents('form')[0], 'submit')
}

window.hasActiveAjax = () => {
  return $.active;
}

window.updateContent = (sel, content) => {
  $(sel).html(content);
}

window.updateProgress = (sel, value) => {
  $(sel).attr('aria-valuenow', value).css('width', `${value}%`);
}

window.initStickyBits = () => {
  stickybits('[data-behaviour="sticky"]');
}

document.addEventListener('turbolinks:load', () => {
  flatpickr('[data-behaviour="flatpickr"]', {
    altInput: true,
    altFormat: 'F j, Y',
    dateFormat: 'Y-m-d'
  });

  $('[data-behaviour="image-input"]').on('change', (elem) => {
    const imageTag = $(this).attr('data-image-tag');
    inputAsImageUrl(elem);
  });

  $(document)
    .on('ajax:beforeSend', 'form', () => {
      $('#preloader').show();
    })
    .on('ajax:success', 'form', (data, status, xhr) => {
      $('#preloader').hide();
    })
    .on('ajax:error', 'form', (data, status, xhr) => {
      $('#preloader').hide();
    })

  initStickyBits();
});

// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)
