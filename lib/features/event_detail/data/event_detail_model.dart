import 'package:freezed_annotation/freezed_annotation.dart';

part 'event_detail_model.freezed.dart';
part 'event_detail_model.g.dart';

@freezed
class EventModel with _$EventModel {
  const factory EventModel({
    required String id,
    required String title,
    required String date,
    required int vendors,
    required double collectedAmount,
    required double pendingAmount,
  }) = _EventModel;

  factory EventModel.fromJson(Map<String, dynamic> json) => _$EventModelFromJson(json);
}