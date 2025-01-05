import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'login_screen.dart';
import 'package:ravintola_diagonal/widgets/drawer_widget.dart';
import 'package:ravintola_diagonal/widgets/custom_app_bar.dart';



class LoyaltyCardScreen extends StatefulWidget {
  const LoyaltyCardScreen({Key? key}) : super(key: key);

  @override
  State<LoyaltyCardScreen> createState() => _LoyaltyCardScreenState();
}

class _LoyaltyCardScreenState extends State<LoyaltyCardScreen> {
  int currentStamps = 3;  // Move this to state
  static const int totalStamps = 10;

   void _incrementStamps() {
    if (currentStamps < totalStamps) {
      setState(() {
        currentStamps++;
      });
    }
  }
  Future<void> _handleLogout(BuildContext context) async {
    try {
      await FirebaseAuth.instance.signOut();
      if (context.mounted) {
        Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => const LoginScreen()),
          (route) => false,
        );
      }
    } catch (e) {
      print('Error signing out: $e');
    }
  }

  Widget _buildStampCircle(BuildContext context, bool isStamped) {

    double size = MediaQuery.of(context).size.width;
    return Container(
      width: size*0.12,
      height: size*0.12,
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: isStamped ? const Color(0xFF8AB644) : Colors.black,
        shape: BoxShape.circle,
      ),
      child: isStamped
          ? const Icon(
              Icons.restaurant,
              color: Colors.white,
            )
          : null,
    );
  }

  @override
  Widget build(BuildContext context) {


    final int remainingStamps = totalStamps - currentStamps;
    double size = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: const Color(0xFFFFF8E7),
      drawer: const DrawerWidget(),
      appBar: const CustomAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            children: [
              const SizedBox(height: 20),
              const Text(
                'You are',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.center,
              ),
              Text(
                '$remainingStamps',
                style: const TextStyle(
                  fontSize: 48,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF8AB644),
                ),
                textAlign: TextAlign.center,
              ),
              const Text(
                'meals away\nfrom your\nfree meal!',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 40),
              // First row of stamps
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  for (int i = 0; i < 5; i++)
                    _buildStampCircle(context, i < currentStamps),
                ],
              ),
              // Second row of stamps
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  for (int i = 5; i < totalStamps; i++)
                    _buildStampCircle(context, i < currentStamps),
                ],
              ),
              const SizedBox(height: 30),
              Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  color: const Color(0xFF8AB644),
                  borderRadius: BorderRadius.circular(40),
                ),
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Free',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    ),
                    Icon(
                      Icons.restaurant,
                      color: Colors.white,
                    ),
                    Text(
                      'Meal',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 40),
              // QR Code placeholder
              InkWell(
                onTap: _incrementStamps,
                child: Container(
                  width: size*0.36,
                  height: size*0.36,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                  ),
                  child: Icon(
                    Icons.qr_code_2,
                    size: size*0.34,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
