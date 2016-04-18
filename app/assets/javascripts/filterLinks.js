function filterLinks() {
  $('#link_filter').keyup(function() {
    debugger;
    var $links = $('.link');
    $links.each(function (index, link) {
      var searchContent = $('#link_filter').val().toLowerCase();
      $link = $(link);
      var linkTitle = $link.children('.title').html().toLowerCase();
      if (linkTitle.includes(searchContent)) {
        $link.show();
      } else {
        $link.hide();
      }
    });
  });
}
