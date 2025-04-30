// import 'package:flutter/material.dart';
// import 'user_model.dart';
// import 'user_service.dart';

// class UserFormPage extends StatefulWidget {
//   final User? user;

//   const UserFormPage({super.key, this.user});

//   @override
//   State<UserFormPage> createState() => _UserFormPageState();
// }

// class _UserFormPageState extends State<UserFormPage> {
//   final _formKey = GlobalKey<FormState>();
//   late TextEditingController _aidController;
//   late TextEditingController _nameController;
//   late TextEditingController _emailController;
//   late TextEditingController _zoneController;
//   late TextEditingController _roleController;
//   late TextEditingController _departmentController;

//   @override
//   void initState() {
//     super.initState();
//     _aidController = TextEditingController(text: widget.user?.aid ?? '');
//     _nameController = TextEditingController(text: widget.user?.name ?? '');
//     _emailController = TextEditingController(text: widget.user?.email ?? '');
//     _zoneController = TextEditingController(text: widget.user?.zone ?? '');
//     _roleController = TextEditingController(text: widget.user?.role ?? '');
//     _departmentController = TextEditingController(text: widget.user?.department ?? '');
//   }

//   @override
//   void dispose() {
//     _aidController.dispose();
//     _nameController.dispose();
//     _emailController.dispose();
//     _zoneController.dispose();
//     _roleController.dispose();
//     _departmentController.dispose();
//     super.dispose();
//   }

//   void _submitForm() async {
//     if (_formKey.currentState!.validate()) {
//       final user = User(
//         id: widget.user?.id ?? '',
//         aid: _aidController.text,
//         name: _nameController.text,
//         email: _emailController.text,
//         zone: _zoneController.text,
//         role: _roleController.text,
//         department: _departmentController.text,
//       );

//       if (widget.user == null) {
//         await UserService.createUser(user);
//       } else {
//         await UserService.updateUser(user.id, user);
//       }

//       if (mounted) {
//         Navigator.pop(context, true);
//       }
//     }
//   }

//   @override
// Widget build(BuildContext context) {
//   return Scaffold(
//     appBar: AppBar(
//       title: Text(widget.user == null ? 'Add User' : 'Edit User'),
//     ),
//     body: SingleChildScrollView(
//       padding: const EdgeInsets.all(16),
//       child: Center(
//         child: Card(
//           margin: const EdgeInsets.symmetric(vertical: 16),
//           child: Padding(
//             padding: const EdgeInsets.all(16),
//             child: Column(
//               mainAxisSize: MainAxisSize.min, // 
//               children: [
//                   _buildTextField(_aidController, 'AID'),
//                   _buildTextField(_nameController, 'Name'),
//                   _buildTextField(_emailController, 'Email'),
//                   _buildTextField(_zoneController, 'Zone'),
//                   _buildTextField(_roleController, 'Role'),
//                   _buildTextField(_departmentController, 'Department'),
//                 const SizedBox(height: 20),
//                 ElevatedButton(
//                   onPressed: _submitForm,
//                   child: Text(widget.user == null ? 'Create' : 'Update'),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     ),
//   );
// }


//   Widget _buildTextField(TextEditingController controller, String label) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 8),
//       child: TextFormField(
//         controller: controller,
//         style: const TextStyle(color: Colors.white),
//         decoration: InputDecoration(
//           labelText: label,
//           labelStyle: const TextStyle(color: Colors.white70),
//           enabledBorder: const OutlineInputBorder(
//             borderSide: BorderSide(color: Colors.white30),
//           ),
//           focusedBorder: const OutlineInputBorder(
//             borderSide: BorderSide(color: Colors.white),
//           ),
//         ),
//         validator: (value) => value == null || value.isEmpty ? 'Please enter $label' : null,
//       ),
//     );
//   }
// }


// import 'package:flutter/material.dart';
// import 'user_service.dart';

// class UserForm extends StatefulWidget {
//   final Map<String, dynamic>? user;

//   const UserForm({super.key, this.user});

//   @override
//   State<UserForm> createState() => _UserFormState();
// }

// class _UserFormState extends State<UserForm> {
//   final _formKey = GlobalKey<FormState>();

//   final _aidController = TextEditingController();
//   final _nameController = TextEditingController();
//   final _emailController = TextEditingController();
//   final _zoneController = TextEditingController();
//   final _roleController = TextEditingController();
//   final _departmentController = TextEditingController();

