import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import '../data/dashboard_provider.dart';
import 'widgets/event_card.dart';
import 'widgets/summary_card.dart';
import 'widgets/quick_action_card.dart';
final currentPageProvider = StateProvider<int>((ref) => 0);
final bottomNavIndexProvider = StateProvider<int>((ref) => 0);

class DashboardScreen extends ConsumerWidget {
   DashboardScreen({super.key});

  final NumberFormat _currencyFormatter = NumberFormat.currency(locale: 'en_IN', symbol: '₹', decimalDigits: 0);
// final
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activeEventsAsync = ref.watch(fetchEventsProvider);
    final currentPage = ref.watch(currentPageProvider);
    final bottomNavIndex = ref.watch(bottomNavIndexProvider);
    final PageController _pageController = PageController(viewportFraction: 0.85);
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        toolbarHeight: 95,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Welcome Back 👋', style: TextStyle(color: Colors.grey, fontSize: 13)),
            const Text('Sai Teja', style: TextStyle(color: Colors.black, fontSize: 24, fontWeight: FontWeight.bold)),
            Text('Manage your events and collections', style: TextStyle(color: Colors.grey[400], fontSize: 11)),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20.0, top: 15.0),
            child: Badge(
              label: const Text('3', style: TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold)),
              backgroundColor: const Color.fromRGBO(244, 67, 54, 1),
              child: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(color: Colors.white, shape: BoxShape.circle, boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10, offset: const Offset(0, 4))]),
                child: const Icon(Icons.notifications_none, color: Colors.black, size: 24),
              ),
            ),
          ),
        ],
      ),
      body: activeEventsAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, _) => Center(child: Text('Error: $err')),
        data: (events) {
          int totalVendors = events.fold(0, (sum, i) => sum + i.vendors);
          double totalCollected = events.fold(0.0, (sum, i) => sum + i.collectedAmount);
          double totalOutstanding = events.fold(0.0, (sum, i) => sum + i.pendingAmount);

          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('ACTIVE EVENTS', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 11, color: Colors.black)),
TextButton(
  onPressed: () {
   
    context.push('/events', extra: events); 
  }, 
  style: TextButton.styleFrom(
    padding: EdgeInsets.zero, 
    minimumSize: Size.zero, 
    tapTargetSize: MaterialTapTargetSize.shrinkWrap
  ), 
  child: const Text('View All >', style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold, fontSize: 11))
),
                    ],
                  ),
                ),
                const SizedBox(height: 12),
                SizedBox(
  height: 250,
  child: PageView.builder(
    padEnds: false,
    controller: PageController(viewportFraction: 0.70), // Cards ko compact aur "snapped" dikhane ke liye
    itemCount: events.length,
    onPageChanged: (i) => ref.read(currentPageProvider.notifier).state = i, // Dots animation ke liye ye zaroori hai
    itemBuilder: (context, i) => Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8), // Card ke darmiyan gap
      child: EventCard(event: events[i], index: i),
    ),
  ),
),
                const SizedBox(height: 12),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: List.generate(events.length, (i) => AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  margin: const EdgeInsets.symmetric(horizontal: 3),
                  width: currentPage == i ? 16 : 6, height: 6,
                  decoration: BoxDecoration(color: currentPage == i ? const Color(0xFF2563EB) : Colors.grey[300], borderRadius: BorderRadius.circular(10)),
                ))),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Row(children: [
                        Expanded(child: SummaryCard(title: 'Total Vendors', value: '$totalVendors', icon: Icons.people_outline, bgIcon: const Color(0xFFEFF6FF), iconColor: Colors.blue)),
                        const SizedBox(width: 12),
                        Expanded(child: SummaryCard(title: 'Collected', value: _currencyFormatter.format(totalCollected), icon: Icons.trending_up, bgIcon: const Color(0xFFF0FDF4), iconColor: Colors.green)),
                        const SizedBox(width: 12),
                        Expanded(child: SummaryCard(title: 'Outstanding', value: _currencyFormatter.format(totalOutstanding), icon: Icons.trending_down, bgIcon: const Color(0xFFFEF2F2), iconColor: Colors.red)),
                      ]),
                      const SizedBox(height: 24),
                      const Align(alignment: Alignment.centerLeft, child: Text('QUICK ACTIONS', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 11))),
                      const SizedBox(height: 12),
                      GridView.count(shrinkWrap: true, physics: const NeverScrollableScrollPhysics(), crossAxisCount: 2, childAspectRatio: 3.5, mainAxisSpacing: 12, crossAxisSpacing: 12, children: const [
                        QuickActionCard(title: 'Add Vendor', icon: Icons.person_add, color: Color(0xFF2563EB)),
                        QuickActionCard(title: 'Record Payment', icon: Icons.wallet, color: Color(0xFF2563EB)),
                        QuickActionCard(title: 'Reports', icon: Icons.bar_chart, color: Color(0xFF2563EB)),
                        QuickActionCard(title: 'Categories', icon: Icons.grid_view, color: Color(0xFF2563EB)),
                      ]),
                      const SizedBox(height: 24),
                      const Align(alignment: Alignment.centerLeft, child: Text('RECENT ACTIVITY', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 11))),
                      const SizedBox(height: 12),
                      _buildRecentActivityList(),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
  type: BottomNavigationBarType.fixed,
  selectedItemColor: const Color(0xFF2563EB),
  unselectedItemColor: Colors.grey,
  currentIndex: bottomNavIndex,

  onTap: (i) {
    ref.read(bottomNavIndexProvider.notifier).state = i;
    if (i == 1) {
      context.push('/events'); 
    } else {

      ref.read(bottomNavIndexProvider.notifier).state = i;
    }
  },
  items: const [
    BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: 'Home'),
    BottomNavigationBarItem(icon: Icon(Icons.calendar_today_outlined), label: 'Events'),
    BottomNavigationBarItem(icon: Icon(Icons.bar_chart_outlined), label: 'Reports'),
    BottomNavigationBarItem(icon: Icon(Icons.settings_outlined), label: 'Settings'),
  ],
),
);
}

  Widget _buildRecentActivityList() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20)),
      child: Column(
        children: [
          _activityItem('Payment received from ABC Foods', '10:30 AM', Icons.arrow_downward, Colors.green),
          const Padding(padding: EdgeInsets.symmetric(vertical: 8), child: Divider()),
          _activityItem('New vendor added', 'Yesterday', Icons.person_add, Colors.blue),
          const Padding(padding: EdgeInsets.symmetric(vertical: 8), child: Divider()),
          _activityItem('Event updated', '2 days ago', Icons.edit_calendar, Colors.orange),
        ],
      ),
    );
  }

  Widget _activityItem(String title, String time, IconData icon, Color color) {
    return Row(children: [CircleAvatar(radius: 15, backgroundColor: color.withOpacity(0.1), child: Icon(icon, size: 15, color: color)), const SizedBox(width: 10), Expanded(child: Text(title, style: const TextStyle(fontSize: 12))), Text(time, style: const TextStyle(fontSize: 10, color: Colors.grey))]);
  }
}