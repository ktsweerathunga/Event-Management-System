import 'package:event_management_system/services/auth.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: Column(
          children: [
            Image.asset('assets/images/onboarding.png',
            // fit: BoxFit.cover,
            ),
            SizedBox(height: 12),
            Text("Welcome to Event Management System",
              style: TextStyle(
                color: Colors.black,
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text("Let's see your events",
              style: TextStyle(
                color: const Color.fromARGB(255, 98, 12, 210),
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 30),
            Text("Discover and manage events effortlessly",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black54,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 45),
            GestureDetector(
              onTap: () {
                // Call the sign-in method from AuthMethods
                AuthMethods().SignInWithGoogle(context);
                // AuthMethods().SignInWithGoogle(context);
              },
              child: Container(
                height: 60,
                margin: EdgeInsets.only(left: 32, right: 32),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 98, 12, 210),
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('assets/images/google.png',
                      height: 30,
                      width: 30,
                      fit: BoxFit.cover,
                    ),
                    SizedBox(width: 10),
                    Text("Sign up with Google",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}