

class UserModel{


  final String email;
  final String fullName;
  final String password;

  final String role;
  final String username;



  UserModel( {
    required this.email,
    required this.fullName,
    required this.password,

    required this.role,
    required this.username,







  });


  factory UserModel.fromMap(Map<String, dynamic> map, String documentId) {
    return UserModel(
      email: map['email'],
      fullName:map['FullName'],
      password:map['password'],

      role:map['Role'],
      username:map['Username'],

    );
  }


}