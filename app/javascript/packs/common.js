import stickybits from 'stickybits';

const moveToAnchor = (container, anchor_name) => {
  const anchor = $(`a[name="${anchor_name}"]`);
  $(container).animate({
    scrollTop: utilities.getOffset(anchor.get(0)) - 100
  }, 1000);
}

const initStickyBits = () => {
  stickybits('[data-behaviour="sticky"]');
}

const togglePreloader = () => {
  const elem = $('#preloader');
  const visible = elem.is(':visible');
  if (visible) {
    elem.hide();
  } else {
    elem.show();
  }
}

const hidePreloader = () => {
  $('#preloader').hide();
}

window.common = {
  moveToAnchor,
  initStickyBits,
  togglePreloader,
  hidePreloader
}
