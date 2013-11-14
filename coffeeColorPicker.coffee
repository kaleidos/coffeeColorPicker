class CoffeeColorPicker
    constructor: (el, options) ->
        @.settings =
            color:
                hue: 180
                sat: 50
                lit: 50
            freezeTime: 1000

        @.settings = $.extend(true, {}, @.settings, options)

        @.el = el
        @.el.data("coffeeColorPicker", @)

        @._rect = el[0].getBoundingClientRect()
        @._color = @settings.color
        @._setColor(@._color.hue, @._color.sat,  @._color.lit)
        @._bindEvents()

    refresh: ->
        @._rect = @.el[0].getBoundingClientRect()

    _onMouseMove: (event) ->
        if @.await && @.await > new Date()
            return
        @.await = null
        @._move(event.pageY, event.pageX)

    _onMouseWheel: (event) ->
        event.preventDefault()
        delta = if event.originalEvent.detail then event.originalEvent.detail * (-120) else event.originalEvent.wheelDelta

        delta += @._prev or 0

        if -500 > delta || 500 < delta
            return

        sat = delta + 500

        @._setColor(@._color.hue, sat / 1000 * 100, @._color.lit)
        @._prev = delta

    _onClick: (event) ->
        event.preventDefault()
        @.await = @.settings.freezeTime + new Date().getTime()
        pickedColor = $.Color($(event.target), 'background-color').toHexString(0)
        @.el.trigger('pick', pickedColor)

    _bindEvents: ->
        @.el.on "mousemove", (event) =>
            return @._onMouseMove(event)

        @.el.on "mousewheel", (event) =>
            return @._onMouseWheel(event)

        @.el.on "DOMMouseScroll", (event) =>
            return @._onMouseWheel(event)

        @.el.on "click", (event) =>
            return @._onClick(event)

    _unbindEvents: ->
        @.el.off "mousemove"
        @.el.off "mousewheel"
        @.el.off "click"

    _setColor: (hue, sat, lit) ->
        @.el.css("background-color", "hsla(#{hue}, #{sat}%, #{lit}%, 1)")
        @._color = {
            hue: hue,
            sat: sat,
            lit: lit,
        }

    _move: (y, x) ->
        if @._rect.top == 0 or @._rect.left == 0
            @.refresh()
        y = Math.max(0, y - @._rect.top)
        x = Math.max(0, x - @._rect.left)

        y /= @._rect.height
        x /= @._rect.width

        return @._setColor(x * 360, @._color.sat, y * 100)


$ = window.jQuery || window.Zepto

picker = (el, options) ->
    el = $(el)
    if el.data("coffeeColorPicker") is undefined
        return new CoffeeColorPicker(el, options)

    return el.data("coffeeColorPicker")

$.fn.coffeeColorPicker = (options) ->
    return picker(@, options)
