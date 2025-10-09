import 'package:flutter/material.dart';

class DocumentTrackerPage extends StatefulWidget {
  const DocumentTrackerPage({super.key});

  @override
  State<DocumentTrackerPage> createState() => _DocumentTrackerPageState();
}

class _DocumentTrackerPageState extends State<DocumentTrackerPage> {
  final TextEditingController _titleController = TextEditingController();
  final List<_Document> _documents = [];

  @override
  void dispose() {
    _titleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Document Tracker')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _titleController,
                    decoration: const InputDecoration(labelText: 'Document Title'),
                  ),
                ),
                const SizedBox(width: 8),
                ElevatedButton(
                  onPressed: () {
                    final t = _titleController.text.trim();
                    if (t.isEmpty) return;
                    setState(() {
                      _documents.add(_Document(title: t));
                      _titleController.clear();
                    });
                  },
                  child: const Text('Add'),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Expanded(
              child: _documents.isEmpty
                  ? const Center(child: Text('No documents'))
                  : ListView.builder(
                      itemCount: _documents.length,
                      itemBuilder: (_, i) {
                        final d = _documents[i];
                        return Card(
                          child: ListTile(
                            title: Text(d.title),
                            subtitle: Text('Status: ${d.status.name}'),
                            trailing: PopupMenuButton<_DocStatus>(
                              onSelected: (s) => setState(() => d.status = s),
                              itemBuilder: (_) => _DocStatus.values
                                  .map((s) => PopupMenuItem(value: s, child: Text(s.name)))
                                  .toList(),
                            ),
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}

enum _DocStatus { drafted, submitted, approved, rejected }

class _Document {
  final String title;
  _DocStatus status;
  _Document({required this.title, this.status = _DocStatus.drafted});
}



