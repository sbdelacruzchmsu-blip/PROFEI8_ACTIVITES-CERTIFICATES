import 'package:flutter/material.dart';

class EventBooking {
  final String organizer;
  final String email;
  final String phone;
  final String eventType;
  final int attendees;
  final double budget;
  final DateTime date;
  final TimeOfDay time;
  final bool needsCatering;
  final bool needsDecoration;
  final bool needsEntertainment;
  final String description;

  EventBooking({
    required this.organizer,
    required this.email,
    required this.phone,
    required this.eventType,
    required this.attendees,
    required this.budget,
    required this.date,
    required this.time,
    required this.needsCatering,
    required this.needsDecoration,
    required this.needsEntertainment,
    required this.description,
  });
}
