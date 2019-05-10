function debounce(func, wait, immediate) {
  var timeout;
  return function() {
    var context = this, args = arguments;
    var later = function() {
      timeout = null;
      if (!immediate) func.apply(context, args);
    };
    var callNow = immediate && !timeout;
    clearTimeout(timeout);
    timeout = setTimeout(later, wait);
    if (callNow) func.apply(context, args);
  };
};


document.addEventListener("DOMContentLoaded", function(){
  document.getElementById('dish').addEventListener('keyup', delayedSubmitFn)
});

document.addEventListener("DOMContentLoaded", function(){
  document.getElementById('button-addon').addEventListener('click', function(e){
    fetchRecipes(e.target.value);
  })
});

var delayedSubmitFn = debounce(function(e) {
  console.log(e.target.value);
  fetchRecipes(e.target.value);
}, 500)

function fetchRecipes(dishName) {
  var xhr = new XMLHttpRequest();
  xhr.onreadystatechange = function() {
    if (xhr.readyState === 4){
      console.log(xhr.responseText);
      document.getElementById('result-list').innerHTML = xhr.responseText
    }
  };
  xhr.open('GET', '/fetch?dish=' + dishName);
  xhr.send();
}
