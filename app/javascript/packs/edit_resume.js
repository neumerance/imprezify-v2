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

    common.initStickyBits();
  });
}

window.EditResume = {
  initPageScript
}
