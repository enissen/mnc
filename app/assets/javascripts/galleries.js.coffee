$ ->
  resize_thumbs()
  $('.carousel').carousel()

$(document)
  .on 'mouseover', '.thumbnail', ->
    for el in ['.thumbnail_caption', '.thumbnail_overlay']
      $(@).find(el).show()

  .on 'mouseout', '.thumbnail', ->
    for el in ['.thumbnail_caption', '.thumbnail_overlay']
      $(@).find(el).hide()

  .on 'click', '.info_icon', ->
    $('.gallery_description').toggle()

  .on 'click', '.gallery_thumb', ->
    $('.mosaic').hide()
    for el in ['.indicator', '.item']
      $('#gallery_carousel ' + el).removeClass('active')
    for el in ['#indicator_of_img_' + $(@).data('id'), '#wrapper_of_img_' + $(@).data('id')]
      $(el).addClass('active')
    $('.carousel_wrapper').show()

  .on 'click', '.carousel-exit', ->
    $('.carousel_wrapper').hide()
    $('.mosaic').show()

$(window).resize ->
  resize_thumbs()

@resize_thumbs = () ->
  for el in ['.thumbnail_overlay', '.thumbnail_edit']
    $(el).width($('.img-responsive').width())

