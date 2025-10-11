import 'package:flutter/material.dart';

class DrawerMenu extends StatelessWidget {
  const DrawerMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.deepOrange[400]!, Colors.deepOrange[800]!],
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: const [
                Icon(Icons.restaurant_menu, size: 50, color: Colors.white),
                SizedBox(height: 10),
                Text(
                  "RestoEvents Menu",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(Icons.person_outline, color: Colors.deepOrange),
            title: const Text("Username Form"),
            subtitle: const Text("Simple username entry"),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, '/username');
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.login, color: Colors.deepOrange),
            title: const Text("Login"),
            subtitle: const Text("Email & password form"),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, '/login');
            },
          ),
          ListTile(
            leading: const Icon(Icons.person_add, color: Colors.deepOrange),
            title: const Text("Register"),
            subtitle: const Text("Create new account"),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, '/register');
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.restaurant, color: Colors.deepOrange),
            title: const Text("Reserve Table"),
            subtitle: const Text("Book your dining experience"),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, '/reservation');
            },
          ),
          ListTile(
            leading: const Icon(Icons.event, color: Colors.deepOrange),
            title: const Text("Book Event"),
            subtitle: const Text("Reserve for special occasions"),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, '/events');
            },
          ),
          ListTile(
            leading: const Icon(Icons.history, color: Colors.deepOrange),
            title: const Text("Reservation History"),
            subtitle: const Text("View past bookings"),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, '/history');
            },
          ),
        ],
      ),
    );
  }
}
