Coffee Color Picker
===================

Available options
-----------------

You can set various options on Coffee Color Picker, the available options are:

* **freezeTime**: The time in miliseconds that the color is freezed after a pick (default: 1000).
* **color.hue**: Default color hue (default: 180).
* **color.sat**: Default color saturation (default: 50).
* **color.lit**: Default color lightness (default: 50).

To configure it in jQuery follow this example:

.. code-block:: javascript

  element.coffeeColorPicker({freezeTime: 1500})

To configure it on angular follow this example:

.. code-block:: html

  <div coffee-color-picker="mySelectedColor = $color" coffee-color-picker-options="{freezeTime: 1500}"></div>


Examples
--------

jQuery usage example
~~~~~~~~~~~~~~~~~~~~

.. code-block:: html

  <div id="colorPicker" style="width: 200px; height: 200px"></div>
  <script>
    $('#colorPicker').coffeeColorPicker()
    $('#colorPicker').on('pick', function (event, color) {
        console.log(color);
    });
  </script>

AngularJS usage example
~~~~~~~~~~~~~~~~~~~~~~~

.. code-block:: html

  <div coffee-color-picker="mySelectedColor = $color"></div>
