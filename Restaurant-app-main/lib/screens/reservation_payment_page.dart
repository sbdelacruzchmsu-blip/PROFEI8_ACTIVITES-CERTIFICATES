import 'package:flutter/material.dart';

class ReservationPaymentPage extends StatefulWidget {
  const ReservationPaymentPage({super.key});

  @override
  State<ReservationPaymentPage> createState() => _ReservationPaymentPageState();
}

class _ReservationPaymentPageState extends State<ReservationPaymentPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _partySizeController = TextEditingController(text: '2');
  DateTime? _date;
  TimeOfDay? _time;
  bool _paid = false;

  double get _deposit => 200.0; // flat reservation deposit

  @override
  void dispose() {
    _nameController.dispose();
    _partySizeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Reservation & Payment')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(labelText: 'Name'),
                validator: (v) => (v == null || v.trim().isEmpty) ? 'Name required' : null,
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: _partySizeController,
                decoration: const InputDecoration(labelText: 'Party Size'),
                keyboardType: TextInputType.number,
                validator: (v) {
                  final n = int.tryParse((v ?? '').trim());
                  if (n == null || n <= 0) return 'Enter a valid number';
                  return null;
                },
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton.icon(
                      icon: const Icon(Icons.calendar_today),
                      label: Text(_date == null
                          ? 'Pick Date'
                          : '${_date!.year}-${_date!.month.toString().padLeft(2, '0')}-${_date!.day.toString().padLeft(2, '0')}'),
                      onPressed: () async {
                        final now = DateTime.now();
                        final d = await showDatePicker(
                          context: context,
                          firstDate: now,
                          lastDate: DateTime(now.year + 1),
                          initialDate: _date ?? now,
                        );
                        if (d != null) setState(() => _date = d);
                      },
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: OutlinedButton.icon(
                      icon: const Icon(Icons.access_time),
                      label: Text(_time == null ? 'Pick Time' : _time!.format(context)),
                      onPressed: () async {
                        final t = await showTimePicker(
                          context: context,
                          initialTime: TimeOfDay.now(),
                        );
                        if (t != null) setState(() => _time = t);
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Text('Deposit: ₱${_deposit.toStringAsFixed(2)}', style: const TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              ElevatedButton(
                onPressed: _paid
                    ? null
                    : () async {
                        if (!_formKey.currentState!.validate() || _date == null || _time == null) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Complete all fields, date and time')),
                          );
                          return;
                        }
                        setState(() => _paid = true);
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Reservation confirmed and deposit paid')),
                        );
                      },
                child: Text(_paid ? 'Paid' : 'Pay Deposit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}



