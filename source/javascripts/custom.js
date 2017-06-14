$(document).ready(function() {
  $('#fullpage').fullpage({
    verticalCentered: true,
    keyboardScrolling: true,
    navigation: true,
    css3: true,
    anchors: ['home', 'firstPage', 'secondPage', '3rdPage', '4thpage', 'lastPage'],
    menu: '#menu',
  });
});
