$(document).ready(function(){

  $('#filter-links-text').on('keyup', filterText)

})

function filterText(e) {
  var filter = $( "#filter-links-text" ).val().toLowerCase();
  $( "#links-list" ).children().each(function(){

    var title = $( this ).find( '.link-title' ).text();
    var url = $( this ).find( '.link-url' ).text();

    if(title.includes( filter ) || url.includes( filter )){
      $( this ).show()
    }else {
      $( this ).hide()
    };
  });
}
