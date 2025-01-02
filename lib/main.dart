import 'package:flutter/material.dart';
import 'package:ravintola_diagonal/screens/earned_coupon_screen.dart';
import 'package:ravintola_diagonal/screens/loyalty_card_screen.dart';
import 'package:ravintola_diagonal/screens/menu_screen.dart';
import 'screens/login_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ravintola_diagonal/screens/location_screen.dart';


Future<void> main() async {
  try {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    print('Firebase initialized successfully');
  } catch (e) {
    print('Failed to initialize Firebase: $e');
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = GoogleFonts.poppinsTextTheme();
    
    return MaterialApp(
      title: 'Ravintola Diagonal',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFFFFF8E7),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF8AB644),
          primary: const Color(0xFF8AB644),
        ),
        textTheme: textTheme,
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide.none,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: Colors.black, width: 1),
          ),
          labelStyle: textTheme.bodyLarge?.copyWith(color: Colors.black54),
        ),
        filledButtonTheme: FilledButtonThemeData(
          style: FilledButton.styleFrom(
            backgroundColor: Colors.black,
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
            backgroundColor: Colors.white,
            side: const BorderSide(color: Colors.black),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            foregroundColor: Colors.black,
          ),
        ),
        useMaterial3: true,
      ),
      home: const LoyaltyCardScreen(),
      routes: {
        'LocationScreen': (context) => const LocationScreen(),
        'LoginScreen': (context) => const LoginScreen(),
        'LoyaltyCardScreen': (context) => const LoyaltyCardScreen(),
        'MenuScreen': (context) =>  MenuScreen(),
        'EarnedCouponScreen': (context) =>  EarnedCouponScreen(),
      }
    );
  }
}
