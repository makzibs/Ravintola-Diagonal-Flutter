import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});
 Future<void> _handleLogout(BuildContext context) async {
    try {
      await FirebaseAuth.instance.signOut();
      Navigator.pushNamedAndRemoveUntil(
        context,
        'LoginScreen',
        (route) => false,
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Error signing out. Please try again.'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(
              color: Colors.black,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const Text(
                  'RAVINTOLA DIAGONAL',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  FirebaseAuth.instance.currentUser?.email ?? '',
                  style: const TextStyle(
                    color: Colors.white70,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(Icons.card_giftcard),
            title: const Text('Loyalty Card'),
            onTap: () {
              Navigator.pop(context); // Close drawer
              Navigator.pushNamed(context, 'LoyaltyCardScreen');
            },
          ),
          ListTile(
            leading: const Icon(Icons.restaurant_menu),
            title: const Text('Menu'),
            onTap: () {
              Navigator.pop(context); // Close drawer
              Navigator.pushNamed(context, 'MenuScreen');
              // TODO: Navigate to menu screen
            },
          ),
          ListTile(
            leading: const Icon(Icons.location_on),
            title: const Text('Location'),
            onTap: () {
              Navigator.pop(context); // Close drawer
              Navigator.pushNamed(context, 'LocationScreen');
            },
          ),
          ListTile(
            leading: const Icon(Icons.card_giftcard),
            title: const Text('Ansaitut kupongit'),
            onTap: () {
              Navigator.pop(context); // Close drawer
              Navigator.pushNamed(context, 'EarnedCouponScreen');
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('Logout'),
            onTap: () => _handleLogout(context),
          ),
        ],
      ),
    );
  }
  }

