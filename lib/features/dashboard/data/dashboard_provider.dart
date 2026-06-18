import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart'; // Ye optional hai agar sirf @riverpod use kar rahe hain
import 'dashboard_model.dart';
import 'dashboard_repository.dart';

part 'dashboard_provider.g.dart'; // Yeh generated file ke liye zaroori hai

// Page Indicator State
final currentPageProvider = StateProvider<int>((ref) => 0);

/// 1. Repository Provider
@riverpod
DashboardRepository dashboardRepository(DashboardRepositoryRef ref) {
  return DashboardRepository(Dio());
}
@Riverpod(keepAlive: true) 
Future<List<EventModel>> fetchEvents(FetchEventsRef ref) async {
  final repo = ref.watch(dashboardRepositoryProvider);
  return await repo.fetchActiveEvents();
}