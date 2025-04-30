// import 'package:flutter/material.dart';
// import 'user_model.dart';
// import 'user_service.dart';
// import 'user_form.dart';

// class UserDetailPage extends StatefulWidget {
//   final String userId;

//   const UserDetailPage({super.key, required this.userId});

//   @override
//   State<UserDetailPage> createState() => _UserDetailPageState();
// }

// class _UserDetailPageState extends State<UserDetailPage> {
//   late Future<User> _userFuture;

//   @override
//   void initState() {
//     super.initState();
//     _userFuture = UserService.getUserById(widget.userId);
//   }

//   void _deleteUser() async {
//     await UserService.deleteUser(widget.userId);
//     if (mounted) {
//       Navigator.pop(context);
//     }
//   }

//   void _editUser(User user) async {
//     final updated = await Navigator.push(
//       context,
//       MaterialPageRoute(
//         builder: (_) => UserFormPage(user: user),
//       ),
//     );

//     if (updated == true) {
//       setState(() {
//         _userFuture = UserService.getUserById(widget.userId);
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('User Details')),
//       body: FutureBuilder<User>(
//         future: _userFuture,
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return const Center(child: CircularProgressIndicator());
//           } else if (snapshot.hasError) {
//             return Center(child: Text('Error: ${snapshot.error}', style: const TextStyle(color: Colors.white)));
//           } else if (!snapshot.hasData) {
//             return const Center(child: Text('User not found.', style: TextStyle(color: Colors.white)));
//           }

//           final user = snapshot.data!;
//           return Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: Card(
//               child: Padding(
//                 padding: const EdgeInsets.all(16.0),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text('AID: ${user.aid}', style: const TextStyle(fontSize: 18, color: Colors.white)),
//                     const SizedBox(height: 8),
//                     Text('Name: ${user.name}', style: const TextStyle(color: Colors.white)),
//                     Text('Email: ${user.email}', style: const TextStyle(color: Colors.white)),
//                     Text('Zone: ${user.zone}', style: const TextStyle(color: Colors.white)),
//                     Text('Role: ${user.role}', style: const TextStyle(color: Colors.white)),
//                     Text('Department: ${user.department}', style: const TextStyle(color: Colors.white)),
//                     const SizedBox(height: 20),
//                     Row(
//                       children: [
//                         ElevatedButton(
//                           onPressed: () => _editUser(user),
//                           style: ElevatedButton.styleFrom(
//                             backgroundColor: const Color(0xFFDC052D),
//                             foregroundColor: Colors.white,
//                           ),
//                           child: const Text('Edit'),
//                         ),
//                         const SizedBox(width: 10),
//                         ElevatedButton(
//                           onPressed: _deleteUser,
//                           style: ElevatedButton.styleFrom(
//                             backgroundColor: Colors.grey[800],
//                             foregroundColor: Colors.white,
//                           ),
//                           child: const Text('Delete'),
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
//-----------------------------------

import 'package:flutter/material.dart';
import 'user_model.dart';
import 'user_service.dart';
import 'user_form.dart';

class UserDetailPage extends StatefulWidget {
  final String userId;

  const UserDetailPage({super.key, required this.userId});

  @override
  State<UserDetailPage> createState() => _UserDetailPageState();
}

class _UserDetailPageState extends State<UserDetailPage> {
  late Future<User> _userFuture;

  @override
  void initState() {
    super.initState();
    _userFuture = UserService.getUserById(widget.userId);
  }

//   void _deleteUser() async {
//   await UserService.deleteUser(context, widget.userId);
//   if (mounted) {
//     Navigator.pop(context);
//   }
// }

void _deleteUser() async {
  final confirmed = await showDialog<bool>(
    context: context,
    builder: (context) => AlertDialog(
      backgroundColor: const Color(0xFF1A1A2E),
      title: const Text(
        'Confirm Delete',
        style: TextStyle(color: Colors.white),
      ),
      content: const Text(
        'Are you sure you want to delete this user?',
        style: TextStyle(color: Colors.white70),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(false),
          child: const Text('Cancel', style: TextStyle(color: Colors.white70)),
        ),
        TextButton(
          onPressed: () => Navigator.of(context).pop(true),
          child: const Text(
            'Delete',
            style: TextStyle(color: Color(0xFFDC052D)), // Consistent red
          ),
        ),
      ],
    ),
  );

  if (confirmed == true) {
    await UserService.deleteUser(context,widget.userId);
    if (mounted) Navigator.pop(context);
  }
}



  void _editUser(User user) async {
    final updated = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => UserFormPage(user: user),
      ),
    );

    if (updated == true) {
      setState(() {
        _userFuture = UserService.getUserById(widget.userId);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('User Details')),
      body: FutureBuilder<User>(
        future: _userFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData) {
            return const Center(child: Text('User not found.'));
          }

          final user = snapshot.data!;
          return SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Center(
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundColor: const Color(0xFFDC052D),
                    child: const Icon(
                      Icons.person,
                      size: 50,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    user.name,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Card(
                    elevation: 4,
                    margin: const EdgeInsets.symmetric(horizontal: 16),
                    color: const Color(0xFF1B1B2F),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _infoRow("AID", user.aid),
                          _infoRow("Email", user.email),
                          _infoRow("Zone", user.zone),
                          _infoRow("Role", user.role),
                          _infoRow("Department", user.department),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton.icon(
                        onPressed: () => _editUser(user),
                        icon: const Icon(Icons.edit),
                        label: const Text('Edit'),
                      ),
                      const SizedBox(width: 16),
                      ElevatedButton.icon(
                        onPressed: _deleteUser,
                        icon: const Icon(Icons.delete),
                        label: const Text('Delete'),
                      ),
                    ],
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _infoRow(String label, String? value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          Text(
            "$label: ",
            style: const TextStyle(fontWeight: FontWeight.w600),
          ),
          Flexible(
            child: Text(value ?? "Not available"),
          ),
        ],
      ),
    );
  }
}
