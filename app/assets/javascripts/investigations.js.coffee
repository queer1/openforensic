# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
jQuery ->
  new InvestigationImageCropper()
  
class InvestigationImageCropper
  constructor: ->
    $('#cropbox').Jcrop
      aspectRatio: 24/9
      setSelect: [0,0,1400,300]
      onSelect: @update
      onChange: @update
      
  update: (coords) =>
    $('#investigation_crop_x').val(coords.x)
    $('#investigation_crop_y').val(coords.y)
    $('#investigation_crop_w').val(coords.w)
    $('#investigation_crop_h').val(coords.h)