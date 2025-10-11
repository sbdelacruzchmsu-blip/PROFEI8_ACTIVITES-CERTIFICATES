import 'package:flutter/material.dart';

class EventForm extends StatefulWidget {
  @override
  State<EventForm> createState() => _EventFormState();
}

class _EventFormState extends State<EventForm> {
  final _eventName = TextEditingController();
  List<String> events = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Create Event")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: _eventName,
              decoration: InputDecoration(labelText: "Event Name"),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  events.add(_eventName.text);
                  _eventName.clear();
                });
              },
              child: Text("Add Event"),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: events.length,
                itemBuilder: (context, i) => ListTile(
                  leading: Icon(Icons.event),
                  title: Text(events[i]),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
