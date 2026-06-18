import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:go_router/go_router.dart';
import 'package:vixact_assessment/features/dashboard/data/dashboard_model.dart';

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
    
    final List<Gradient> cardGradients = [
      const LinearGradient(colors: [Color(0xFFE0F2FE), Color(0xFFF1F5F9)], begin: Alignment.topLeft, end: Alignment.bottomRight),
      const LinearGradient(colors: [Color(0xFFF3E8FF), Color(0xFFF1F5F9)], begin: Alignment.topLeft, end: Alignment.bottomRight),
      const LinearGradient(colors: [Color(0xFFFFEDD5), Color(0xFFF1F5F9)], begin: Alignment.topLeft, end: Alignment.bottomRight),
    ];

    final List<Color> bgColors = [const Color(0xFF2563EB), const Color(0xFF7C3AED), const Color(0xFFEA580C)];
    final List<IconData> icons = [Icons.calendar_month_rounded, Icons.edit_calendar_rounded, Icons.date_range_rounded];
    
    return GestureDetector(
      onTap: () => context.push('/event-detail', extra: event),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          gradient: cardGradients[index % cardGradients.length],
          borderRadius: BorderRadius.circular(24), 
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(padding: const EdgeInsets.all(8), decoration: BoxDecoration(color: bgColors[index % bgColors.length], shape: BoxShape.circle), child: Icon(icons[index % icons.length], size: 20, color: Colors.white)),
                const Icon(Icons.chevron_right_rounded, color: Colors.black45),
              ],
            ),
            const SizedBox(height: 12),
            Text(event.title, maxLines: 1, overflow: TextOverflow.ellipsis, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Color(0xFF0F172A))),
            const SizedBox(height: 4),
            Row(children: [Icon(Icons.calendar_today_outlined, size: 12, color: Colors.grey.shade600), const SizedBox(width: 4), Text(event.date, style: TextStyle(color: Colors.grey.shade600, fontSize: 11))]),
            const SizedBox(height: 8),
            Container(padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4), decoration: BoxDecoration(color: Colors.white.withOpacity(0.5), borderRadius: BorderRadius.circular(8)), child: Text('${event.vendors} Vendors', style: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold))),
            const SizedBox(height: 35),
            Row(
              children: [
               
                Expanded(child: _buildAmountInfo('Collected', currencyFormatter.format(event.collectedAmount), const Color(0xFF059669))),
                const SizedBox(width: 8),
                Expanded(child: _buildAmountInfo('Pending', currencyFormatter.format(event.pendingAmount), const Color(0xFFDC2626))),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _buildAmountInfo(String label, String value, Color color) {
    return Container(
      // Waisa hi white background jaisa Vendors tag ka hai
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.5), // Hlka white background
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start, 
        children: [
          Text(label, style: const TextStyle(color: Colors.black45, fontSize: 8)),
          FittedBox(
            child: Text(
              value, 
              style: TextStyle(color: color, fontWeight: FontWeight.bold, fontSize: 12)
            ),
          ),
        ],
      ),
    );
  }
  }