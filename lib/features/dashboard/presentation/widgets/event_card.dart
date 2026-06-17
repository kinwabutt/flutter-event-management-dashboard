import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:go_router/go_router.dart';
import 'package:vixact_assessment/features/dashboard/data/dashboard_model.dart';

class EventCard extends StatelessWidget {
  final EventModel event;
  final int index;
  
  const EventCard({super.key, required this.event, required this.index});

  @override
  Widget build(BuildContext context) {
    final currencyFormatter = NumberFormat.currency(locale: 'en_IN', symbol: '₹', decimalDigits: 0);
    
    // Background Glow Gradients
    final List<Gradient> cardGradients = [
      const LinearGradient(colors: [Color(0xFFE0F2FE), Color(0xFFF1F5F9)], begin: Alignment.topLeft, end: Alignment.bottomRight),
      const LinearGradient(colors: [Color(0xFFF3E8FF), Color(0xFFF1F5F9)], begin: Alignment.topLeft, end: Alignment.bottomRight),
      const LinearGradient(colors: [Color(0xFFFFEDD5), Color(0xFFF1F5F9)], begin: Alignment.topLeft, end: Alignment.bottomRight),
    ];
    
    // Vibrant background colors for icons
    final List<Color> bgColors = [const Color(0xFF2563EB), const Color(0xFF7C3AED), const Color(0xFFEA580C)];
    final List<IconData> icons = [Icons.calendar_month_rounded, Icons.edit_calendar_rounded, Icons.date_range_rounded];

    return GestureDetector(
      onTap: () => context.push('/event-detail', extra: event),
      child: Container(
        margin: const EdgeInsets.only(right: 12), 
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          gradient: cardGradients[index % cardGradients.length],
          borderRadius: BorderRadius.circular(24),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Dark Background + White Icon
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: bgColors[index % bgColors.length], // Dark Vibrant BG
                    shape: BoxShape.circle,
                  ),
                  child: Icon(icons[index % icons.length], size: 20, color: Colors.white), // White Icon
                ),
                const Icon(Icons.chevron_right_rounded, color: Colors.black45),
              ],
            ),
            const Spacer(),
            Text(event.title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Color(0xFF0F172A))),
            const SizedBox(height: 4),
            Row(children: [
              Icon(Icons.calendar_today_outlined, size: 12, color: Colors.grey.shade600),
              const SizedBox(width: 4),
              Text(event.date, style: TextStyle(color: Colors.grey.shade600, fontSize: 11)),
            ]),
            const SizedBox(height: 8),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              decoration: BoxDecoration(color: Colors.white.withOpacity(0.5), borderRadius: BorderRadius.circular(8)),
              child: Text('${event.vendors} Vendors', style: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold)),
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [const Text('Collected', style: TextStyle(color: Colors.grey, fontSize: 9)), Text(currencyFormatter.format(event.collectedAmount), style: const TextStyle(color: Color(0xFF059669), fontWeight: FontWeight.bold, fontSize: 12))])),
                Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [const Text('Pending', style: TextStyle(color: Colors.grey, fontSize: 9)), Text(currencyFormatter.format(event.pendingAmount), style: const TextStyle(color: Color(0xFFDC2626), fontWeight: FontWeight.bold, fontSize: 12))])),
              ],
            )
          ],
        ),
      ),
    );
  }
}