//   @override
//   void initState() {
//     super.initState();
//     if (widget.user != null) {
//       _aidController.text = widget.user?['AID'] ?? '';
//       _nameController.text = widget.user?['name'] ?? '';
//       _emailController.text = widget.user?['email'] ?? '';
//       _zoneController.text = widget.user?['zone'] ?? '';
//       _roleController.text = widget.user?['role'] ?? '';
//       _departmentController.text = widget.user?['department'] ?? '';
//     }
//   }

//   @override
//   void dispose() {
//     _aidController.dispose();
//     _nameController.dispose();
//     _emailController.dispose();
//     _zoneController.dispose();
//     _roleController.dispose();
//     _departmentController.dispose();
//     super.dispose();
//   }

//   Future<void> _submitForm() async {
//     final user = {
//       'AID': _aidController.text,
//       'name': _nameController.text,
//       'email': _emailController.text,
//       'zone': _zoneController.text,
//       'role': _roleController.text,
//       'department': _departmentController.text,
//     };

//     try {
//       if (widget.user == null) {
//         // Create new user
//         await UserService.createUser(user);
//       } else {
//         // Update existing user
//         final userId = widget.user?['id'];
//         if (userId != null) {
//           await UserService.updateUser(userId, user);
//         } else {
//           throw Exception("User ID is null during edit.");
//         }
//       }
//       if (mounted) Navigator.pop(context);
//     } catch (e) {
//       print('Error: $e');
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text('Something went wrong. Please try again.')),
//       );
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.user == null ? 'Add User' : 'Edit User'),
//       ),
//       body: Center(
//         child: SingleChildScrollView(
//           padding: const EdgeInsets.all(16),
//           child: Card(
//             color: const Color(0xFF111A2A),
//             elevation: 4,
//             shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
//             child: Padding(
//               padding: const EdgeInsets.all(20),
//               child: Form(
//                 key: _formKey,
//                 child: Column(
//                   mainAxisSize: MainAxisSize.min, // Wrap content
//                   children: [
//                     _buildTextField(_aidController, 'AID'),
//                     const SizedBox(height: 10),
//                     _buildTextField(_nameController, 'Name'),
//                     const SizedBox(height: 10),
//                     _buildTextField(_emailController, 'Email'),
//                     const SizedBox(height: 10),
//                     _buildTextField(_zoneController, 'Zone'),
//                     const SizedBox(height: 10),
//                     _buildTextField(_roleController, 'Role'),
//                     const SizedBox(height: 10),
//                     _buildTextField(_departmentController, 'Department'),
//                     const SizedBox(height: 20),
//                     ElevatedButton(
//                       onPressed: _submitForm,
//                       child: Text(widget.user == null ? 'Create' : 'Update'),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildTextField(TextEditingController controller, String label) {
//     return TextFormField(
//       controller: controller,
//       style: const TextStyle(color: Colors.white),
//       decoration: InputDecoration(
//         labelText: label,
//         labelStyle: const TextStyle(color: Colors.white70),
//         enabledBorder: const OutlineInputBorder(
//           borderSide: BorderSide(color: Colors.white24),
//         ),
//         focusedBorder: const OutlineInputBorder(
//           borderSide: BorderSide(color: Colors.white),
//         ),
//       ),
//       validator: (value) => value == null || value.isEmpty ? 'Enter $label' : null,
//     );
//   }
// }

//-----------------------------------------

// import 'package:flutter/material.dart';
// import 'user_model.dart';
// import 'user_service.dart';

// class UserFormPage extends StatefulWidget {
//   final User? user;

//   const UserFormPage({super.key, this.user});

//   @override
//   State<UserFormPage> createState() => _UserFormPageState();
// }

// class _UserFormPageState extends State<UserFormPage> {
//   final _formKey = GlobalKey<FormState>();
//   late TextEditingController _aidController;
//   late TextEditingController _nameController;
//   late TextEditingController _emailController;
//   late TextEditingController _zoneController;
//   late TextEditingController _roleController;
//   late TextEditingController _departmentController;

//   @override
//   void initState() {
//     super.initState();
//     _aidController = TextEditingController(text: widget.user?.aid ?? '');
//     _nameController = TextEditingController(text: widget.user?.name ?? '');
//     _emailController = TextEditingController(text: widget.user?.email ?? '');
//     _zoneController = TextEditingController(text: widget.user?.zone ?? '');
//     _roleController = TextEditingController(text: widget.user?.role ?? '');
//     _departmentController = TextEditingController(text: widget.user?.department ?? '');
//   }

//   @override
//   void dispose() {
//     _aidController.dispose();
//     _nameController.dispose();
//     _emailController.dispose();
//     _zoneController.dispose();
//     _roleController.dispose();
//     _departmentController.dispose();
//     super.dispose();
//   }

