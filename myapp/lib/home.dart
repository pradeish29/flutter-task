// import 'package:flutter/material.dart';
// import 'user_model.dart';
// import 'user_service.dart';
// import 'user_detail.dart';
// import 'user_form.dart';

// class HomePage extends StatefulWidget {
//   const HomePage({super.key});

//   @override
//   State<HomePage> createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   late Future<List<User>> _userList;

//   @override
//   void initState() {
//     super.initState();
//     _userList = UserService.getUsers();
//   }

//   Future<void> _refreshUsers() async {
//     setState(() {
//       _userList = UserService.getUsers();
//     });
//   }

//   void _createUser() async {
//     final created = await Navigator.push(
//       context,
//       MaterialPageRoute(builder: (_) => const UserFormPage()),
//     );
//     if (created == true) {
//       _refreshUsers();
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('User Management')),
//       body: FutureBuilder<List<User>>(
//         future: _userList,
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return const Center(child: CircularProgressIndicator());
//           } else if (snapshot.hasError) {
//             return Center(child: Text('Error: ${snapshot.error}', style: const TextStyle(color: Colors.white)));
//           } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
//             return const Center(child: Text('No users found.', style: TextStyle(color: Colors.white)));
//           }

//           final users = snapshot.data!;
//           return RefreshIndicator(
//             onRefresh: _refreshUsers,
//             child: ListView.builder(
//               itemCount: users.length,
//               itemBuilder: (context, index) {
//                 final user = users[index];
//                 return Card(
//                   child: ListTile(
//                     leading: const Icon(Icons.person, color: Color.fromARGB(255, 216, 17, 17)),
//                     title: Text(user.name, style: const TextStyle(color: Colors.white)),
//                     subtitle: Text(user.email, style: const TextStyle(color: Colors.white70)),
//                     onTap: () => Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder: (_) => UserDetailPage(userId: user.id),
//                       ),
//                     ).then((_) => _refreshUsers()),
//                   ),
//                 );
//               },
//             ),
//           );
//         },
//       ),
//       floatingActionButton: FloatingActionButton(
//         backgroundColor: const Color(0xFFDC052D),
//         foregroundColor: Colors.white,
//         onPressed: _createUser,
//         child: const Icon(Icons.add),
//       ),
//     );
//   }
// }

//-------------


// import 'package:flutter/material.dart';
// import 'user_model.dart';
// import 'user_service.dart';
// import 'user_detail.dart';
// import 'user_form.dart';

// class HomePage extends StatefulWidget {
//   const HomePage({super.key});

//   @override
//   State<HomePage> createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   late Future<List<User>> _userList;

//   @override
//   void initState() {
//     super.initState();
//     _userList = UserService.getUsers();
//   }

//   Future<void> _refreshUsers() async {
//     setState(() {
//       _userList = UserService.getUsers();
//     });
//   }

//   void _createUser() async {
//     // Pass an empty User object to create a new user
//     final created = await Navigator.push(
//       context,
//       MaterialPageRoute(
//         builder:
//             (_) => UserFormPage(
//               user: User(
//                 aid: '',
//                 name: '',
//                 email: '',
//                 zone: '',
//                 role: '',
//                 department: '',
//                 id: ' ',
//               ),
//             ),
//       ),
//     );
//     if (created == true) {
//       _refreshUsers();
//     }
//   }

//     @override
//     Widget build(BuildContext context) {
//       return Scaffold(
//         appBar: AppBar(title: const Text('User Management')),
//         body: FutureBuilder<List<User>>(
//           future: _userList,
//           builder: (context, snapshot) {
//             if (snapshot.connectionState == ConnectionState.waiting) {
//               return const Center(child: CircularProgressIndicator());
//             } else if (snapshot.hasError) {
//               return Center(child: Text('Error: ${snapshot.error}', style: const TextStyle(color: Colors.white)));
//             } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
//               return const Center(child: Text('No users found.', style: TextStyle(color: Colors.white)));
//             }

//             final users = snapshot.data!;
//             return RefreshIndicator(
//               onRefresh: _refreshUsers,
//               child: ListView.builder(
//                 itemCount: users.length,
//                 itemBuilder: (context, index) {
//                   final user = users[index];
//                   return Card(
//                     child: ListTile(
//                       leading: const Icon(Icons.person, color: Color.fromARGB(255, 216, 17, 17)),
//                       title: Text(user.name, style: const TextStyle(color: Colors.white)),
//                       subtitle: Text(user.email, style: const TextStyle(color: Colors.white70)),
//                       onTap: () => Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                           builder: (_) => UserDetailPage(userId: user.id),
//                         ),
//                       ).then((_) => _refreshUsers()),
//                     ),
//                   );
//                 },
//               ),
//             );
//           },
//         ),
//         floatingActionButton: FloatingActionButton(
//           backgroundColor: const Color(0xFFDC052D),
//           foregroundColor: Colors.white,
//           onPressed: _createUser,
//           child: const Icon(Icons.add),
//         ),
//       );
//     }
//   }


//------------------------


import 'package:flutter/material.dart';
import 'user_model.dart';
import 'user_service.dart';
import 'user_detail.dart';
import 'user_form.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<List<User>> _userList;

  @override
  void initState() {
    super.initState();
    _userList = UserService.getUsers();
  }

  Future<void> _refreshUsers() async {
    setState(() {
      _userList = UserService.getUsers();
    });
  }

  void _createUser() async {
    final created = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => const UserFormPage(), // ✅ No user passed here
      ),
    );
    if (created == true) {
      _refreshUsers();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('KEBS User Management')),
      body: FutureBuilder<List<User>>(
        future: _userList,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(
              child: Text(
                'Error: ${snapshot.error}',
                style: const TextStyle(color: Colors.white),
              ),
            );
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(
              child: Text(
                'No users found.',
                style: TextStyle(color: Colors.white),
              ),
            );
          }

          final users = snapshot.data!;
          return RefreshIndicator(
            onRefresh: _refreshUsers,
            child: ListView.builder(
              itemCount: users.length,
              itemBuilder: (context, index) {
                final user = users[index];
                return Card(
                  color: const Color(0xFF1A1A2E),
                  child: ListTile(
                    leading: const Icon(Icons.person, color: Color(0xFFDC052D)),
                    title: Text(user.name, style: const TextStyle(color: Colors.white)),
                    subtitle: Text(user.email, style: const TextStyle(color: Colors.white70)),
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => UserDetailPage(userId: user.id),
                      ),
                    ).then((_) => _refreshUsers()),
                  ),
                );
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFFDC052D),
        foregroundColor: Colors.white,
        onPressed: _createUser,
        child: const Icon(Icons.add),
      ),
    );
  }
}
