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
  bool readCompleted=false;
  bool waterCompleted=false;
  bool exerciseCompleted=false;
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
        Container(
          padding:const EdgeInsets.all(16),
          decoration:BoxDecoration(
            color:Colors.white,
            borderRadius:BorderRadius.circular(20),
            boxShadow:[
              BoxShadow(
                blurRadius:10,
                offset:Offset(0,4),
                color:Colors.black12,
              ),
            ],
          ),
          child:Row(
            mainAxisAlignment:MainAxisAlignment.spaceBetween,
            children:[
              Row(
                children:const[
                  Icon(
                    Icons.menu_book,
                    size:28,
                  ),
                  SizedBox(width: 12),
                  Text(
                    "Read 20 pages",
                    style:TextStyle(
                      fontSize:18,
                      fontWeight:FontWeight.w500,
                    ),
                  ),
                ],
              ),
              Checkbox(
                value: readCompleted,
                onChanged: ( value) {
                  setState(() {
                    readCompleted = value!;
                  });
                },
              ),
            ],
          ),
        ),
const SizedBox(height:20),
Container(
          padding:const EdgeInsets.all(16),
          decoration:BoxDecoration(
            color:Colors.white,
            borderRadius:BorderRadius.circular(20),
            boxShadow:[
              BoxShadow(
                blurRadius:10,
                offset:Offset(0,4),
                color:Colors.black12,
              ),
            ],
          ),
          child:Row(
            mainAxisAlignment:MainAxisAlignment.spaceBetween,
            children:[
              Row(
                children:const[
                  Icon(
                    Icons.water_drop,
                    size:28,
                  ),
                  SizedBox(width: 12),
                  Text(
                    "Drink water",
                    style:TextStyle(
                      fontSize:18,
                      fontWeight:FontWeight.w500,
                    ),
                  ),
                ],
              ),
              Checkbox(
                value: waterCompleted,
                onChanged: (value) {
                  setState(() {
                    waterCompleted = value!;
                  });
                },
              ),
            ],
          ),
        ),
        const SizedBox(height:20),
        Container(
          padding:const EdgeInsets.all(16),
          decoration:BoxDecoration(
            color:Colors.white,
            borderRadius:BorderRadius.circular(20),
            boxShadow:[
              BoxShadow(
                blurRadius:10,
                offset:Offset(0,4),
                color:Colors.black12,
              ),
            ],
          ),
          child:Row(
            mainAxisAlignment:MainAxisAlignment.spaceBetween,
            children:[
              Row(
                children:const[
                  Icon(
                    Icons.fitness_center,
                    size:28,
                  ),
                  SizedBox(width: 12),
                  Text(
                    "Exercise",
                    style:TextStyle(
                      fontSize:18,
                      fontWeight:FontWeight.w500,
                    ),
                  ),
                ],
              ),
              Checkbox(
                value: exerciseCompleted,
                onChanged: ( value) {
                  setState(() {
                    exerciseCompleted = value!;
                  });
                },
              ),
            ],
          ),
        ),
      ],
    ),
  ),
),
    );
    }
}