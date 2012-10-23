$(document).ready(function(){
  
  $('#slider').s3Slider({
      timeOut: 2000
  });
  
  $(".section-photo").live("click", function(){
    //$("#myModal").modal();
    var photo_id = $(this).attr("photo_id");
    $.get("/load_section_photo", {id:photo_id}, null, "script");
    return false;
  });
  
  
});