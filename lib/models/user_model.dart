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
    username: 'taguz',
    image: 'https://64.media.tumblr.com/157458438246678620361f8791807847/c5fd1a52175ce490-0b/s400x600/031b56940db0f942ae1cee10aa6b03c83c75e2f3.png',
  ),
  UserModel(
    id: 1,
    username: 'destroc007',
    image: 'https://64.media.tumblr.com/6be7eefdfd26ab4fa5d7d5c3004611e1/c67da2755411e28b-16/s250x400/3651194931a050de9b79d2838ab4e8921b475b6b.png',
  ),
  UserModel(
    id: 1,
    username: 'keidechin',
  ),
  UserModel(
    id: 1,
    username: 'aokin',
  ),
  UserModel(
    id: 1,
    username: 'xxyoxx',
  ),
  UserModel(
    id: 1,
    username: 'llivio',
  ),
];