//   Future<void> _submitForm() async {
//     if (_formKey.currentState!.validate()) {
//       final user = User(
//         id: widget.user?.id ?? '',
//         aid: _aidController.text,
//         name: _nameController.text,
//         email: _emailController.text,
//         zone: _zoneController.text,
//         role: _roleController.text,
//         department: _departmentController.text,
//       );

//       if (widget.user == null) {
//         await UserService.createUser(user);
//       } else {
//         await UserService.updateUser(context,user.id, user);
//       }

//       if (mounted) Navigator.pop(context, true);
//     }
//   }

//   Widget _buildTextField(TextEditingController controller, String label) {
//     return TextFormField(
//       controller: controller,
//       style: const TextStyle(color: Colors.white),
//       decoration: InputDecoration(
//         labelText: label,
//         labelStyle: const TextStyle(color: Colors.white),
//         filled: true,
//         fillColor: const Color(0xFF1A1A2E),
//         border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
//       ),
//       validator: (value) => value == null || value.isEmpty ? 'Required field' : null,
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text(widget.user == null ? 'Add User' : 'Edit User')),
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.all(16.0),
//         child: Form(
//           key: _formKey,
//           child: Column(
//             children: [
//               _buildTextField(_aidController, 'AID'),
//               const SizedBox(height: 12),
//               _buildTextField(_nameController, 'Name'),
//               const SizedBox(height: 12),
//               _buildTextField(_emailController, 'Email'),
//               const SizedBox(height: 12),
//               _buildTextField(_zoneController, 'Zone'),
//               const SizedBox(height: 12),
//               _buildTextField(_roleController, 'Role'),
//               const SizedBox(height: 12),
//               _buildTextField(_departmentController, 'Department'),
//               const SizedBox(height: 20),
//               ElevatedButton(
//                 onPressed: _submitForm,
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: const Color(0xFFDC052D),
//                   foregroundColor: Colors.white,
//                 ),
//                 child: Text(widget.user == null ? 'Create' : 'Update'),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }


// //--------------------------------------------------



// import 'package:flutter/material.dart';
// import 'user_model.dart';
// import 'user_service.dart';

// class UserFormPage extends StatefulWidget {
//   final User user;

//   const UserFormPage({super.key, required this.user});

//   @override
//   _UserFormPageState createState() => _UserFormPageState();
// }

// class _UserFormPageState extends State<UserFormPage> {
//   final _formKey = GlobalKey<FormState>();

//   late TextEditingController _aidController;
//   late TextEditingController _nameController;
//   late TextEditingController _emailController;
//   late TextEditingController _zoneController;
//   late TextEditingController _roleController;
//   late TextEditingController _departmentController;

//   @override
//   void initState() {
//     super.initState();
//     // Initialize controllers with existing data if editing
//     _aidController = TextEditingController(text: widget.user.aid);
//     _nameController = TextEditingController(text: widget.user.name);
//     _emailController = TextEditingController(text: widget.user.email);
//     _zoneController = TextEditingController(text: widget.user.zone);
//     _roleController = TextEditingController(text: widget.user.role);
//     _departmentController = TextEditingController(text: widget.user.department);
//   }

//   @override
//   void dispose() {
//     // Dispose controllers when the form is disposed
//     _aidController.dispose();
//     _nameController.dispose();
//     _emailController.dispose();
//     _zoneController.dispose();
//     _roleController.dispose();
//     _departmentController.dispose();
//     super.dispose();
//   }

//   void _submitForm() async {
//     if (_formKey.currentState!.validate()) {
//       _formKey.currentState!.save();

//       // Create a new User object with the form data
//       final newUser = User(
//         aid: _aidController.text,
//         name: _nameController.text,
//         email: _emailController.text,
//         zone: _zoneController.text,
//         role: _roleController.text,
//         department: _departmentController.text,
//         id: widget.user.id, // keep id for editing or set it for new users
//       );

//       // Ensure id is not null before performing update
//       if (widget.user.id != null) {
//         await UserService.updateUser(widget.user.id!, newUser);
//       } else {
//         // Handle new user creation logic
//         await UserService.createUser(newUser);
//       }

