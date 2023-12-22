import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({super.key, required this.user});

  final User user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            const Text('You are now logged in!'),
            Text('Email: ${user.email ?? '--'}'),
          ],
        ),
      ),
    );
  }
}
