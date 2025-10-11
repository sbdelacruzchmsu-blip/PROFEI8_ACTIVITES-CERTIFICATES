import 'package:flutter/material.dart';
import '../models/reservation.dart';

// Features 1, 5, 8, 9, 10: Complete reservation form with various input types
class ReservationScreen extends StatefulWidget {
  const ReservationScreen({Key? key}) : super(key: key);

  @override
  State<ReservationScreen> createState() => _ReservationScreenState();
}

class _ReservationScreenState extends State<ReservationScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _guestsController = TextEditingController();
  final _specialRequestsController = TextEditingController();

  DateTime? _selectedDate;
  TimeOfDay? _selectedTime;
  bool _isVIPTable = false;
  bool _needsHighChair = false;
  String _displayText = '';

  final List<Reservation> _reservations = [];

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _guestsController.dispose();
    _specialRequestsController.dispose();
    super.dispose();
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 90)),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (picked != null && picked != _selectedTime) {
      setState(() {
        _selectedTime = picked;
      });
    }
  }

  void _captureAndDisplay() {
    setState(() {
      _displayText = 'Reservation for: ${_nameController.text}';
    });
  }

  void _submitReservation() {
    if (_formKey.currentState!.validate()) {
      if (_selectedDate == null || _selectedTime == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Please select date and time'),
            backgroundColor: Colors.red,
          ),
        );
        return;
      }

      final reservation = Reservation(
        name: _nameController.text,
        phone: _phoneController.text,
        guests: int.parse(_guestsController.text),
        date: _selectedDate!,
        time: _selectedTime!,
        isVIP: _isVIPTable,
        needsHighChair: _needsHighChair,
        specialRequests: _specialRequestsController.text,
      );

      setState(() {
        _reservations.add(reservation);
        _nameController.clear();
        _phoneController.clear();
        _guestsController.clear();
        _specialRequestsController.clear();
        _selectedDate = null;
        _selectedTime = null;
        _isVIPTable = false;
        _needsHighChair = false;
        _displayText = '';
      });

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Reservation submitted successfully!'),
          backgroundColor: Colors.green,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Table Reservation'),
        actions: [
          IconButton(
            icon: const Icon(Icons.event),
            onPressed: () {
              Navigator.pushNamed(context, '/events');
            },
            tooltip: 'Book Events',
          ),
          IconButton(
            icon: const Icon(Icons.history),
            onPressed: () {
              Navigator.pushNamed(context, '/history');
            },
            tooltip: 'View History',
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Card(
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        'Reserve Your Table',
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                              fontWeight: FontWeight.bold,
                              color: Colors.deepOrange,
                            ),
                      ),
                      const SizedBox(height: 20),
                      TextFormField(
                        controller: _nameController,
                        decoration: const InputDecoration(
                          labelText: 'Full Name',
                          prefixIcon: Icon(Icons.person),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your name';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 16),
                      TextFormField(
                        controller: _phoneController,
                        decoration: const InputDecoration(
                          labelText: 'Phone Number',
                          prefixIcon: Icon(Icons.phone),
                        ),
                        keyboardType: TextInputType.phone,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your phone number';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 16),
                      TextFormField(
                        controller: _guestsController,
                        decoration: const InputDecoration(
                          labelText: 'Number of Guests',
                          prefixIcon: Icon(Icons.group),
                        ),
                        keyboardType: TextInputType.number,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter number of guests';
                          }
                          if (int.tryParse(value) == null) {
                            return 'Please enter a valid number';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 16),
                      ListTile(
                        title: Text(
                          _selectedDate == null
                              ? 'Select Date'
                              : 'Date: ${_selectedDate!.day}/${_selectedDate!.month}/${_selectedDate!.year}',
                        ),
                        leading: const Icon(Icons.calendar_today),
                        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                        onTap: () => _selectDate(context),
                        tileColor: Colors.grey[100],
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      const SizedBox(height: 16),
                      ListTile(
                        title: Text(
                          _selectedTime == null
                              ? 'Select Time'
                              : 'Time: ${_selectedTime!.format(context)}',
                        ),
                        leading: const Icon(Icons.access_time),
                        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                        onTap: () => _selectTime(context),
                        tileColor: Colors.grey[100],
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      const SizedBox(height: 16),
                      CheckboxListTile(
                        title: const Text('VIP Table'),
                        subtitle: const Text('Premium seating area'),
                        value: _isVIPTable,
                        onChanged: (bool? value) {
                          setState(() {
                            _isVIPTable = value ?? false;
                          });
                        },
                        secondary: const Icon(Icons.star),
                      ),
                      SwitchListTile(
                        title: const Text('High Chair Needed'),
                        subtitle: const Text('For children'),
                        value: _needsHighChair,
                        onChanged: (bool value) {
                          setState(() {
                            _needsHighChair = value;
                          });
                        },
                        secondary: const Icon(Icons.child_care),
                      ),
                      const SizedBox(height: 16),
                      TextFormField(
                        controller: _specialRequestsController,
                        decoration: const InputDecoration(
                          labelText: 'Special Requests',
                          prefixIcon: Icon(Icons.note),
                          hintText: 'Dietary restrictions, allergies, etc.',
                        ),
                        maxLines: 3,
                      ),
                      const SizedBox(height: 16),
                      ElevatedButton.icon(
                        onPressed: _captureAndDisplay,
                        icon: const Icon(Icons.preview),
                        label: const Text('Preview Name'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.grey[700],
                          padding: const EdgeInsets.symmetric(vertical: 12),
                        ),
                      ),
                      if (_displayText.isNotEmpty)
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Text(
                            _displayText,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.deepOrange,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      const SizedBox(height: 20),
                      SizedBox(
                        height: 50,
                        child: ElevatedButton(
                          onPressed: _submitReservation,
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          child: const Text(
                            'SUBMIT RESERVATION',
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            if (_reservations.isNotEmpty) ...[
              const SizedBox(height: 24),
              Text(
                'Your Reservations',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(height: 12),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: _reservations.length,
                itemBuilder: (context, index) {
                  final reservation = _reservations[index];
                  return Card(
                    margin: const EdgeInsets.only(bottom: 12),
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Colors.deepOrange,
                        child: Text('${index + 1}'),
                      ),
                      title: Text(
                        reservation.name,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${reservation.date.day}/${reservation.date.month}/${reservation.date.year} at ${reservation.time.format(context)}',
                          ),
                          Text(
                              'Guests: ${reservation.guests} | Phone: ${reservation.phone}'),
                          if (reservation.isVIP)
                            const Text(
                              '⭐ VIP Table',
                              style: TextStyle(color: Colors.amber),
                            ),
                          if (reservation.needsHighChair)
                            const Text('🪑 High Chair Required'),
                          if (reservation.specialRequests.isNotEmpty)
                            Text('Note: ${reservation.specialRequests}'),
                        ],
                      ),
                      isThreeLine: true,
                    ),
                  );
                },
              ),
            ],
          ],
        ),
      ),
    );
  }
}
