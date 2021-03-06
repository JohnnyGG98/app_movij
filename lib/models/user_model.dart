class UserModel {
  int id;
  String username;
  String image;

  UserModel({
    this.id,
    this.username,
    this.image = 'assets/app/pocoyo_bg.jpg',
  });

  bool get isNetworkImage {
    return image.contains('http');
  }
}

// Usuarios predefinidos

List<UserModel> defaultUsers = [
  UserModel(
    id: 1,
    username: 'Taguz',
    image: 'assets/app/taguz.jpg',
  ),
  UserModel(
    id: 1,
    username: 'Destroc007',
    image: 'assets/app/destroc.png',
  ),
  UserModel(
    id: 1,
    username: 'Keidechin',
    image: 'assets/app/keidechin.png',
  ),
  UserModel(
    id: 1,
    username: 'Ahokin',
    image: 'assets/app/ahokin.png',
  ),
  UserModel(
    id: 1,
    username: 'xxyoxx',
  ),
  UserModel(
    id: 1,
    username: 'Llivio',
  ),
];
