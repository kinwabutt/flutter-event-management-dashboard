import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart'; // Isko import karein
import '../../features/dashboard/presentation/dashboard_screen.dart';
import '../../features/event_detail/presentation/event_detail_screen.dart';
import '../../features/dashboard/data/dashboard_model.dart';

// Yeh line build_runner ke liye zaroori hai
part 'app_router.g.dart';

@riverpod
GoRouter appRouter(AppRouterRef ref) {
  return GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) =>  DashboardScreen(),
      ),
      GoRoute(
        path: '/event-detail',
        builder: (context, state) {
          final event = state.extra as EventModel;
          return EventDetailScreen(event: event);
        },
      ),
    ],
  );
}