CoffeeColorPickerDirective = ->
    directive =
        restrict: "A"
        link: (scope, elm, attrs) ->
            element = angular.element(elm)
            if attrs.coffeeColorPickerOptions
                options = scope.$eval(attrs.coffeeColorPickerOptions)
                element.coffeeColorPicker(options)
            else
                element.coffeeColorPicker()

            element.on 'pick', (event, color) ->
                scope.$color = color
                scope.$apply () ->
                    scope.$eval(attrs.coffeeColorPicker)

    return directive

module = angular.module('coffeeColorPicker', [])
module.directive('coffeeColorPicker', CoffeeColorPickerDirective)
