class AuthUser {
  String name;
  String id;

  AuthUser({required this.name, required this.id});
  Map<String, dynamic> toJson() => {'name': name, 'id': id};
}
