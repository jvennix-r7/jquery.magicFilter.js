# Add some handy-dandy jasmine matchers
beforeEach ->

  @addMatchers

    toHaveClass: (klass) ->
      $(@actual).hasClass(klass)

describe '$.magicFilter()', ->

  beforeEach ->
    @$el = $('<div />')
    @$el.appendTo($('body'))

  afterEach ->
    @$el.remove()

  it 'is defined on a jQuery object', ->
    expect(@$el.magicFilter).toBeDefined()

  describe 'when run with no options', ->

    beforeEach -> @$el.magicFilter()

    it 'adds the "magicFilter" CSS class to the container element', ->
      expect(@$el).toHaveClass('magicFilter')

    it 'sets contenteditable to true on the container element', ->
      expect(@$el.prop('contenteditable')).toEqual('true')

    it 'adds a div with class=magicFilter-dropdown to the container element', ->
      expect(@$el.find('div.magicFilter-dropdown').length).toEqual(1)
