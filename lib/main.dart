import 'package:flutter/material.dart';

void main() {
  runApp(const HabitTrackerApp());
}

class HabitTrackerApp extends StatelessWidget {
  const HabitTrackerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Habit Tracker',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Habit Tracker'),
        ),
        body: const Center(
          child: Text(
            'Welcome Back!',
          ),
        ),
      ),
    );
  }
}