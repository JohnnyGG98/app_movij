Codigo para saber a donde se movio el celular: 

```dart
_streamSubscriptions.add(
  userAccelerometerEvents.listen(
    (UserAccelerometerEvent event) {
      if (event.z > 3) {
        print('ARRIBA: Z: ${event.z.toStringAsFixed(2)}');
      }

      if (event.z < -3) {
        print('ABAJO: Z: ${event.z.toStringAsFixed(2)}');
      }

      if (event.x > 3) {
        print('DERECHA: X: ${event.x.toStringAsFixed(2)}');
      }

      if (event.x < -3) {
        print('IZQUIERDA: X: ${event.x.toStringAsFixed(2)}');
      }

      if (event.y > 3) {
        print('FRENTE:  Y: ${event.y.toStringAsFixed(2)} ');
      }

      if (event.y < -3) {
        print('ATRAS:  Y: ${event.y.toStringAsFixed(2)} ');
      }
    },
  ),
);
```