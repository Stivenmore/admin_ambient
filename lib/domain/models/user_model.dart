class UserModel {
  final String nombre;
  final String email;


  UserModel(
      {required this.nombre,
      required this.email,});

  factory UserModel.fromFirebase(Map<String, dynamic> map) {
    return UserModel(
        nombre: map["name"] as String? ?? "",
        email: map["email"] as String? ?? "",);
  }
}
