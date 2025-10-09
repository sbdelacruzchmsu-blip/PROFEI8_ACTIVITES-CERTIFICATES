import 'package:flutter/material.dart';

class SaveLocalListFormPage extends StatefulWidget {
  const SaveLocalListFormPage({super.key});

  @override
  State<SaveLocalListFormPage> createState() => _SaveLocalListFormPageState();
}

class _SaveLocalListFormPageState extends State<SaveLocalListFormPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _itemController = TextEditingController();
  final List<String> _items = [];

  @override
  void dispose() {
    _itemController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Save to Local List')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Form(
              key: _formKey,
              child: Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: _itemController,
                      decoration: const InputDecoration(labelText: 'Item'),
                      validator: (v) => (v == null || v.trim().isEmpty) ? 'Enter an item' : null,
                    ),
                  ),
                  const SizedBox(width: 8),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        setState(() {
                          _items.add(_itemController.text.trim());
                          _itemController.clear();
                        });
                      }
                    },
                    child: const Text('Add'),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: _items.isEmpty
                  ? const Center(child: Text('No items yet'))
                  : ListView.builder(
                      itemCount: _items.length,
                      itemBuilder: (_, i) => ListTile(
                        title: Text(_items[i]),
                        trailing: IconButton(
                          icon: const Icon(Icons.delete_outline),
                          onPressed: () => setState(() => _items.removeAt(i)),
                        ),
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}



