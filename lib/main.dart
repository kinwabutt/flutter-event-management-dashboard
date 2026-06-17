import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'app/routing/app_router.dart';
import 'app/theme/app_theme.dart';

void main() {
  // ProviderScope zaroori hai Riverpod ke state management ke liye
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(appRouterProvider);

    return MaterialApp.router(
      title: 'Vixact Assessment',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme, // Agar theme file ready hai
      routerConfig: router,       // GoRouter setup link ho gaya
    );
  }
}