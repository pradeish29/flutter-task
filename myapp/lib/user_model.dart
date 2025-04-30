class User {
  final String id; // Auto-generated
  final String aid;
  final String name;
  final String email;
  final String zone;
  final String role;
  final String department;

  User({
    required this.id,
    required this.aid,
    required this.name,
    required this.email,
    required this.zone,
    required this.role,
    required this.department,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['_id'] ?? '',
      aid: json['AID'].toString(),
      name: json['name'] ?? '',
      email: json['email'] ?? '',
      zone: json['zone'] ?? '',
      role: json['role'] ?? '',
      department: json['department'] ?? '',
    );
  }

Map<String, dynamic> toJson() {
  return {
    'AID': int.tryParse(aid) ?? 0, // ✅ convert string to int
    'name': name,
    'email': email,
    'zone': zone,
    'role': role,
    'department': department,
  };
}
}