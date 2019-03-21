document.addEventListener('turbolinks:load', function() {
  var elem = document.querySelector('.my-timer');
  if (elem) {
    var form = document.querySelector('#pass_form');

    var i = Math.ceil(elem.dataset.timeLeft);

    var idInt = setInterval(function() {
      s = i % 60;
      m = (i - s)/60;

      if (i >= 0) {
        elem.innerHTML = m+":"+s;
      } else {
        clearInterval(idInt);
        form.submit();
      }

      i -= 1;
    }, 1000);
  }
})
