$( document ).ready(function(){
  $.ajax({
   type: "GET",
   url: "http://localhost:3000/api/v1/reads",
   success: function(data){
     response = data;
      findHotReads(data);
     },
    error: function(error){
      console.log(error);
    }
  });

  $("body").on("click", ".mark-as-read", markAsRead)
  $("body").on("click", ".mark-as-unread", markAsUnRead)

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
   url: "http://localhost:3000/api/v1/reads",
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

function findHotReads(data){
  hotReads = data;
  var urls = [];
  for (var i = 0; i < hotReads.length; i++) {
    urls.push(hotReads[i].url)
  }
  var hottestUrl = urls[0];
  $('#links-list .link').each(function(){
    var thisUrl = $(this).children('.link-url').html();
    if (thisUrl) == hottestUrl)) {
      $(this).children('.link-hot-color').html('<h4 class="top-link">This is the Top Link!</h4>')
    } else if (inArray((thisUrl), urls)) {
      $(this).children('.link-hot-color').html("<h4>Regular Link</h4>")
    } else {
      $(this).children('.link-hot-color').html('<h4 class="hot-link">This is a Hot Link!</h4>')
    }
  });
}

function updateStatus(link) {
  $(`.link[data-link-id=${link}] .read-status`).addClass("marked-read");
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
