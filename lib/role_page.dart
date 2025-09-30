import 'package:flutter/material.dart';

class RolePage extends StatelessWidget {
  const RolePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(
        0xFFF7F7FF,
      ), // light gradient-like background
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 40),
            // Top Icon
            CircleAvatar(
              radius: 28,
              backgroundColor: Colors.black.withOpacity(0.05),
              child: const Icon(
                Icons.card_travel_rounded,
                size: 28,
                color: Colors.black,
              ),
            ),

            const Spacer(),

            // Main Text
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                children: [
                  Text(
                    "Connect,\nCollaborate, & Grow",
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontFamily: "Poppins",
                      fontSize: 26,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                      height: 1.3,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    "Join a network of innovators and investors\nshaping the future of business.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: "Poppins",
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      color: Colors.black.withOpacity(0.6),
                      height: 1.4,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 40),

            // Buttons
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                children: [
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF0011FF), // strong blue
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        textStyle: const TextStyle(
                          fontFamily: "Poppins",
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      onPressed: () {},
                      child: const Text("I’m an Entrepreneur"),
                    ),
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFE9ECFF),
                        foregroundColor: const Color(0xFF0011FF),
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        textStyle: const TextStyle(
                          fontFamily: "Poppins",
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      onPressed: () {},
                      child: const Text("I’m an Investor"),
                    ),
                  ),
                ],
              ),
            ),

            const Spacer(),

            // Footer text
            Padding(
              padding: const EdgeInsets.only(bottom: 24.0),
              child: Text.rich(
                TextSpan(
                  text: "By continuing, you agree to our ",
                  style: TextStyle(
                    fontFamily: "Poppins",
                    fontSize: 13,
                    color: Colors.black.withOpacity(0.6),
                  ),
                  children: const [
                    TextSpan(
                      text: "Terms of Service",
                      style: TextStyle(
                        color: Color(0xFF0011FF),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    TextSpan(text: " and "),
                    TextSpan(
                      text: "Privacy Policy",
                      style: TextStyle(
                        color: Color(0xFF0011FF),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    TextSpan(text: "."),
                  ],
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
