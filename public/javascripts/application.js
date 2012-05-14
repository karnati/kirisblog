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

jQuery(function($) {
$('#theme').bind('change', function() {
var ids_id = $('#theme').val();
$.get("/home/load_theme", {id: ids_id},
function(data){

});
return false
})

});

// ========================================================================================================

jQuery(function($) {
$('#theme').bind('click', function() {
    $('#theme_selection').show();
        $('#theme_result').hide();
})

});

 $(document).ready(function () {
   if((selected_theme == "blue") || (selected_theme == "green")){
          $('#theme_selection').hide();
        $('#theme_result').show();
   }
   else{


       $('#theme_selection').show();
        $('#theme_result').hide();
   }

});