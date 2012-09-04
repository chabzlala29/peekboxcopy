$(document).ready(function () {
    $.noConflict();
    jQuery('.bannercontainer').kenburn({
        thumbWidth: 50,
        thumbHeight: 50,
        thumbAmount: 4,
        thumbStyle: "both",
        thumbVideoIcon: "off",
        thumbVertical: "bottom",
        thumbHorizontal: "center",
        thumbXOffset: 0,
        thumbYOffset: 40,
        bulletXOffset: 0,
        bulletYOffset: -16,
        hideThumbs: "on",
        touchenabled: 'on',
        pauseOnRollOverThumbs: 'off',
        pauseOnRollOverMain: 'on',
        preloadedSlides: 2,
        timer: 7,
        debug: "off",
        ////////////////////////////////////////////////////////////////////////////////////////////////////////////////
        //												 Google Fonts !!											 //
        // local GoogleFont JS from your server: http://www.yourdomain.com/kb-plugin/js/jquery.googlefonts.js		 //
        // GoogleFonts from Original Source: http://ajax.googleapis.com/ajax/libs/webfont/1/webfont.js or https:... //
        //			PT+Sans+Narrow:400,700																			//
        /////////////////////////////////////////////////////////////////////////////////////////////////////////////
        googleFonts: 'Oswald',
        googleFontJS: 'kb-plugin/js/jquery.googlefonts.js'
    });
    jQuery('.tnone').click(function () {
        jQuery('.tbull').removeClass('selected');
        jQuery('.tthumb').removeClass('selected');
        jQuery('.tnone').addClass('selected');
        jQuery('.tauto').removeClass('selected');
        jQuery('.kenburn_thumb_container').css({
            'visibility': 'hidden'
        });
        jQuery('.thumbbuttons').css({
            'visibility': 'hidden'
        });
    });
    jQuery('.tthumb').click(function () {
        jQuery('.tbull').removeClass('selected');
        jQuery('.tauto').removeClass('selected');
        jQuery('.tthumb').addClass('selected');
        jQuery('.tnone').removeClass('selected');
        jQuery('.kenburn_thumb_container').css({
            'visibility': 'visible'
        });
        jQuery('.thumbbuttons').css({
            'visibility': 'hidden'
        });
        jQuery('body').addClass('tp_showthumbsalways');
        jQuery('.kenburn_thumb_container').animate({
            'opacity': 1
        }, {
            duration: 300,
            queue: false
        });
    });
    jQuery('.tauto').click(function () {
        jQuery('.tauto').addClass('selected');
        jQuery('.tthumb').removeClass('selected');
        jQuery('.tnone').removeClass('selected');
        jQuery('.tbull').removeClass('selected');
        jQuery('body').removeClass('tp_showthumbsalways');
        jQuery('.kenburn_thumb_container').css({
            'visibility': 'visible'
        });
        jQuery('.thumbbuttons').css({
            'visibility': 'hidden'
        });
        setTimeout(function () {
            jQuery('.kenburn_thumb_container').animate({
                'opacity': 0
            }, {
                duration: 300,
                queue: false
            });
        }, 100);
    });
    jQuery('.tbull').click(function () {
        jQuery('.tbull').addClass('selected');
        jQuery('.tauto').removeClass('selected');
        jQuery('.tthumb').removeClass('selected');
        jQuery('.tnone').removeClass('selected');
        jQuery('.kenburn_thumb_container').css({
            'visibility': 'hidden'
        });
        jQuery('.thumbbuttons').css({
            'visibility': 'visible'
        });
    });
    jQuery('body').addClass('tp_showthumbsalways');
    jQuery('.tthumb').click();
});