Coffee Color Picker
===================

jQuery usage example
--------------------

.. code-block:: html

  <div id="colorPicker" style="width: 200px; height: 200px"></div>
  <script>
    $('#colorPicker').coffeeColorPicker()
    $('#colorPicker').on('pick', function (event, color) {
        console.log(color);
    });
  </script>

AngularJS usage example
-----------------------

.. code-block:: html

  <div coffee-color-picker="console.log($color)"></div>
