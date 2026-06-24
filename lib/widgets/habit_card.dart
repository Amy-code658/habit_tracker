import 'package:flutter/material.dart';

class HabitCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final bool completed;
  final ValueChanged<bool?> onChanged;

  const HabitCard({
    super.key,
    required this.title,
    required this.icon,
    required this.completed,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
                icon,
                size: 32,
              ),

              const SizedBox(width: 12),

              Text(
                title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),

          Checkbox(
            value: completed,
            onChanged: onChanged,
          ),
        ],
      ),
    );
  }
}