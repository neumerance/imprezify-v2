const getOffset = (element, horizontal = false) => {
  if(!element) return 0;
  return getOffset(element.offsetParent, horizontal) + (horizontal ? element.offsetLeft : element.offsetTop);
}

const hasActiveAjax = () => {
  return $.active;
}

const updateContent = (sel, content) => {
  $(sel).html(content);
}

const appendTo = (sel, content) => {
  $(sel).append(content);
}

window.utilities = {
  getOffset,
  hasActiveAjax,
  updateContent,
  appendTo
}
