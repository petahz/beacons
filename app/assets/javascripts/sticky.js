$(document).ready(function(){

  var stickyribbon = document.querySelector('.stickyribbon');
  var nav = document.querySelector('.main-nav');
  var top = document.querySelector('.top');

  var check = function(){
    if (document.body.scrollTop > (nav.clientHeight + top.clientHeight)) {
      stickyribbon.style.position = 'fixed';
  	  stickyribbon.style.top = 0;
    } else {
      stickyribbon.style.position = '';
  	}
  };

  document.addEventListener('scroll', check);
});