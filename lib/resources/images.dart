import 'strings.dart';

class Images {
  const Images._();
  static const cozy = "cozy.jpg";
  static const room = "room.jpg";
  static const photo = "photo.jpg";
  static const living = "living.jpg";
  static const kitchen = "kitchen.jpg";

  static String get(String image) => "${Strings.imagePath}$image";
}
