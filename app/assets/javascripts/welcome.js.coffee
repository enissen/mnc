$ ->
  el = $("#intro")
  el.height($(window).height() * 0.5)

  # animate intro image: fade in
  el.animate({opacity: 0},0).css({'background-image': 'url("assets/intro/nager-intro-01.png")'}).animate({opacity: 1}, 2500)
