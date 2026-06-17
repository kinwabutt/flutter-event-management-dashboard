import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../dashboard/data/dashboard_model.dart';

class EventDetailScreen extends StatelessWidget {
  final EventModel event;

  const EventDetailScreen({super.key, required this.event});

  @override
  Widget build(BuildContext context) {
    final formatter = NumberFormat.currency(locale: 'en_IN', symbol: '₹', decimalDigits: 0);

    final List<Map<String, dynamic>> mockVendors = [
      {'name': 'Srinivas Kirana Store', 'status': 'Fully Paid', 'amount': 45000.0, 'isPaid': true},
      {'name': 'Balaji Wholesale Fruits', 'status': 'Partial Payment', 'amount': 35000.0, 'isPaid': false},
      {'name': 'Sriram Logistics & Tents', 'status': 'Fully Paid', 'amount': 60000.0, 'isPaid': true},
      {'name': 'Gayatri Decors', 'status': 'Pending Verification', 'amount': 20000.0, 'isPaid': false},
    ];

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: const Color(0xFFF8FAFC),
        appBar: AppBar(
          title: Text(event.title, style: const TextStyle(color: Color(0xFF0F172A), fontWeight: FontWeight.bold, fontSize: 18)),
          backgroundColor: Colors.white,
          elevation: 0,
          iconTheme: const IconThemeData(color: Colors.black),
          bottom: const TabBar(
            indicatorColor: Color(0xFF2563EB),
            labelColor: Color(0xFF2563EB),
            unselectedLabelColor: Colors.grey,
            labelStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
            tabs: [Tab(text: 'Vendors Details'), Tab(text: 'Analytics & Logs')],
          ),
        ),
        body: TabBarView(
          children: [
            SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // PREMIUM HEADER CARD
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(gradient: const LinearGradient(colors: [Color(0xFF1E293B), Color(0xFF0F172A)]), borderRadius: BorderRadius.circular(24)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                          Text(event.date, style: const TextStyle(color: Colors.white60, fontSize: 12)),
                          Container(padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4), decoration: BoxDecoration(color: Colors.white24, borderRadius: BorderRadius.circular(10)), child: Text('${event.vendors} Active', style: const TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold))),
                        ]),
                        const SizedBox(height: 12),
                        const Text('Collection Overview', style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
                        const SizedBox(height: 20),
                        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                          _buildHeaderStat('Total Collected', formatter.format(event.collectedAmount), const Color(0xFF4ADE80)),
                          _buildHeaderStat('Total Outstanding', formatter.format(event.pendingAmount), const Color(0xFFF87171)),
                        ])
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),
                  // SEARCH BAR
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 14),
                    decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16), border: Border.all(color: Colors.grey.withOpacity(0.15))),
                    child: const TextField(decoration: InputDecoration(icon: Icon(Icons.search, color: Colors.grey), hintText: 'Search vendors...', hintStyle: TextStyle(fontSize: 13, color: Colors.grey), border: InputBorder.none)),
                  ),
                  const SizedBox(height: 24),
                  const Text('REGISTERED VENDORS LIST', style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: Colors.grey)),
                  const SizedBox(height: 12),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: mockVendors.length,
                    itemBuilder: (context, index) {
                      final vendor = mockVendors[index];
                      return Container(
                        margin: const EdgeInsets.only(bottom: 12),
                        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16), border: Border.all(color: Colors.grey.withOpacity(0.12))),
                        child: ListTile(
                          leading: CircleAvatar(backgroundColor: vendor['isPaid'] ? const Color(0xFFDCFCE7) : const Color(0xFFFEF2F2), child: Icon(vendor['isPaid'] ? Icons.check_circle_outline_rounded : Icons.hourglass_empty_rounded, color: vendor['isPaid'] ? const Color(0xFF16A34A) : const Color(0xFFDC2626), size: 20)),
                          title: Text(vendor['name'], style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
                          subtitle: Text(vendor['status'], style: TextStyle(fontSize: 11, color: vendor['isPaid'] ? Colors.green : Colors.orange)),
                          trailing: Row(mainAxisSize: MainAxisSize.min, children: [
                            Text(formatter.format(vendor['amount']), style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
                            const Icon(Icons.chevron_right, size: 18, color: Colors.grey),
                          ]),
                        ),
                      );
                    },
                  )
                ],
              ),
            ),
            // TAB 2: Clean Empty State
            const Center(child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [Icon(Icons.analytics_outlined, size: 48, color: Colors.grey), SizedBox(height: 10), Text("No logs available yet", style: TextStyle(color: Colors.grey))])),
          ],
        ),
      ),
    );
  }

  Widget _buildHeaderStat(String title, String value, Color color) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text(title, style: const TextStyle(color: Colors.white60, fontSize: 11)), const SizedBox(height: 4), Text(value, style: TextStyle(color: color, fontSize: 18, fontWeight: FontWeight.bold))]);
  }
}