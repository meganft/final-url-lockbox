$(document).ready(function(){
  $('#filter-by-read').on('click', filterByRead)
  $('#filter-by-unread').on('click', filterByUnread)
  $('#filter-links-text').on('keyup', filterText)
  $('#show-all').on('click', showAllLinks)
})

function filterText(e) {
  e.preventDefault();
  var filter = $( "#filter-links-text" ).val().toLowerCase();
  $("#links-list").children().each(function(){

    var title = $(this).find('.link-title').text();
    var url = $(this).find('.link-url').text();

    if (title.includes(filter) || url.includes(filter)) {
      $(this).show()
    } else {
      $(this).hide()
    };
  });
}

function filterByUnread() {
  var read = "Read? false";
  $('#links-list').children().each(function() {
    var status = $(this).find(".read-status").html();
    if (status.includes(read)) {
      $(this).show()
    } else {
      $(this).hide()
    };
  });
}

function filterByRead() {
  var read = "Read? true";
  $('#links-list').children().each(function() {
    var status = $(this).find(".read-status").html();
    if (status.includes(read)) {
      $(this).show()
    } else {
      $(this).hide()
    };
  });
}

function showAllLinks() {
  var read = "Read? true";
  $('#links-list').children().each(function() {

      $(this).show();

  });
}
