$(document).ready(function(){
  
  // $('#s3Slider').s3Slider({
  //     timeOut: 2000
  // });
  
  $(".section-photo").live("click", function(){
    var product_id = $(this).attr("product_id");
    $.get("/load_product", {id:product_id}, function() {
          $("#myModal").modal('show');
              }, "script");
    return false;
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
    $(".first-img").show();
    $(".first-img").removeClass("not-current-modal-image");

    var to_hide = $(".current-modal-image");
    to_hide.addClass("not-current-modal-image");
    to_hide.removeClass("current-modal-image");

    $(".first-img").addClass("current-modal-image");
    
  });
  
});