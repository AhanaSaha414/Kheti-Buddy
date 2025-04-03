import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});
  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  bool _agreeToTerms = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 50),
                const Text(
                  "Create Account",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 5),
                const Text(
                  "Create your account to enhance your farming experience",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 14, color: Colors.grey),
                ),
                const SizedBox(height: 20),

                // Form Fields
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      // Email Field
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: "Your email address",
                          prefixIcon: Icon(Icons.email),
                          border: OutlineInputBorder(),
                        ),
                        keyboardType: TextInputType.emailAddress,
                        validator:
                            (value) =>
                                value!.isEmpty ? "Enter your email" : null,
                      ),
                      const SizedBox(height: 10),

                      // Password Field
                      TextFormField(
                        obscureText: true,
                        decoration: InputDecoration(
                          labelText: "Enter your password",
                          prefixIcon: Icon(Icons.lock),
                          border: OutlineInputBorder(),
                        ),
                        validator:
                            (value) =>
                                value!.length < 6 ? "Password too short" : null,
                      ),
                      const SizedBox(height: 10),

                      // Phone Number Field
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: "Your phone number",
                          prefixIcon: Icon(Icons.phone),
                          border: OutlineInputBorder(),
                        ),
                        keyboardType: TextInputType.phone,
                      ),
                      const SizedBox(height: 10),

                      // Terms & Conditions Checkbox
                      Row(
                        children: [
                          Checkbox(
                            value: _agreeToTerms,
                            onChanged: (value) {
                              setState(() {
                                _agreeToTerms = value!;
                              });
                            },
                          ),
                          const Text("I agree with Terms & Conditions"),
                        ],
                      ),
                      const SizedBox(height: 10),

                      // Sign Up Button
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate() &&
                                _agreeToTerms) {
                              // Handle sign-up logic
                              ("User Signed Up");
                            } else {
                              ("Please accept Terms & Conditions");
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(vertical: 12),
                          ),
                          child: const Text("Sign Up"),
                        ),
                      ),
                      const SizedBox(height: 10),

                      // OR Divider
                      Row(
                        children: const [
                          Expanded(child: Divider()),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            child: Text("Or"),
                          ),
                          Expanded(child: Divider()),
                        ],
                      ),
                      const SizedBox(height: 10),

                      // Social Sign-In Buttons
                      _buildSocialButton(
                        "Continue with Google",
                        "assets/google.png",
                        Colors.red,
                      ),
                      const SizedBox(height: 10),
                      _buildSocialButton(
                        "Continue with Facebook",
                        "assets/facebook.png",
                        Colors.blue,
                      ),
                    ],
                  ),
                ),

                // Login Option
                const SizedBox(height: 20),
                GestureDetector(
                  onTap: () {
                    ("Navigate to Login");
                  },
                  child: const Text(
                    "Already registered? Log In",
                    style: TextStyle(color: Colors.blue),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Social Login Button Widget
  Widget _buildSocialButton(String text, String iconPath, Color color) {
    return SizedBox(
      width: double.infinity,
      child: OutlinedButton.icon(
        onPressed: () {
          ("$text pressed");
        },
        icon: Image.asset(iconPath, width: 20),
        label: Text(text),
        style: OutlinedButton.styleFrom(
          foregroundColor: color,
          padding: const EdgeInsets.symmetric(vertical: 12),
        ),
      ),
    );
  }
}
