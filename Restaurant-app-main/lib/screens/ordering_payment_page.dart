import 'package:flutter/material.dart';

class OrderingPaymentPage extends StatefulWidget {
  const OrderingPaymentPage({super.key});

  @override
  State<OrderingPaymentPage> createState() => _OrderingPaymentPageState();
}

class _OrderingPaymentPageState extends State<OrderingPaymentPage> {
  final List<_MenuItem> _menu = const [
    _MenuItem('Burger', 149.0),
    _MenuItem('Pasta', 179.0),
    _MenuItem('Salad', 119.0),
    _MenuItem('Juice', 69.0),
  ];
  final Map<String, int> _cart = {};
  bool _paid = false;

  double get _total {
    double sum = 0;
    for (final m in _menu) {
      final qty = _cart[m.name] ?? 0;
      sum += qty * m.price;
    }
    return sum;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Ordering & Payment')),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _menu.length,
              itemBuilder: (_, i) {
                final m = _menu[i];
                final qty = _cart[m.name] ?? 0;
                return Card(
                  child: ListTile(
                    title: Text('${m.name} - ₱${m.price.toStringAsFixed(2)}'),
                    subtitle: Text('Qty: $qty'),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.remove_circle_outline),
                          onPressed: () => setState(() {
                            if (qty > 0) _cart[m.name] = qty - 1;
                          }),
                        ),
                        IconButton(
                          icon: const Icon(Icons.add_circle_outline),
                          onPressed: () => setState(() {
                            _cart[m.name] = qty + 1;
                          }),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text('Total: ₱${_total.toStringAsFixed(2)}', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                const SizedBox(height: 8),
                ElevatedButton(
                  onPressed: _total == 0 || _paid
                      ? null
                      : () {
                          setState(() => _paid = true);
                          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Payment successful')));
                        },
                  child: Text(_paid ? 'Paid' : 'Pay Now'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _MenuItem {
  final String name;
  final double price;
  const _MenuItem(this.name, this.price);
}



