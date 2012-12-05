$(document).ready(function(){
  
  
  $(".section-photo").live("click", function(){
    var product_id = $(this).attr("product_id");
    $.get("/load_product", {id:product_id}, function() {
          $("#myModal").modal('show');
              }, "script");
    return false;
  });

  // $('.footer-image').mouseover(function() {
  //   var photo_id = $(this).attr("photo_id");
  //   $(".current-modal-image").hide();
  //   $(".current-modal-image").addClass("not-current-modal-image");
  //   $(".current-modal-image").removeClass("current-modal-image");
  //   $("#modal-image-"+photo_id).fadeIn();
  //   $("#modal-image-"+photo_id).addClass("current-modal-image");
  //   return false;    
  // });
  
  $(".btn-group.menu-items.button").live("mouseover", function(){
    var id = "#dropdown-" + $(this).attr("id");
    $(id).show();
  });
  $(".btn-group.menu-items.button").live("mouseout", function(){
    var id = "#dropdown-" + $(this).attr("id");
    $(id).hide();
  });

  $(".footer-image").live("click", function(){
    var photo_id = $(this).attr("photo_id");
    var a = $(".current-modal-image");
    a.hide();
    a.removeClass("current-modal-image");
    a.addClass("not-current-modal-image");
    $("#modal-image-"+photo_id).fadeIn(2000);
    $("#modal-image-"+photo_id).removeClass("not-current-modal-image");
    $("#modal-image-"+photo_id).addClass("current-modal-image");
    return false;
  });

  $('#myModal').on('hidden', function () {
    var to_hide = $(".current-modal-image");
    to_hide.addClass("not-current-modal-image");
    to_hide.removeClass("current-modal-image");  

    a = $(".first-img");
    a.removeClass("not-current-modal-image");
    a.addClass("current-modal-image");
    a.show();
  });
  
});