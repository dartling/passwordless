import 'package:flutter/material.dart';
import 'package:passwordless/screens/verify_otp_screen.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class EmailOtpScreen extends StatelessWidget {
  EmailOtpScreen({super.key});

  final _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
              child: TextField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter your e-mail',
                ),
              ),
            ),
            OutlinedButton(
              onPressed: () {
                final email = _emailController.text;
                Supabase.instance.client.auth.signInWithOtp(
                  email: email,
                  shouldCreateUser: false,
                );
                final route = MaterialPageRoute(
                  builder: (context) => VerifyOtpScreen(email: email),
                );
                Navigator.pushReplacement(context, route);
              },
              child: const Text('Get OTP'),
            )
          ],
        ),
      ),
    );
  }
}
