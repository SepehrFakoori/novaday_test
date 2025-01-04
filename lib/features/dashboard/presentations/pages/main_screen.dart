import 'package:flutter/material.dart';
import 'package:novaday_test/features/dashboard/presentations/pages/home_screen.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: HomeScreen(),
    );
  }
}
