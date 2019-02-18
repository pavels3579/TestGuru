document.addEventListener('turbolinks:load', function() {
  var elem = document.querySelector('.my-bar');
  if (elem) {
    width = elem.dataset.barWidth;
    elem.style.width = width + '%';
  }
})
