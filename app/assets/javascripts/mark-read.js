$( document ).ready(function(){
  $("body").on("click", ".mark-as-read", markAsRead)
  $("body").on("click", ".mark-as-unread", markAsUnRead)
  $("body").on("load", getTopReads)

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

function markAsUnRead(e) {
  e.preventDefault();
  var $link = $(this).parents('.link');
  var linkId = $link.data('link-id');
  var url = $link.data('link-url');

  $.ajax({
    type: "PATCH",
    url: "/api/v1/links/" + linkId,
    data: { read: false },
  }).then(updateReadButton(linkId));
}

function getTopReads(){
  $.ajax({
   type: "GET",
   url: "http://hot-reads-final.herokuapp.com/api/v1/reads",

   success: function(){
      alert("hi");
     },
    error: function(error){
      console.log(error);
    }
  });
}

function updateStatus(link) {
  $(`.link[data-link-id=${link}]`).addClass("marked-read");
  $(`.link[data-link-id=${link}]`).find(".read-status").html("Read? true");
  updateButton(link);
}

function updateButton(link) {
  $(`.link[data-link-id=${link}]`).find(".mark-as-read").remove();
  $(`.link[data-link-id=${link}]`).append('<button class="mark-as-unread">Mark as Unread</button>');
}

function updateReadButton(link) {
  $(`.link[data-link-id=${link}]`).find(".read-status").html("Read? false");
  $(`.link[data-link-id=${link}]`).removeClass("marked-read");
  $(`.link[data-link-id=${link}]`).find(".mark-as-unread").remove();
  $(`.link[data-link-id=${link}]`).append('<button class="mark-as-read">Mark as Read</button>');
}
