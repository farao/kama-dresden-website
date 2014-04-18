// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require_tree .
//= require datetimepicker
//= require fullcalendar

// load event handlers
$(document).ready(function() {
    // messages
    var n = $('#notice');
    var a = $('#alert');
    n.click(function() { n.slideToggle(); } );
    a.click(function() { a.slideToggle(); } );
    
    // login
    var l = $('#login');
    var ls = $('#login-small');
    ls.click(function() {
        l.slideToggle();
        if(ls.offset().top != l.offset().top)
            l.addClass('shadow');
        else
            l.removeClass('shadow');
    });
});


// load floating navbar
$(function() {
    // Stick the #navbar to the top of the window
    var nav = $('#navWrapper');
    var navLogo = $('#navLogo');
    var navHomeY = nav.offset().top;
    var isFixed = false;
    var $w = $(window);
    
    $w.scroll(function() {
        var shouldBeFixed = $w.scrollTop() > navHomeY;
        if (shouldBeFixed && !isFixed) {
            nav.css({
                position: 'fixed',
                top: 0,
                left: nav.offset().left,
                width: '100%'
            });
            nav.addClass('shadow');
//            navLogo.fadeIn();
            isFixed = true;
        }
        else if (!shouldBeFixed && isFixed)
        {
            nav.css({
                position: 'static'
            });
            nav.removeClass('shadow');
//            navLogo.fadeOut(300);
            isFixed = false;
        }
    });
});

