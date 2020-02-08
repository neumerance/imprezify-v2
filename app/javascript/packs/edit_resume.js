import ClipboardJS from "clipboard";

const loader = () => {
  jQuery(window).on('load', () => {
    setTimeout(() => {
      if (jQuery('#pb_loader').length > 0) {
        jQuery('#pb_loader').removeClass('show');
      }
    }, 1000);
  });
};

const initPageScript = () => {
  document.addEventListener('turbolinks:load', () => {
    formUtils.initFlatpickr();

    $('[data-behaviour="image-input"]').on('change', (elem) => {
      formUtils.inputAsImageUrl(elem);
    });

    $(document)
    .on('ajax:beforeSend', () => {
      console.log('beforeSend');
      common.togglePreloader();
    })
    .on('ajax:success', (data, status, xhr) => {
      console.log('success');
      common.togglePreloader();
    })
    .on('ajax:error', (data, status, xhr) => {
      console.log('error');
      common.togglePreloader();
    })
    loader();
  });
}

const initClipboard = (sel) => {
  new ClipboardJS(sel);
}

window.EditResume = {
  initPageScript,
  initClipboard
}
