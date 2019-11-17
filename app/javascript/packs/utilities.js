export const inputAsImageUrl = (input) => {
  if (input.target.files && input.target.files[0]) {
    const reader = new FileReader();
    reader.onload = function(e) {
      $('#'+input.target.attributes['data-image-tag'].value+'_preview').attr('src', e.target.result);
    }
    reader.readAsDataURL(input.target.files[0]);
  }
}
