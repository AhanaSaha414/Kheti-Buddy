import 'package:flutter/material.dart';
import 'signup_screen.dart'; // Import the signup screen

void main() {
  runApp(const MyApp()); // Use const here since MyApp is stateless
}

class MyApp extends StatelessWidget {
  const MyApp({super.key}); // ✅ Fixed: Used super parameter for key

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Kheti-Buddy",
      theme: ThemeData(primarySwatch: Colors.green),
      home: const SignUpScreen(), // ✅ Ensure SignUpScreen is also const
    );
  }
}
