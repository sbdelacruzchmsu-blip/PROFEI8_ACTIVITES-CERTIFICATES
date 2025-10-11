import 'package:flutter/material.dart';

class OrderForm extends StatefulWidget {
  @override
  State<OrderForm> createState() => _OrderFormState();
}

class _OrderFormState extends State<OrderForm> {
  final _controller = TextEditingController();
  String result = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Order & Payment")),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: InputDecoration(labelText: "Enter your order"),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  result = _controller.text;
                });
              },
              child: Text("Submit"),
            ),
            SizedBox(height: 20),
            if (result.isNotEmpty)
              Text("Your Order: $result", style: TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}
