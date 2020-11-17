class ArmarJuego {
  String imgPath;
  String nombre;

  ArmarJuego({
    this.imgPath,
    this.nombre
  });
}

List<ArmarJuego> opcionesArmar = [
  ArmarJuego(
    imgPath: 'assets/games/tl/armar/pera.png',
    nombre: 'Pera',
  ),
  ArmarJuego(
    imgPath: 'assets/games/tl/armar/mango.png',
    nombre: 'Mango',
  ),
  ArmarJuego(
    imgPath: 'assets/games/tl/armar/cereza.png',
    nombre: 'Cereza',
  ),
  ArmarJuego(
    imgPath: 'assets/games/tl/armar/fresa.png',
    nombre: 'Fresa',
  ),
  ArmarJuego(
    imgPath: 'assets/games/tl/armar/manzana.png',
    nombre: 'Manzana',
  ),
  ArmarJuego(
    imgPath: 'assets/games/tl/armar/platano.png',
    nombre: 'Platano',
  ),
];
