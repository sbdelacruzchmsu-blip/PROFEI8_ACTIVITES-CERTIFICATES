import 'package:flutter/material.dart';
import 'screens/username_form_page.dart';
import 'screens/login_form_page.dart';
import 'screens/mixed_inputs_form_page.dart';
import 'screens/registration_form_page.dart';
import 'screens/role_dropdown_form_page.dart';
import 'screens/datetime_picker_form_page.dart';
import 'screens/controller_demo_page.dart';
import 'screens/save_local_list_form_page.dart';
import 'screens/document_tracker_page.dart';
import 'screens/ordering_payment_page.dart';
import 'screens/reservation_payment_page.dart';
import 'screens/form_demos_page.dart';

void main() {
  runApp(const RestaurantApp());
}

class RestaurantApp extends StatelessWidget {
  const RestaurantApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'RESTAURANT reservation with events',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
        useMaterial3: true,
        appBarTheme: const AppBarTheme(
          centerTitle: true,
          elevation: 2,
          titleTextStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.w700, color: Colors.black),
        ),
        cardTheme: CardThemeData(
          elevation: 3,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.deepOrange.shade400, width: 2),
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
      home: const LoginFormPage(),
      routes: {
        '/login': (_) => const LoginFormPage(),
        '/register': (_) => const RegistrationFormPage(),
        '/home': (_) => const HomePage(),
        '/demos': (_) => const FormDemosPage(),
      },
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: const [
            Icon(Icons.restaurant_menu),
            SizedBox(width: 8),
            Text('Table & Events'),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Banner
            Container(
              margin: const EdgeInsets.all(16),
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                gradient: LinearGradient(
                  colors: [color.primaryContainer.withOpacity(0.6), color.primary.withOpacity(0.25)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text('Welcome back!', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                  SizedBox(height: 6),
                  Text('Reserve tables, order dishes, and RSVP to events',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800)),
                ],
              ),
            ),

            // Quick Actions Grid
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                childAspectRatio: 1.15,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  _HomeTile(
                    icon: Icons.event_seat,
                    title: 'Reserve Table',
                    subtitle: 'Pick date & time',
                    onTap: () => Navigator.of(context).push(
                      MaterialPageRoute(builder: (_) => const ReservationPaymentPage()),
                    ),
                  ),
                  _HomeTile(
                    icon: Icons.shopping_bag_outlined,
                    title: 'Order & Pay',
                    subtitle: 'Dine-in or takeout',
                    onTap: () => Navigator.of(context).push(
                      MaterialPageRoute(builder: (_) => const OrderingPaymentPage()),
                    ),
                  ),
                  _HomeTile(
                    icon: Icons.celebration_outlined,
                    title: 'Events',
                    subtitle: 'RSVP & schedules',
                    onTap: () => Navigator.of(context).push(
                      MaterialPageRoute(builder: (_) => const DateTimePickerFormPage()),
                    ),
                  ),
                  _HomeTile(
                    icon: Icons.description_outlined,
                    title: 'Documents',
                    subtitle: 'Track requests',
                    onTap: () => Navigator.of(context).push(
                      MaterialPageRoute(builder: (_) => const DocumentTrackerPage()),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 12),

            // Secondary actions row
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Expanded(
                    child: _WideActionButton(
                      icon: Icons.person_outline,
                      label: 'Profile',
                      onPressed: () => Navigator.of(context).push(
                        MaterialPageRoute(builder: (_) => const UsernameFormPage()),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: _WideActionButton(
                      icon: Icons.tune,
                      label: 'Settings',
                      onPressed: () => Navigator.of(context).push(
                        MaterialPageRoute(builder: (_) => const MixedInputsFormPage()),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 12),

            // Link to demos
            Padding(
              padding: const EdgeInsets.all(16),
              child: OutlinedButton.icon(
                icon: const Icon(Icons.menu_book_outlined),
                label: const Text('See Form Demos'),
                onPressed: () => Navigator.of(context).pushNamed('/demos'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Home tiles UI components
class _HomeTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback onTap;
  const _HomeTile({required this.icon, required this.title, required this.subtitle, required this.onTap});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Ink(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 8, offset: const Offset(0, 3)),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary.withOpacity(0.12),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(icon, color: Theme.of(context).colorScheme.primary),
              ),
              const Spacer(),
              Text(title, style: const TextStyle(fontWeight: FontWeight.w800, fontSize: 16)),
              const SizedBox(height: 2),
              Text(subtitle, style: TextStyle(color: Colors.black.withOpacity(0.55))),
            ],
          ),
        ),
      ),
    );
  }
}

class _WideActionButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onPressed;
  const _WideActionButton({required this.icon, required this.label, required this.onPressed});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 54,
      child: ElevatedButton.icon(
        onPressed: onPressed,
        icon: Icon(icon),
        label: Text(label),
      ),
    );
  }
}
