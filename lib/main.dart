import 'package:flutter/material.dart';
import 'package:passwordless/screens/email_otp_screen.dart';
import 'package:passwordless/secrets.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: supabaseUrl,
    anonKey: supabaseAnonKey,
  );
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Passwordless'),
        ),
        body: Center(
          child: Column(
            children: [
              SignInOptionButton(
                label: 'Sign in with OTP (email)',
                screen: EmailOtpScreen(),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class SignInOptionButton extends StatelessWidget {
  const SignInOptionButton({
    super.key,
    required this.label,
    required this.screen,
  });

  final String label;
  final Widget screen;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: OutlinedButton(
        onPressed: () {
          final route = MaterialPageRoute(builder: (context) => screen);
          Navigator.push(context, route);
        },
        child: Text(label),
      ),
    );
  }
}
