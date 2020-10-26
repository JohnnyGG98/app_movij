class Global {
  static final Global _singleton = Global._internal();
  // Constructor por defecto 
  Global._internal();

  String actualRoute = '/';

  factory Global() {
    return _singleton;
  }

}
