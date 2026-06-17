// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event_detail_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EventModelImpl _$$EventModelImplFromJson(Map<String, dynamic> json) =>
    _$EventModelImpl(
      id: json['id'] as String,
      title: json['title'] as String,
      date: json['date'] as String,
      vendors: (json['vendors'] as num).toInt(),
      collectedAmount: (json['collectedAmount'] as num).toDouble(),
      pendingAmount: (json['pendingAmount'] as num).toDouble(),
    );

Map<String, dynamic> _$$EventModelImplToJson(_$EventModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'date': instance.date,
      'vendors': instance.vendors,
      'collectedAmount': instance.collectedAmount,
      'pendingAmount': instance.pendingAmount,
    };
