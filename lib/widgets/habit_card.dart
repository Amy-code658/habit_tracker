import 'package:flutter/material.dart';

class HabitCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final bool completed;
  final ValueChanged<bool?> onChanged;
  final VoidCallback onDelete;
  final int streak;

  const HabitCard({
    super.key,
    required this.title,
    required this.icon,
    required this.completed,
    required this.onChanged,
    required this.onDelete,
    required this.streak,
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

              Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [

    Text(
      title,
      style: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w600,
      ),
    ),

    const SizedBox(height: 4),

    Text(
      "🔥 Streak: $streak day${streak == 1 ? "" : "s"}",
      style: TextStyle(
        color: Colors.orange.shade700,
        fontSize: 14,
      ),
    ),
  ],
)
            ],
          ),

          Row(
  children: [

    IconButton(
      onPressed: onDelete,

      icon: const Icon(
        Icons.delete_outline,
        color: Colors.redAccent,
      ),
    ),

    Checkbox(
      value: completed,
      onChanged: onChanged,
    ),
  ],
),
        ],
      ),
    );
  }
}