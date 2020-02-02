var scrollWindow = function() {
  jQuery(window).scroll(function() {
      var $w = jQuery(this),
          st = $w.scrollTop(),
          navbar = jQuery('.pb_navbar'),
          sd = jQuery('.js-scroll-wrap');
      if (st > 150) {
          if (!navbar.hasClass('scrolled')) {
              navbar.addClass('scrolled');
          }
      }
      if (st < 150) {
          if (navbar.hasClass('scrolled')) {
              navbar.removeClass('scrolled sleep');
          }
      }
      if (st > 350) {
          if (!navbar.hasClass('awake')) {
              navbar.addClass('awake');
          }
          if (sd.length > 0) {
              sd.addClass('sleep');
          }
      }
      if (st < 350) {
          if (navbar.hasClass('awake')) {
              navbar.removeClass('awake');
              navbar.addClass('sleep');
          }
          if (sd.length > 0) {
              sd.removeClass('sleep');
          }
      }
  });
};

var loader = function() {
  setTimeout(function() {
      if (jQuery('#pb_loader').length > 0) {
          jQuery('#pb_loader').removeClass('show');
      }
  }, 700);
};

var slickSliders = function() {
  jQuery('.pb_slider_content').slick({
      slidesToShow: 1,
      slidesToScroll: 1,
      arrows: false,
      fade: true,
      asNavFor: '.js-pb_slider_nav',
      adaptiveHeight: false
  });
  jQuery('.pb_slider_nav').slick({
      slidesToShow: 3,
      slidesToScroll: 1,
      asNavFor: '.js-pb_slider_content',
      dots: false,
      centerMode: true,
      centerPadding: "0px",
      focusOnSelect: true,
      arrows: false
  });
  jQuery('.pb_slider_content2').slick({
      slidesToShow: 1,
      slidesToScroll: 1,
      arrows: false,
      fade: true,
      asNavFor: '.js-pb_slider_nav2',
      adaptiveHeight: false
  });
  jQuery('.pb_slider_nav2').slick({
      slidesToShow: 3,
      slidesToScroll: 1,
      asNavFor: '.js-pb_slider_content2',
      dots: false,
      centerMode: true,
      centerPadding: "0px",
      focusOnSelect: true,
      arrows: false
  });
};

var OnePageNav = function() {
  var navToggler = jQuery('.navbar-toggler');
  jQuery(".smoothscroll[href^='#'], #probootstrap-navbar ul li a[href^='#']").on('click', function(e) {
      e.preventDefault();
      var hash = this.hash;
      jQuery('html, body').animate({
          scrollTop: jQuery(hash).offset().top
      }, 700, 'easeInOutExpo', function() {
          window.location.hash = hash;
      });
  });
  jQuery("#probootstrap-navbar ul li a[href^='#']").on('click', function(e) {
      if (navToggler.is(':visible')) {
          navToggler.click();
      }
  });
  jQuery('body').on('activate.bs.scrollspy', function() {
      console.log('nice');
  })
};

var offCanvasNav = function() {
  var toggleNav = jQuery('.js-pb_nav-toggle'),
      offcanvasNav = jQuery('.js-pb_offcanvas-nav_v1');
  if (toggleNav.length > 0) {
      toggleNav.click(function(e) {
          jQuery(this).toggleClass('active');
          offcanvasNav.addClass('active');
          e.preventDefault();
      });
  }
  offcanvasNav.click(function(e) {
      if (offcanvasNav.hasClass('active')) {
          offcanvasNav.removeClass('active');
          toggleNav.removeClass('active');
      }
      e.preventDefault();
  })
};

var ytpPlayer = function() {
  if (jQuery('.ytp_player').length > 0) {
      jQuery('.ytp_player').mb_YTPlayer();
  }
}

const script = require("scriptjs");

script('https://code.jquery.com/jquery-3.2.1.min.js', () => {
  script('https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.3/jquery.easing.min.js');
  script('https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js');
  script('https://cdnjs.cloudflare.com/ajax/libs/waypoints/4.0.1/jquery.waypoints.min.js');
  script('https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js');
  script('https://cdnjs.cloudflare.com/ajax/libs/jquery.mb.YTPlayer/3.2.10/jquery.mb.YTPlayer.min.js');
  script('https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.7.1/slick.min.js');
  jQuery(document).ready(function($) {
    loader();
    scrollWindow();
    OnePageNav();
    offCanvasNav();
    ytpPlayer();
    slickSliders();
  });
});
