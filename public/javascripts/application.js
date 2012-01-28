// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults


// ========================================================================================================
// script for articles year wise and month wise


 /* year month displaying in sidebar */

    $(document).ready(function(){
        $("a.trigger").click(function () {
            $(this).next().animate({
                height: 'toggle', opacity: 'toggle'
            }, "slow");
            $(this).toggleClass("opened");
            return false;
        });
    });

// ========================================================================================================



/* Flash messages Time out*/

$(document).ready(function () {
    setTimeout( function() {
        $('.app_flash').hide();
    }, 10000 );
});


// ========================================================================================================



// ========================================================================================================
