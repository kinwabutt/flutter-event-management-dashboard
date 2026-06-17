import 'package:dio/dio.dart';
import 'dashboard_model.dart';

class DashboardRepository {
  final Dio _dio; // Yahan se '= Dio()' hata diya hai

  DashboardRepository(this._dio);

  Future<List<EventModel>> fetchActiveEvents() async {
    try {
      // API call ka delay simulate karne ke liye
      await Future.delayed(const Duration(seconds: 1));

      // Exact data as per your assignment screenshot
      return [
        const EventModel(
          id: '1',
          title: 'Janapriya Community',
          date: '18 Jun 2026',
          vendors: 82,
          collectedAmount: 485000.0, 
          pendingAmount: 120000.0,   
        ),
        const EventModel(
          id: '2',
          title: 'My Home Magia',
          date: '20 Jul 2026',
          vendors: 48,
          collectedAmount: 220000.0, 
          pendingAmount: 40000.0,   
        ),
        const EventModel(
          id: '3',
          title: 'Kolanu Garden',
          date: '10 Aug 2026',
          vendors: 61, //
          collectedAmount: 310000.0, 
          pendingAmount: 50.0, 
        ),
      ];
    } catch (e) {
      throw Exception('Failed to fetch events: $e');
    }
  }
}