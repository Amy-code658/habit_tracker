import 'package:flutter/material.dart';

void main() {
  runApp(const HabitTrackerApp());
}

class HabitTrackerApp extends StatefulWidget{
  const HabitTrackerApp({super.key});
  @override
  State<HabitTrackerApp> createState()=>_HabitTrackerAppState();
}
class _HabitTrackerAppState extends State<HabitTrackerApp> {
  List<Map<String, dynamic>> habits = [
  {
    'title': 'Read 20 Pages',
    'completed': false,
    'icon': Icons.menu_book,
  },
  {
    'title': 'Drink Water',
    'completed': false,
    'icon': Icons.water_drop,
  },
  {
    'title': 'Exercise',
    'completed': false,
    'icon': Icons.fitness_center,
  },
  {
  'title': 'Meditate',
  'completed': false,
  'icon': Icons.self_improvement,
}
];

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Habit Tracker',
      debugShowCheckedModeBanner:false,
      home: Scaffold(
  backgroundColor: const Color(0xFFF5F5F5),

  body: Padding(
    padding: const EdgeInsets.all(24),

    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,

      children: [

        const SizedBox(height: 20),

        const Text(
          'Habit Tracker',
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
          ),
        ),

        const SizedBox(height: 12),

        const Text(
          'Welcome Back!',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w600,
          ),
        ),

        const SizedBox(height: 20),

        const Text(
          'Start building better habits today.',
          style: TextStyle(
            fontSize: 16,
            color: Colors.blue,
          ),
        ),
        const SizedBox(height:30),
       ...habits.asMap().entries.map((entry) {
  int index = entry.key;
  Map<String, dynamic> habit = entry.value;

  return Padding(
    padding: const EdgeInsets.only(bottom: 16),

    child: Container(
      padding: const EdgeInsets.all(16),

      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
          BoxShadow(
            blurRadius: 10,
            offset: Offset(0, 4),
            color: Colors.black12,
          ),
        ],
      ),

      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,

        children: [

          Row(
            children: [

              Icon(
                habit['icon'],
                size: 28,
              ),

              const SizedBox(width: 12),

              Text(
                habit['title'],
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),

          Checkbox(
            value: habit['completed'],

            onChanged: (value) {
              setState(() {
                habits[index]['completed'] = value!;
              });
            },
          ),
        ],
      ),
    ),
  );
}),
      ],
    ),
  ),
),
    );
    }
}