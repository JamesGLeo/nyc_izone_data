function onHover(event){
  var node = event.target;
    node.style.color = "red";
}

// replace `data-class-name` with html class you use for a row of your data
window.onload = function() {
  var rows = document.getElementsByClassName('school');
  for (var i = 0; i < rows.length; i++) {
    rows[i].addEventListener('mouseover', onHover);
  }
}