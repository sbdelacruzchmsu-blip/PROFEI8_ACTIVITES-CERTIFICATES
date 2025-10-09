import 'package:flutter/material.dart';

class MixedInputsFormPage extends StatefulWidget {
  const MixedInputsFormPage({super.key});

  @override
  State<MixedInputsFormPage> createState() => _MixedInputsFormPageState();
}

class _MixedInputsFormPageState extends State<MixedInputsFormPage> {
  final TextEditingController _notesController = TextEditingController();
  bool _acceptTerms = false;
  bool _enableNotifications = true;

  @override
  void dispose() {
    _notesController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Mixed Inputs')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _notesController,
              decoration: const InputDecoration(labelText: 'Notes'),
            ),
            const SizedBox(height: 12),
            CheckboxListTile(
              value: _acceptTerms,
              onChanged: (v) => setState(() => _acceptTerms = v ?? false),
              title: const Text('Accept Terms'),
            ),
            SwitchListTile(
              value: _enableNotifications,
              onChanged: (v) => setState(() => _enableNotifications = v),
              title: const Text('Enable Notifications'),
            ),
            const SizedBox(height: 12),
            ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Notes: ${_notesController.text}, Terms: $_acceptTerms, Notifs: $_enableNotifications'),
                  ),
                );
              },
              child: const Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}



