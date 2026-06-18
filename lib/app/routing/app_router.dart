import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../features/dashboard/presentation/dashboard_screen.dart';
import '../../features/event_detail/presentation/event_detail_screen.dart';
// 1. Nayi screen ka import add karein:
import '../../features/event_detail/presentation/event_list_screen.dart';
import '../../features/dashboard/data/dashboard_model.dart';

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
      // 2. Naya route yahan add karein:
      GoRoute(
        path: '/events',
        builder: (context, state) => const EventListScreen(),
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