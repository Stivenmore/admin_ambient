class UserModel {
  final String nombre;
  final String email;
  final String? dayregister;
  final String? monthregister;
  final String? yearsregister;
  final String? lastlogin;
  final String? img;

  UserModel(
      {required this.nombre,
      required this.email,
      this.img =
          'https://firebasestorage.googleapis.com/v0/b/ambient-ec3df.appspot.com/o/Img%2Fno-image.jpg?alt=media&token=cc289889-ea88-48a7-86ce-00e0ac3ce197',
      this.dayregister,
      this.lastlogin,
      this.monthregister,
      this.yearsregister});

  factory UserModel.fromFirebase(Map<String, dynamic> map) {
    return UserModel(
      nombre: map["name"] as String? ?? "",
      email: map["email"] as String? ?? "",
      img: map["img"] as String? ??
          "https://firebasestorage.googleapis.com/v0/b/ambient-ec3df.appspot.com/o/Img%2Fno-image.jpg?alt=media&token=cc289889-ea88-48a7-86ce-00e0ac3ce197",
      dayregister: map["dayregister"] as String? ?? "",
      monthregister: map["monthregister"] as String? ?? "",
      yearsregister: map["yearsregister"] as String? ?? "",
      lastlogin: map["lastlogin"] as String? ?? "",
    );
  }
}
