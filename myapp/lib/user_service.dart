// import 'dart:convert';
// import 'package:http/http.dart' as http;
// import 'user_model.dart';

// class UserService {
//   static const String baseUrl = 'http://localhost:5000/users';

//   static Future<List<User>> getUsers() async {
//     final response = await http.get(Uri.parse(baseUrl));
//     if (response.statusCode == 200) {
//       final List data = json.decode(response.body);
//       return data.map((json) => User.fromJson(json)).toList();
//     } else {
//       throw Exception('Failed to load users');
//     }
//   }

//   static Future<User> getUserById(String id) async {
//     final response = await http.get(Uri.parse('$baseUrl/$id'));
//     if (response.statusCode == 200) {
//       return User.fromJson(json.decode(response.body));
//     } else {
//       throw Exception('User not found');
//     }
//   }

//   static Future<void> createUser(User user) async {
//     final response = await http.post(
//       Uri.parse(baseUrl),
//       headers: {'Content-Type': 'application/json'},
//       body: json.encode(user.toJson()),
//     );

//     if (response.statusCode != 201) {
//       throw Exception('Failed to create user');
//     }
//   }

//   static Future<void> updateUser(String id, User user) async {
//     final response = await http.put(
//       Uri.parse('$baseUrl/$id'),
//       headers: {'Content-Type': 'application/json'},
//       body: json.encode(user.toJson()),
//     );

//     if (response.statusCode != 200) {
//       throw Exception('Failed to update user');
//     }
//   }

//   static Future<void> deleteUser(String id) async {
//     final response = await http.delete(Uri.parse('$baseUrl/$id'));
//     if (response.statusCode != 200) {
//       throw Exception('Failed to delete user');
//     }
//   }
// }
//---------------------

// 
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'user_model.dart';

class UserService {
  static const String baseUrl = 'http://localhost:5000/users';  // Your base URL for API

  // Get all users
  static Future<List<User>> getUsers() async {
    final response = await http.get(Uri.parse(baseUrl));
    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data.map((user) => User.fromJson(user)).toList();
    } else {
      throw Exception('Failed to load users');
    }
  }

  // Get user by ID
  static Future<User> getUserById(String id) async {
    final response = await http.get(Uri.parse('$baseUrl/$id'));  // Get by ID
    if (response.statusCode == 200) {
      return User.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load user');
    }
  }

  // Create a new user
  // static Future<void> createUser(User user) async {
  //   final response = await http.post(
  //     Uri.parse(baseUrl),
  //     headers: {'Content-Type': 'application/json'},
  //     body: json.encode(user.toJson()),
  //   );
  //   if (response.statusCode != 201) {
  //     throw Exception('Failed to create user');
  //   }
  // }

static Future<void> createUser(User user) async {
  try {
    final response = await http.post(
      Uri.parse(baseUrl),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(user.toJson()),
    );

    print('Request body: ${json.encode(user.toJson())}');  // Debugging request body

    if (response.statusCode == 201) {
      // Success
      print('User created successfully');
      return;
    } else {
      print('Error Response Body: ${response.body}');  // Debugging response body
      throw Exception('Failed to create user. Status Code: ${response.statusCode}');
    }
  } catch (e) {
    print('Exception: $e');
    throw Exception('Failed to create user: $e');
  }
}

  // Update user by ID
  static Future<void> updateUser(BuildContext context,String id, User user) async {
    final response = await http.put(
      Uri.parse('$baseUrl/$id'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(user.toJson()),
    );
    if (response.statusCode == 200) {
      _showSnackBar(context, 'User updated successfully');
    } else {
      _showSnackBar(context, 'Failed to update user');
      throw Exception('Failed to update user');
    }
  }

  // Delete user by ID
  static Future<void> deleteUser(BuildContext context,String id) async {
    final response = await http.delete(Uri.parse('$baseUrl/$id'));  // Delete by ID
    if (response.statusCode == 200) {
      _showSnackBar(context, 'User deleted successfully');
    } else {
      _showSnackBar(context, 'Failed to delete user');
      throw Exception('Failed to delete user');
    }
  }
static void _showSnackBar(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        message,
        style: const TextStyle(color: Colors.white),
      ),
      backgroundColor: const Color(0xFFDC052D),
    ),
  );
}

}
