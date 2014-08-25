#
# jquery.magicFilter {VERSION}
#
# magicFilter is a jQuery 1.9+ plugin for implementing advanced, autocompleted
# filters in a text input with a focus on keyboard usability.
#
# It works using a div[contenteditable=true] container, which is a different
# approach than most (typically this is implemented by stacking layers of
# text input fields with transparent background).
#
# Copyright: 2014 Rapid7
# License: MIT
#

# Allow optional use of define() requirejs-style AMD in brwoser.
(window.define || ((deps,fn) -> fn())) [], ->

  # applied to container element
  CONTAINER_CSS_CLASS = 'magicFilter'

  # applied to the absolutely-positioned dropdown inside the container
  DROPDOWN_CSS_CLASS  = 'magicFilter-dropdown'

  # applied to any element of the filter that is malformed
  ERROR_CSS_CLASS     = 'magicFilter-error'

  # This is where all the magic happens.
  disneyland = ($container, opts={}) ->
    # First, let's make the <div> contenteditable, and tag it as a magicFilter
    $container.attr('contenteditable', 'true')
    $container.addClass(CONTAINER_CSS_CLASS)

    # Now, let's build some supporting divs:
    $dropdown = $('<div />', class: DROPDOWN_CSS_CLASS).appendTo($container)

    # This is called at every possible change:
    $container.on 'keyup, keydown, change, focus, blur, click', ->


  # Defaults for the jQuery plugin options
  DEFAULTS =
      keys: []
      placeholder: null
      completeVal: ->
      clearBtn: true

  # Export the jQuery plugin
  $.fn.magicFilter = (opts={}) ->

    # apply the default settings
    opts = $.extend {}, DEFAULTS, opts

    # create the filters in our scope
    $(@).each (idx, el) -> disneyland($(el), opts)

    # return ourselves for chaining
    @
