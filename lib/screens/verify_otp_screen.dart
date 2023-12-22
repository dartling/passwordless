import 'package:flutter/material.dart';
import 'package:passwordless/screens/success_screen.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class VerifyOtpScreen extends StatelessWidget {
  VerifyOtpScreen({super.key, required this.email});

  final String email;
  final _otpController = TextEditingController();

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
                controller: _otpController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter the 6-digit code',
                ),
              ),
            ),
            OutlinedButton(
              onPressed: () async {
                final navigator = Navigator.of(context);
                final scaffoldMessenger = ScaffoldMessenger.of(context);
                try {
                  final response =
                      await Supabase.instance.client.auth.verifyOTP(
                    email: email,
                    token: _otpController.text,
                    type: OtpType.email,
                  );
                  final route = MaterialPageRoute(
                      builder: (_) => SuccessScreen(user: response.user!));
                  navigator.pushReplacement(route);
                } catch (err) {
                  scaffoldMessenger.showSnackBar(
                      const SnackBar(content: Text('Something went wrong')));
                }
              },
              child: const Text('Verify OTP'),
            )
          ],
        ),
      ),
    );
  }
}
