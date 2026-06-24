import 'package:flutter/material.dart';
import 'widgets/habit_card.dart';

void main() {
  runApp(const HabitTrackerApp());
}

class HabitTrackerApp extends StatelessWidget {
  const HabitTrackerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
    },
  ];

  final TextEditingController habitController = TextEditingController();

  void showAddHabitDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Add New Habit'),
          content: TextField(
            controller: habitController,
            decoration: const InputDecoration(
              hintText: 'Enter habit name',
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                if (habitController.text.trim().isNotEmpty) {
                  setState(() {
                    habits.add({
                      'title': habitController.text.trim(),
                      'completed': false,
                      'icon': Icons.task_alt,
                    });
                  });

                  habitController.clear();
                }

                Navigator.pop(context);
              },
              child: const Text('Add'),
            ),
          ],
        );
      },
    );
  }
final Color primaryPurple = const Color(0xFF7E57C2);

final Color softPurple = const Color(0xFFB39DDB);

final Color lightPurple = const Color(0xFFEDE7F6);

final Color milkyWhite = const Color(0xFFFAF9FF);
  @override
  Widget build(BuildContext context) {
    int completedHabits = habits
    .where((habit) => habit['completed'] == true)
    .length;

double progress = habits.isEmpty
    ? 0
    : completedHabits / habits.length;
    return Scaffold(
      backgroundColor:milkyWhite,

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              const SizedBox(height: 20),

             Text(
  'Habit Tracker',
  style: TextStyle(
    fontSize: 34,
    fontWeight: FontWeight.bold,
    color: primaryPurple,
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

              Text(
  'Start building better habits today.',
  style: TextStyle(
    fontSize: 16,
    color: softPurple,
  ),
),

              const SizedBox(height: 30),
              Container(
  padding: const EdgeInsets.all(20),

 decoration: BoxDecoration(
  color: lightPurple,

  borderRadius: BorderRadius.circular(24),

  boxShadow: const [
    BoxShadow(
      color: Colors.black12,
      blurRadius: 10,
      offset: Offset(0, 4),
    ),
  ],
),

  child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,

    children: [

      Text(
  '$completedHabits / ${habits.length} Habits Completed',
  style: TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
    color: primaryPurple,
  ),
),

      const SizedBox(height: 15),

      LinearProgressIndicator(
  value: progress,
  minHeight: 10,
  borderRadius: BorderRadius.circular(24),

  valueColor: AlwaysStoppedAnimation(
    primaryPurple,
  ),

  backgroundColor: Colors.white,
),
    ],
  ),
),

const SizedBox(height: 25),

              ...habits.asMap().entries.map((entry) {
                int index = entry.key;
                Map<String, dynamic> habit = entry.value;

                return Padding(
  padding: const EdgeInsets.only(bottom: 16),

  child: HabitCard(
    title: habit['title'],
    icon: habit['icon'],
    completed: habit['completed'],

    onChanged: (value) {
      setState(() {
        habits[index]['completed'] = value!;
      });
    },
  ),

                );
              }),
 ],
 ),
 ),
 ),
 floatingActionButton: FloatingActionButton(
  backgroundColor: primaryPurple,
  elevation: 8,
  onPressed: showAddHabitDialog,
  child: const Icon(
    Icons.add,
    color: Colors.white,
  ),
),
);

  }
}