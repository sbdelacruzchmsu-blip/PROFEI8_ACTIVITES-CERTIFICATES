import 'package:flutter/material.dart';

class ControllerDemoPage extends StatefulWidget {
  const ControllerDemoPage({super.key});

  @override
  State<ControllerDemoPage> createState() => _ControllerDemoPageState();
}

class _ControllerDemoPageState extends State<ControllerDemoPage> {
  final TextEditingController _controller = TextEditingController();
  String _display = '';

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Controller Demo')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _controller,
              decoration: const InputDecoration(labelText: 'Enter text'),
            ),
            const SizedBox(height: 12),
            ElevatedButton(
              onPressed: () => setState(() => _display = _controller.text),
              child: const Text('Show'),
            ),
            const SizedBox(height: 12),
            Text('You typed: $_display'),
          ],
        ),
      ),
    );
  }
}



