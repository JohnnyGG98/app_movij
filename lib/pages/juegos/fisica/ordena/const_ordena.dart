import 'dart:math';

const _BASE_PATH = 'assets/games/tf/ordena/';


const List<String> PATHS_ANIMALS = [
  _BASE_PATH + 'animals-cebra.png',
  _BASE_PATH + 'animals-elefante.png',
  _BASE_PATH + 'animals-hipo.png',
  _BASE_PATH + 'animals-jirafa.png',
  _BASE_PATH + 'animals-leon.png',
  _BASE_PATH + 'animals-oso.png',
];

const List<String> PATHS_CARAS_ANIMALES = [
  _BASE_PATH + 'caras-animales-cerdo.png',
  _BASE_PATH + 'caras-animales-koala.png',
  _BASE_PATH + 'caras-animales-mono.png',
  _BASE_PATH + 'caras-animales-oso.png',
  _BASE_PATH + 'caras-animales-panda.png',
  _BASE_PATH + 'caras-animales-pollo.png',
  _BASE_PATH + 'caras-animales-rana.png',
  _BASE_PATH + 'caras-animales-tigre.png',
  _BASE_PATH + 'caras-animales-zorro.png',
];

const List<String> PATHS_CASH = [
  _BASE_PATH + 'cash-billete.png',
  _BASE_PATH + 'cash-billetes.png',
  _BASE_PATH + 'cash-bolsa.png',
  _BASE_PATH + 'cash-moneda.png',
  _BASE_PATH + 'cash-monedas.png',
];

const List<String> PATHS_DINOSAURIO = [
  _BASE_PATH + 'dinosaurio-amarillo.png',
  _BASE_PATH + 'dinosaurio-morado.png',
  _BASE_PATH + 'dinosaurio-rojo.png',
  _BASE_PATH + 'dinosaurio-turquesa.png',
  _BASE_PATH + 'dinosaurio-verde.png',
];

const List<String> PATHS_HALLOWEN = [
  _BASE_PATH + 'hallowen-calabaza.png',
  _BASE_PATH + 'hallowen-cerebro.png',
  _BASE_PATH + 'hallowen-fantasma.png',
  _BASE_PATH + 'hallowen-momia.png',
  _BASE_PATH + 'hallowen-vampiro.png',
  _BASE_PATH + 'hallowen-zombie.png',
];

const List<String> PATHS_MONSTRUO = [
  _BASE_PATH + 'monstruo-azul.png',
  _BASE_PATH + 'monstruo-morado.png',
  _BASE_PATH + 'monstruo-rojo.png',
  _BASE_PATH + 'monstruo-verde.png',
];

const List<String> PATHS_PLANTA = [
  _BASE_PATH + 'planta-grande.png',
  _BASE_PATH + 'planta-mediana.png',
  _BASE_PATH + 'planta-pequena.png',
];

String getRandomPathOrdena() {
  List<String> paths = PATHS_ANIMALS 
  + PATHS_CARAS_ANIMALES
  + PATHS_CASH 
  + PATHS_DINOSAURIO
  + PATHS_HALLOWEN
  + PATHS_MONSTRUO
  + PATHS_PLANTA;
  Random rand = Random();
  return paths[rand.nextInt(paths.length)];
}