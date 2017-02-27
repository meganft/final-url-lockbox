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
  }).then(updateStatus);
}

function updateStatus(link) {
  $(`.link[data-link-id=${link.id}]`).find(".read-status").text(link.read);
}
