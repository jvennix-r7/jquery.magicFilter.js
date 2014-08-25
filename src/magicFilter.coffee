(window.define||((deps,fn) -> fn())) [], ->

  #
  # jquery.magicFilter v0.0.1
  #
  # magicFilter is a jQuery 1.9+ plugin for implementing advanced, autocompleted
  # filters in a text input with a focus on keyboard usability.
  #
  # Copyright: 2014 Joe Vennix <joev@metasploit.com>
  # License: MIT
  #

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
