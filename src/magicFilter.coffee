#
#! jquery.magicFilter {VERSION}
#
#! magicFilter is a jQuery 1.9+ plugin for implementing advanced, autocompleted
#! filters in a text input with a focus on keyboard usability.
#
#! Copyright: 2014 Rapid7
#! License: MIT
#

# Allow optional use of define() requirejs-style AMD in brwoser.
(window.define || ((deps,fn) -> fn())) [], ->

  # Create and initialize autocomplete logic around an input
  buildFilter = (input, opts={}) ->

    #
    # This is called at every possible change, which works out to:
    # keyup, keydown, change, focus, blur, click
    #
    update = ->

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
    $(@).each (input) -> buildFilter(input, opts)

    # return ourselves for chaining
    @
