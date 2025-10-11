import 'package:flutter/material.dart';
import 'screen/login_screen.dart';
import 'screen/registration_screen.dart';
import 'screen/reservation_screen.dart';
import 'screen/event_booking_screen.dart';
import 'screen/reservation_history_screen.dart';
import 'screen/username_form_screen.dart';

void main() {
  runApp(const RestaurantReservationApp());
}

class RestaurantReservationApp extends StatelessWidget {
  const RestaurantReservationApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Restaurant Reservation & Events',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          filled: true,
          fillColor: Colors.grey[50],
        ),
      ),
      home: const LoginScreen(),
      routes: {
        '/login': (context) => const LoginScreen(),
        '/register': (context) => const RegistrationScreen(),
        '/reservation': (context) => const ReservationScreen(),
        '/events': (context) => const EventBookingScreen(),
        '/history': (context) => const ReservationHistoryScreen(),
        '/username': (context) => const UsernameFormScreen(),
      },
    );
  }
}
