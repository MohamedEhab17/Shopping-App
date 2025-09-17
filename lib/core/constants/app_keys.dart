abstract class AppKeys {
  static const String emailRegex =
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
  static const String passwordRegex = r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{6,}$';

  static const String usernameRegex = r'^[a-zA-Z0-9,.-]+$';
  static const String avatar =
      "https://static.vecteezy.com/system/resources/previews/035/600/234/original/man-avatar-profile-picture-illustration-vector.jpg";
  static const String imageNotFound =
      "https://st4.depositphotos.com/14953852/22772/v/450/depositphotos_227724992-stock-illustration-image-available-icon-flat-vector.jpg";
}
