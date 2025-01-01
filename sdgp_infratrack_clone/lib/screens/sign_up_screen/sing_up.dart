import 'package:flutter/material.dart';
import 'package:infratrack/screens/login_screen/login.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE6F4FF), // Light blue background
      appBar: AppBar(
        backgroundColor: const Color(0xFFE6F4FF),
        elevation: 0, // Remove shadow
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black87),
          onPressed: () {
            Navigator.pop(context); // Go back to the previous screen
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Logo
              Image.asset(
                'assets/png/logo123.png',
                height: 150,
              ),

              // Title
              const Text(
                'Sign Up',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),

              const SizedBox(height: 10),

              // Input Fields
              _buildTextField('Enter Your National Identity Card Number'),
              const SizedBox(height: 15),
              _buildTextField('Enter Your Full Name'),
              const SizedBox(height: 15),
              _buildTextField('Enter Your Email Address'),
              const SizedBox(height: 15),
              _buildTextField('Enter Your Mobile Number'),
              const SizedBox(height: 15),
              const PasswordField(hintText: 'Password'),
              const SizedBox(height: 15),
              const PasswordField(hintText: 'Confirm Password'),
              const SizedBox(height: 15),

              // Sign-Up Button
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    // Navigate to the Login Screen
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LoginScreen(),
                        ));
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black87,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text(
                    'Sign Up',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Function to create a regular text field
  Widget _buildTextField(String hintText) {
    return TextField(
      decoration: InputDecoration(
        hintText: hintText,
        filled: true,
        fillColor: Colors.grey[200],
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}

// Reusable Password Field with Visibility Toggle
class PasswordField extends StatefulWidget {
  final String hintText;

  const PasswordField({super.key, required this.hintText});

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool _isHidden = true;

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: _isHidden,
      decoration: InputDecoration(
        hintText: widget.hintText,
        filled: true,
        fillColor: Colors.grey[200],
        suffixIcon: IconButton(
          icon: Icon(_isHidden ? Icons.visibility_off : Icons.visibility),
          onPressed: () {
            setState(() {
              _isHidden = !_isHidden; // Toggle visibility
            });
          },
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
