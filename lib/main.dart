import 'package:flutter/material.dart';
import 'widgets/habit_card.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

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
      'streak':0,
    },
    {
      'title': 'Drink Water',
      'completed': false,
      'icon': Icons.water_drop,
      'streak':0,
    },
    {
      'title': 'Exercise',
      'completed': false,
      'icon': Icons.fitness_center,
      'streak':0,
    },
    {
      'title': 'Meditate',
      'completed': false,
      'icon': Icons.self_improvement,
      'streak':0,
    },
  ]; 
  @override
void initState() {
  super.initState();
  loadHabits();
}

Future<void> saveHabits() async {
  final prefs = await SharedPreferences.getInstance();

  String encodedData = jsonEncode(
    habits.map((habit) => {
      'title': habit['title'],
      'completed': habit['completed'],
      'streak': habit['streak'],
    }).toList(),
  );

  await prefs.setString(
    'habits',
    encodedData,
  );
}

Future<void> loadHabits() async {
  final prefs = await SharedPreferences.getInstance();

  String? savedData =
      prefs.getString('habits');

  if (savedData != null) {
    List decoded =
        jsonDecode(savedData);

    setState(() {
      habits = decoded.map((habit) {
        return {
          'title': habit['title'],
          'completed': habit['completed'],
          'icon': Icons.task_alt,
          'streak': habit['streak'],
        };
      }).toList();
    });
  }
}
  final TextEditingController habitController = TextEditingController();

void showDeleteDialog(int index) {
  showDialog(
    context: context,

    builder: (context) {
      return AlertDialog(
        title: const Text('Delete Habit'),

        content: Text(
          'Are you sure you want to delete "${habits[index]['title']}"?',
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

              setState(() {
  habits.removeAt(index);
});

saveHabits();

              Navigator.pop(context);
            },

            child: const Text('Delete'),
          ),
        ],
      );
    },
  );
}
  void showAddHabitDialog() {
    showDialog(
      context: context,
      builder: (context) {
       return AlertDialog(
  title: Text(
    '✨ Add New Habit',
    style: TextStyle(
      color: primaryPurple,
      fontWeight: FontWeight.bold,
    ),
  ),

  content: TextField(
    controller: habitController,
    decoration: InputDecoration(
      hintText: 'Enter habit name',
      filled: true,
      fillColor: lightPurple,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide.none,
      ),
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
              'streak': 0,
            });
          });
saveHabits();
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
Container(
  width: double.infinity,

  padding: const EdgeInsets.all(20),

  decoration: BoxDecoration(
    color: Colors.white,

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
        '✨ Daily Motivation',
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: primaryPurple,
        ),
      ),

      const SizedBox(height: 10),

      const Text(
        'Success is the sum of small efforts repeated day after day.',
        style: TextStyle(
          fontSize: 15,
          height: 1.5,
        ),
      ),
    ],
  ),
),

const SizedBox(height: 25),
              
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

              habits.isEmpty

? Center(
    child: Padding(
      padding: const EdgeInsets.only(top: 40),

      child: Column(
        children: [

          Icon(
            Icons.self_improvement,
            size: 70,
            color: softPurple,
          ),

          const SizedBox(height: 15),

          Text(
            'No habits yet',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: primaryPurple,
            ),
          ),

          const SizedBox(height: 8),

          Text(
            'Tap + to create your first habit.',
            style: TextStyle(
              color: softPurple,
            ),
          ),
        ],
      ),
    ),
  )

: Column(
    children: habits.asMap().entries.map((entry) {

      int index = entry.key;
      Map<String, dynamic> habit = entry.value;

      return Padding(
        padding: const EdgeInsets.only(bottom: 16),

        child: HabitCard(
          title: habit['title'],
          icon: habit['icon'] ?? Icons.task_alt,
          completed: habit['completed'],
          streak: habit['streak'],

          onChanged: (value) {
            setState(() {
              habits[index]['completed'] = value!;

if (value == true) {
  habits[index]['streak']++;
}});
            saveHabits();
          },

          onDelete: () {
            showDeleteDialog(index);
          },
        ),
      );
    }).toList(),
  ),

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