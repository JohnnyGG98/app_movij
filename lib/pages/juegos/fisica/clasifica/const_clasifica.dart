// PATH de imagenes para el juego  
import 'dart:math';
import 'dart:ui';

// Colores para clasificar  
const Map<String, Color> COLORES = {
  "cafe": Color.fromRGBO(127, 68, 10, 1),
  "celeste": Color.fromRGBO(0, 171, 215, 1),
  "naranja": Color.fromRGBO(233, 77, 26, 1),
  "rojo": Color.fromRGBO(228, 46, 61, 1),
  "amarillo": Color.fromRGBO(253, 207, 51, 1),
  "verde": Color.fromRGBO(92, 152, 76, 1),
  "morado": Color.fromRGBO(93, 60, 103, 1),
  "negro": Color.fromRGBO(87, 87, 87, 1),
  "blanco": Color.fromRGBO(254, 254, 254, 1),
};

const  Map<String, String> _PATHS_FRUTAS = {
  'uva': 'assets/games/tf/clasifica/fruta-uva.png',
  'aguacate': 'assets/games/tf/clasifica/fruta-aguacate.png',
  'guineo': 'assets/games/tf/clasifica/fruta-guineo.png',
  'naranja': 'assets/games/tf/clasifica/fruta-naranja.png',
  'manzana': 'assets/games/tf/clasifica/fruta-manzana.png'
};

const Map<String, String> _PATHS_VERDURAS = {
  'aji': 'assets/games/tf/clasifica/verdura-aji.png',
  'pimiento': 'assets/games/tf/clasifica/verdura-pimiento.png',
  'pepinillo': 'assets/games/tf/clasifica/verdura-pepinillo.png',
  'choclo': 'assets/games/tf/clasifica/verdura-choclo.png',
  'brocoli': 'assets/games/tf/clasifica/verdura-brocoli.png',
  'rabano': 'assets/games/tf/clasifica/verdura-rabano.png',
  'zanahoria': 'assets/games/tf/clasifica/verdura-zanahoria.png',
};

const Map<String, String> _PATHS_TRANSPORTES = {
  'bote': 'assets/games/tf/clasifica/transporte-bote.png',
  'camion': 'assets/games/tf/clasifica/transporte-camion.png',
  'motoneta': 'assets/games/tf/clasifica/transporte-motoneta.png',
  'bus': 'assets/games/tf/clasifica/transporte-bus.png',
  'taxi': 'assets/games/tf/clasifica/transporte-taxi.png',
};

const Map<String, String> _PATHS_BALONES = {
  'basket': 'assets/games/tf/clasifica/balon-basket.png',
  'beisbol': 'assets/games/tf/clasifica/balon-beisbol.png',
  'billar': 'assets/games/tf/clasifica/balon-billar.png',
  'bolos': 'assets/games/tf/clasifica/balon-bolos.png',
  'tenis': 'assets/games/tf/clasifica/balon-tenis.png',
};


class ClasificaJuego {

  String imgPath; 
  Color color; 
  String categoria;
  String colorName; 

  ClasificaJuego(
    this.imgPath, 
    this.color, 
    this.categoria,
    this.colorName
  );

}

class ListaCategoriasClasifica {

  List<ClasificaJuego> getFrutas() {
    String categoria = 'Frutas';
    List<ClasificaJuego> frutas = [
      ClasificaJuego(
        _PATHS_FRUTAS['uva'], 
        COLORES['morado'], 
        categoria,
        'morado'
      ),

      ClasificaJuego(
        _PATHS_FRUTAS['aguacate'], 
        COLORES['verde'], 
        categoria,
        'verde'
      ),

      ClasificaJuego(
        _PATHS_FRUTAS['guineo'], 
        COLORES['amarillo'], 
        categoria,
        'amarillo'
      ),

      ClasificaJuego(
        _PATHS_FRUTAS['naranja'], 
        COLORES['amarillo'], 
        categoria,
        'amarillo'
      ),

      ClasificaJuego(
        _PATHS_FRUTAS['manzana'], 
        COLORES['rojo'], 
        categoria,
        'rojo'
      ),
    ];
    return frutas;
  }

