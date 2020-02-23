import 'packs/src/landing.scss'

require("jquery");
require("popper.js");
require("jquery-easing");
require("waypoints/src/waypoint");
require("bootstrap/dist/js/bootstrap");
require("slick-carousel");
require("packs/form_utils");
require('bootstrap-star-rating');

const activeNavbar = () => {
  const navbar = jQuery('.pb_navbar');
  navbar.addClass('scrolled awake');
}

const scrollWindow = () => {
  jQuery(window).scroll(() => {
      const $w = jQuery(window),
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

const loader = () => {
  jQuery(window).on('load', () => {
    setTimeout(() => {
      if (jQuery('#pb_loader').length > 0) {
        jQuery('#pb_loader').removeClass('show');
      }
    }, 1000);
  });
};

const slickSliders = () => {
  jQuery('.single-item').slick({
    slidesToShow: 1,
    slidesToScroll: 1,
    dots: true,
    infinite: true,
    autoplay: false,
    autoplaySpeed: 2000,
    nextArrow: '<span class="next"><i class="ion-ios-arrow-right"></i></span>',
    preconstrow: '<span class="prev"><i class="ion-ios-arrow-left"></i></span>',
    arrows: true,
    draggable: false,
    adaptiveHeight: true
  });
  jQuery('.single-item-no-arrow').slick({
      slidesToShow: 1,
      slidesToScroll: 1,
      dots: true,
      infinite: true,
      autoplay: true,
      autoplaySpeed: 2000,
      nextArrow: '<span class="next"><i class="ion-ios-arrow-right"></i></span>',
      preconstrow: '<span class="prev"><i class="ion-ios-arrow-left"></i></span>',
      arrows: false,
      draggable: false
  });
  jQuery('.multiple-items').slick({
      slidesToShow: 3,
      slidesToScroll: 1,
      dots: true,
      infinite: true,
      autoplay: true,
      autoplaySpeed: 2000,
      arrows: true,
      nextArrow: '<span class="next"><i class="ion-ios-arrow-right"></i></span>',
      preconstrow: '<span class="prev"><i class="ion-ios-arrow-left"></i></span>',
      draggable: false,
      responsive: [{
          breakpoint: 1125,
          settings: {
              slidesToShow: 2,
              slidesToScroll: 1,
              infinite: true,
              dots: true
          }
      }, {
          breakpoint: 900,
          settings: {
              slidesToShow: 2,
              slidesToScroll: 2
          }
      }, {
          breakpoint: 580,
          settings: {
              slidesToShow: 1,
              slidesToScroll: 1
          }
      }]
  });
  jQuery('.js-pb_slider_content').slick({
      slidesToShow: 1,
      slidesToScroll: 1,
      arrows: false,
      fade: true,
      asNavFor: '.js-pb_slider_nav',
      adaptiveHeight: false
  });
  jQuery('.js-pb_slider_nav').slick({
      slidesToShow: 3,
      slidesToScroll: 1,
      asNavFor: '.js-pb_slider_content',
      dots: false,
      centerMode: true,
      centerPadding: "0px",
      focusOnSelect: true,
      arrows: false
  });
  jQuery('.js-pb_slider_content2').slick({
      slidesToShow: 1,
      slidesToScroll: 1,
      arrows: false,
      fade: true,
      asNavFor: '.js-pb_slider_nav2',
      adaptiveHeight: false
  });
  jQuery('.js-pb_slider_nav2').slick({
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

const OnePageNav = () => {
  const navToggler = jQuery('.navbar-toggler');
  jQuery(".smoothscroll[href^='#'], #probootstrap-navbar ul li a[href^='#']").on('click', function(e) {
      e.preventDefault();
      const hash = this.hash;
      jQuery('html, body').animate({
          scrollTop: jQuery(hash).offset().top
      }, 700, 'easeInOutExpo', () => {
          window.location.hash = hash;
      });
  });
  jQuery("#probootstrap-navbar ul li a[href^='#']").on('click', function(e) {
      if (navToggler.is(':visible')) {
          navToggler.click();
      }
  });
  jQuery('body').on('activate.bs.scrollspy', () => {
      console.log('nice');
  })
};

const offCanvasNav = () => {
  const toggleNav = jQuery('.js-pb_nav-toggle'),
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

const ytpPlayer = () => {
  if (jQuery('.ytp_player').length > 0) {
      jQuery('.ytp_player').mb_YTPlayer();
  }
}

const initRatingField = (selector) => {
  const elem = jQuery(selector);
  elem.rating({
    min: 1,
    max: 5,
    step: 1,
    size:'md',
    filledStar: '<i class="fa fa-star"></i>',
    emptyStar: '<i class="fa fa-star-o" aria-hidden="true"></i>'
  });
  elem.on('rating:change', (event, value, caption) => {
    console.log('value', value);
    elem.rating('update', value);
    console.log('value', elem.val());
  });
}

window.landing =  {
  loader,
  activeNavbar,
  scrollWindow,
  OnePageNav,
  offCanvasNav,
  ytpPlayer,
  slickSliders,
  initRatingField,
}
