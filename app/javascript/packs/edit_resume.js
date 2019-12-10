const initPageScript = () => {
  document.addEventListener('turbolinks:load', () => {
    formUtils.initFlatpickr();

    $('[data-behaviour="image-input"]').on('change', (elem) => {
      formUtils.inputAsImageUrl(elem);
    });

    $(document)
      .on('ajax:beforeSend', 'form', () => {
        common.togglePreloader();
      })
      .on('ajax:success', 'form', (data, status, xhr) => {
        common.togglePreloader();
      })
      .on('ajax:error', 'form', (data, status, xhr) => {
        common.togglePreloader();
      })

    common.initStickyBits();
  });
}

window.EditResume = {
  initPageScript
}
