import 'package:flutter/material.dart';

class RoleDropdownFormPage extends StatefulWidget {
  const RoleDropdownFormPage({super.key});

  @override
  State<RoleDropdownFormPage> createState() => _RoleDropdownFormPageState();
}

class _RoleDropdownFormPageState extends State<RoleDropdownFormPage> {
  final _formKey = GlobalKey<FormState>();
  String? _selectedRole;
  final List<String> _roles = const ['Admin', 'User', 'Manager', 'Chef'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Role Dropdown')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DropdownButtonFormField<String>(
                decoration: const InputDecoration(labelText: 'Select Role'),
                value: _selectedRole,
                items: _roles
                    .map((r) => DropdownMenuItem(value: r, child: Text(r)))
                    .toList(),
                onChanged: (v) => setState(() => _selectedRole = v),
                validator: (v) => v == null ? 'Please select a role' : null,
              ),
              const SizedBox(height: 12),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Role: $_selectedRole')),
                    );
                  }
                },
                child: const Text('Save'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}



