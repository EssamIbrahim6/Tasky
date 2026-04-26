class AppUser {
  
  AppUser({
  this.id,
 this.email,
 this.name,
  this.phone,
     this.password,
  });
 String? id;
  String ?email;
  String ?name;
  String ?phone;
  String? password;

factory AppUser.fromJson(Map<String, dynamic> json) {
    return AppUser(
      id: json['id'] as String?,
      email: json['email'] as String?,
      name: json['name'] as String?,
      phone: json['phone'] as String?,
      password: json['password'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
      'name': name,
      'phone': phone,
      'password': password,
    };
  }

}



