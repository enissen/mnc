$ ->
  $('#cropbox').Jcrop({
    onChange: update_crop,
    onSelect: update_crop,
    setSelect: [0, 0, 500, 500],
    aspectRatio: 1
  })

@update_crop = (coords) ->
  rx = 100 / coords.w
  ry = 100 / coords.h
  $('#preview').css({
    width: Math.round(rx * $('#cropbox').data('img-width')) + 'px',
    height: Math.round(ry * $('#cropbox').data('img-height')) + 'px',
    marginLeft: '-' + Math.round(rx * coords.x) + 'px',
    marginTop: '-' + Math.round(ry * coords.y) + 'px'
  })
  ratio = $('#cropbox').data('img-original-width') / $('#cropbox').data('img-width')
  $('#crop_x').val(Math.round(coords.x * ratio));
  $('#crop_y').val(Math.round(coords.y * ratio));
  $('#crop_w').val(Math.round(coords.w * ratio));
  $('#crop_h').val(Math.round(coords.h * ratio));
