// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TransactionModel _$TransactionModelFromJson(Map<String, dynamic> json) =>
    TransactionModel(
      json['timestamp'] as String?,
      json['eTag'] as String?,
      rowKey: json['rowKey'] as String,
      value: (json['value'] as num).toDouble(),
      title: json['title'] as String,
      description: json['description'] as String,
      category: json['category'] as String,
      date: DateTime.parse(json['date'] as String),
    );

Map<String, dynamic> _$TransactionModelToJson(TransactionModel instance) =>
    <String, dynamic>{
      'rowKey': instance.rowKey,
      'value': instance.value,
      'title': instance.title,
      'description': instance.description,
      'category': instance.category,
      'date': instance.date.toIso8601String(),
      'timestamp': instance.timestamp,
      'eTag': instance.eTag,
    };
