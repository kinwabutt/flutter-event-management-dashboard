import 'package:flutter/material.dart';

class QuickActionCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color color;

  const QuickActionCard({
    super.key,
    required this.title,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.withOpacity(0.12)),
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 13, 
            backgroundColor: color, 
            child: Icon(icon, color: Colors.white, size: 12)
          ),
          const SizedBox(width: 6),
          // Yahan updated code hai:
          Expanded(
            child: FittedBox(
              fit: BoxFit.scaleDown, 
              alignment: Alignment.centerLeft,
              child: Text(
                title, 
                style: const TextStyle(
                  fontSize: 11, 
                  fontWeight: FontWeight.w700, 
                  color: Color(0xFF0F172A)
                ),
              ),
            ),
          ),
          const SizedBox(width: 4),
          Icon(Icons.chevron_right_rounded, color: Colors.grey.shade400, size: 14),
        ],
      ),
    );
  }
}