import Rails from "@rails/ujs";
import flatpickr from 'flatpickr';

const inputAsImageUrl = (input) => {
  if (input.target.files && input.target.files[0]) {
    const reader = new FileReader();
    reader.onload = function(e) {
      $('#'+input.target.attributes['data-image-tag'].value+'_preview').attr('src', e.target.result);
    }
    reader.readAsDataURL(input.target.files[0]);
  }
}

const addMoreField = (elem) => {
  const el = $(elem);
  const input_button = $('<div class="input-group-append mb-2">').html($('<button class="btn btn-sm btn-outline-danger" type="button" onclick="formUtils.removeField(this)">').text('Remove'));
  const input_group = $('<div class="input-group">');
  input_group.append(`<input name="${el.attr('data-object-name')}" class="form-control mb-2" placeholder="Put description here" onchange="formUtils.submitForm(this)" />`);
  input_group.append(input_button);
  el.before(input_group);
}

const removeField = (elem) => {
  const inputGroup = $(elem).parents('.input-group');
  const form = inputGroup.parents('form');
  inputGroup.remove();
  Rails.fire(form[0], 'submit');
}

const submitForm = (el) => {
  Rails.fire($(el).parents('form')[0], 'submit')
}

const submitFormById = (formSel) => {
  Rails.fire(document.getElementById(formSel), 'submit')
}

const initFlatpickr = () => {
  flatpickr('[data-behaviour="flatpickr"]', {
    altInput: true,
    altFormat: 'F j, Y',
    dateFormat: 'Y-m-d'
  });
}

window.formUtils = {
  inputAsImageUrl,
  addMoreField,
  removeField,
  submitForm,
  submitFormById,
  initFlatpickr
}
