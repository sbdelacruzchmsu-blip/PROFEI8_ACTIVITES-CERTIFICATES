import 'package:flutter/material.dart';

class Reservation {
  final String name;
  final String phone;
  final int guests;
  final DateTime date;
  final TimeOfDay time;
  final bool isVIP;
  final bool needsHighChair;
  final String specialRequests;

  Reservation({
    required this.name,
    required this.phone,
    required this.guests,
    required this.date,
    required this.time,
    required this.isVIP,
    required this.needsHighChair,
    required this.specialRequests,
  });
}
