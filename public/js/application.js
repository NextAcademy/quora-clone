$(document).ready(function() {
  $('table').on('click', 'a', function(e){
    ele = $(e.target).parent().next()
    num = parseInt(ele.text()) + 1 
    ele.text(num)
  })
