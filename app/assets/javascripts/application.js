// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .

$(document).ready(function(){
    //add video info to left_column div
    $(".add_button").click(function(){
        var image = $(this).siblings("img").attr("src");
        var link = $(this).siblings("a").attr("href");
        var text = $(this).siblings("a").text();
        var length = $(this).siblings("p").text();
        $("#left_column").append("<a target = '_blank' href = "+link+" return false><img src = "+image+"></a>");
        $("#left_column").append("<a target = '_blank' href = "+link+">"+text+"</a>");
        $("#left_column").append("<p>"+length+"</p>")
        $("#left_column").append("<button class = 'remove add_button' type = 'button' style = 'margin-bottom: 15px'>Remove</button>")    
    });
    //remove the video and its elements that was previously appended to the div
    $(document).on("click", ".remove", function(){
        $(this).prev().prev().prev().remove();
        $(this).prev().prev().remove();
        $(this).prev().remove();
        $(this).remove();
    });
    
    //MLB call to server to then make API call
    $("#mlb").click(function(){
        $.get('/guests/mlb', function(data){
            $("#right_column").html(data);
            $("#ajax_message").css('display','none');
        });
        $("#ajax_message").css("display",'block');
        $("#ajax_message").html("<p>Looking for games...</p>");
    })
    //NBA call to server to then make API call
    $("#nba").click(function(){
        $.get('/guests/nba', function(data){
            $("#right_column").html(data);
            $("#ajax_message").css('display','none');
        });
        $("#ajax_message").css('display','block');
        $("#ajax_message").html("<p>Looking for games...</p>");
    })
    //display message while Ajax call is happening
    // $(document).on("ajaxStart",function(){
    //     $("#ajax_message").html("<p>Looking for games...</p>");
    // });
    // $(document).on("ajaxStop", function(){
    //     $("#ajax_message").css("display","none");
    // })
    
});


