$(document).ready(function(){
  
  // $('#slider').s3Slider({
  //     timeOut: 2000
  // });
  
  $(".section-photo").live("click", function(){
    var product_id = $(this).attr("product_id");
    $.get("/load_product", {id:product_id}, null, "script");
    $("#myModal").modal();
    return false;
  });

  $(".footer-image").live("click", function(){
    var photo_id = $(this).attr("photo_id");
    $(".current-modal-image").hide();
    $(".current-modal-image").addClass("not-current-modal-image");
    $(".current-modal-image").removeClass("current-modal-image");
    $("#modal-image-"+photo_id).fadeIn();
    $("#modal-image-"+photo_id).addClass("current-modal-image");
    return false;
  });

  // $(".close-modal-window").live("click", function(){
  //   $("#myModal").close();
  // });
  
  
});