  List<ClasificaJuego> getVerduras() {
    String categoria = 'Verduras';
    List<ClasificaJuego> verduras = [
      ClasificaJuego(
        _PATHS_VERDURAS['aji'], 
        COLORES['rojo'], 
        categoria,
        'rojo'
      ),

      ClasificaJuego(
        _PATHS_VERDURAS['pimiento'], 
        COLORES['rojo'], 
        categoria,
        'rojo'
      ),

      ClasificaJuego(
        _PATHS_VERDURAS['pepinillo'], 
        COLORES['verde'], 
        categoria,
        'verde'
      ),

      ClasificaJuego(
        _PATHS_VERDURAS['choclo'], 
        COLORES['amarillo'], 
        categoria,
        'amarillo'
      ),

      ClasificaJuego(
        _PATHS_VERDURAS['brocoli'], 
        COLORES['verde'], 
        categoria,
        'verde'
      ),

      ClasificaJuego(
        _PATHS_VERDURAS['rabano'], 
        COLORES['morado'], 
        categoria,
        'morado'
      ),

      ClasificaJuego(
        _PATHS_VERDURAS['zanahoria'], 
        COLORES['naranja'], 
        categoria,
        'naranja'
      ),
    ];
    return verduras;
  }

  List<ClasificaJuego> getTransportes() {
    String categoria = 'Transportes';
    List<ClasificaJuego> transportes = [
      ClasificaJuego(
        _PATHS_TRANSPORTES['bote'], 
        COLORES['cafe'], 
        categoria,
        'cafe'
      ),

      ClasificaJuego(
        _PATHS_TRANSPORTES['camion'], 
        COLORES['naranja'], 
        categoria,
        'naranja'
      ),

      ClasificaJuego(
        _PATHS_TRANSPORTES['motoneta'], 
        COLORES['celeste'], 
        categoria,
        'celeste'
      ),

      ClasificaJuego(
        _PATHS_TRANSPORTES['bus'], 
        COLORES['rojo'], 
        categoria,
        'rojo'
      ),

      ClasificaJuego(
        _PATHS_TRANSPORTES['taxi'], 
        COLORES['amarillo'], 
        categoria,
        'amarillo'
      ),

    ];
    return transportes;
  }

  List<ClasificaJuego> getBalones() {
    String categoria = 'Balones';
    List<ClasificaJuego> balones = [
      ClasificaJuego(
        _PATHS_BALONES['basket'], 
        COLORES['naranja'], 
        categoria,
        'naranja'
      ),

      ClasificaJuego(
        _PATHS_BALONES['beisbol'], 
        COLORES['blanco'], 
        categoria,
        'blanco'
      ),

      ClasificaJuego(
        _PATHS_BALONES['billar'], 
        COLORES['amarillo'], 
        categoria,
        'amarillo'
      ),

      ClasificaJuego(
        _PATHS_BALONES['bolos'], 
        COLORES['negro'], 
        categoria,
        'negro'
      ),

      ClasificaJuego(
        _PATHS_BALONES['tenis'], 
        COLORES['verde'], 
        categoria,
        'verde'
      ),

    ];
    return balones;
  }

  List<ClasificaJuego> getTodos() {
    return getFrutas() + getVerduras() + getTransportes() + getBalones();
  }

  List<ClasificaJuego> getRandomPaths() {
    List<ClasificaJuego> _categorias = new List();
    _categorias.add(_randonPath(
      getFrutas()
    ));
    _categorias.add(_randonPath(
      getVerduras()
    ));
    _categorias.add(_randonPath(
      getTransportes()
    ));
    _categorias.add(_randonPath(
      getBalones()
    ));
    return _categorias;
  }

  ClasificaJuego getRandomPathAll() {
    return _randonPath(getRandomPaths());
  } 

  ClasificaJuego _randonPath(List<ClasificaJuego> list) {
    int total = list.length;
    Random rand = Random();
    return list[rand.nextInt(total)];
  }

  
}