//       Navigator.pop(context, true);
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text(widget.user.id != null ? 'Edit User' : 'Create User')),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Form(
//           key: _formKey,
//           child: ListView(
//             children: [
//               TextFormField(
//                 controller: _aidController,
//                 decoration: const InputDecoration(labelText: 'AID'),
//                 validator: (value) => value!.isEmpty ? 'Please enter AID' : null,
//               ),
//               TextFormField(
//                 controller: _nameController,
//                 decoration: const InputDecoration(labelText: 'Name'),
//                 validator: (value) => value!.isEmpty ? 'Please enter a name' : null,
//               ),
//               TextFormField(
//                 controller: _emailController,
//                 decoration: const InputDecoration(labelText: 'Email'),
//                 validator: (value) => value!.isEmpty ? 'Please enter an email' : null,
//               ),
//               TextFormField(
//                 controller: _zoneController,
//                 decoration: const InputDecoration(labelText: 'Zone'),
//                 validator: (value) => value!.isEmpty ? 'Please enter a zone' : null,
//               ),
//               TextFormField(
//                 controller: _roleController,
//                 decoration: const InputDecoration(labelText: 'Role'),
//                 validator: (value) => value!.isEmpty ? 'Please enter a role' : null,
//               ),
//               TextFormField(
//                 controller: _departmentController,
//                 decoration: const InputDecoration(labelText: 'Department'),
//                 validator: (value) => value!.isEmpty ? 'Please enter a department' : null,
//               ),
//               const SizedBox(height: 20),
//               ElevatedButton(
//                 onPressed: _submitForm,
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: const Color(0xFFDC052D),
//                   foregroundColor: Colors.white,
//                 ),
//                 child: Text(widget.user.id != null ? 'Update User' : 'Create User'),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }



//-----------------




import 'package:flutter/material.dart';
import 'user_model.dart';
import 'user_service.dart';

class UserFormPage extends StatefulWidget {
  final User? user;

  const UserFormPage({super.key, this.user});

  @override
  State<UserFormPage> createState() => _UserFormPageState();
}

class _UserFormPageState extends State<UserFormPage> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _aidController;
  late TextEditingController _nameController;
  late TextEditingController _emailController;
  late TextEditingController _zoneController;
  late TextEditingController _roleController;
  late TextEditingController _departmentController;

  @override
  void initState() {
    super.initState();
    _aidController = TextEditingController(text: widget.user?.aid ?? '');
    _nameController = TextEditingController(text: widget.user?.name ?? '');
    _emailController = TextEditingController(text: widget.user?.email ?? '');
    _zoneController = TextEditingController(text: widget.user?.zone ?? '');
    _roleController = TextEditingController(text: widget.user?.role ?? '');
    _departmentController = TextEditingController(text: widget.user?.department ?? '');
  }

  @override
  void dispose() {
    _aidController.dispose();
    _nameController.dispose();
    _emailController.dispose();
    _zoneController.dispose();
    _roleController.dispose();
    _departmentController.dispose();
    super.dispose();
  }

  Future<void> _submitForm() async {
    if (_formKey.currentState!.validate()) {
      final user = User(
        id: widget.user?.id ?? '',
        aid: _aidController.text,
        name: _nameController.text,
        email: _emailController.text,
        zone: _zoneController.text,
        role: _roleController.text,
        department: _departmentController.text,
      );

      try {
        if (widget.user == null) {
          await UserService.createUser(user);
          _showSnackBar('User created successfully');
        } else {
          await UserService.updateUser(context, user.id, user);
          _showSnackBar('User updated successfully');
        }
        if (mounted) Navigator.pop(context, true);
      } catch (e) {
        _showSnackBar('Operation failed: ${e.toString()}');
      }
    }
  }

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message, style: const TextStyle(color: Colors.white)),
        backgroundColor: Colors.pink,
      ),
    );
  }

  Widget _buildTextField(TextEditingController controller, String label) {
    return TextFormField(
      controller: controller,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        labelText: label,
        labelStyle: const TextStyle(color: Colors.white),
        filled: true,
        fillColor: const Color(0xFF1A1A2E),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
      ),
      validator: (value) => value == null || value.isEmpty ? 'Required field' : null,
    );
  }

  @override
  Widget build(BuildContext context) {
    final isEdit = widget.user != null;

    return Scaffold(
      appBar: AppBar(title: Text(isEdit ? 'Edit User' : 'Add User')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              _buildTextField(_aidController, 'AID'),
              const SizedBox(height: 12),
              _buildTextField(_nameController, 'Name'),
              const SizedBox(height: 12),
              _buildTextField(_emailController, 'Email'),
              const SizedBox(height: 12),
              _buildTextField(_zoneController, 'Zone'),
              const SizedBox(height: 12),
              _buildTextField(_roleController, 'Role'),
              const SizedBox(height: 12),
              _buildTextField(_departmentController, 'Department'),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _submitForm,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFDC052D),
                  foregroundColor: Colors.white,
                ),
                child: Text(isEdit ? 'Update' : 'Create'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
