$( document ).ready(function(){
  $("body").on("click", ".mark-as-read", markAsRead)
})

function markAsRead(e) {
  e.preventDefault();
  var $link = $(this).parents('.link');
  var linkId = $link.data('link-id');
  var url = $link.data('link-url');

  $.ajax({
    type: "PATCH",
    url: "/api/v1/links/" + linkId,
    data: { read: true },
  }).then(updateStatus(linkId));

  $.ajax({
   type: "POST",
   url: "http://hot-reads-final.herokuapp.com/api/v1/reads",
   data: {link: url},
   success: function(){
      alert("Marked as Read on Hot Reads");
     },
    error: function(error){
      console.log(error);
    }
  });

}

function updateStatus(link) {
  $(`.link[data-link-id=${link}]`).find(".read-status").text(link.read);
}
