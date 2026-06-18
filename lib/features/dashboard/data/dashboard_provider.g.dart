// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dashboard_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$dashboardRepositoryHash() =>
    r'8d7ee4bf97b788c6b10c7304994cdac57749c7ff';

/// 1. Repository Provider
///
/// Copied from [dashboardRepository].
@ProviderFor(dashboardRepository)
final dashboardRepositoryProvider =
    AutoDisposeProvider<DashboardRepository>.internal(
      dashboardRepository,
      name: r'dashboardRepositoryProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$dashboardRepositoryHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef DashboardRepositoryRef = AutoDisposeProviderRef<DashboardRepository>;
String _$fetchEventsHash() => r'31166e41afa51d8345c06d651153884648ccadb1';

/// See also [fetchEvents].
@ProviderFor(fetchEvents)
final fetchEventsProvider = FutureProvider<List<EventModel>>.internal(
  fetchEvents,
  name: r'fetchEventsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$fetchEventsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef FetchEventsRef = FutureProviderRef<List<EventModel>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
