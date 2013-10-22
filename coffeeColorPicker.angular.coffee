CoffeeColorPickerDirective = ->
    directive =
        restrict: "A"
        link: (scope, elm, attrs) ->
            element = angular.element(elm)
            element.coffeeColorPicker()
            element.on 'pick', (event, color) ->
                scope.$color = color
                scope.$apply () ->
                    scope.$eval(attrs.coffeeColorPicker)

    return directive

module = angular.module('coffeeColorPicker', [])
module.directive('coffeeColorPicker', CoffeeColorPickerDirective)
