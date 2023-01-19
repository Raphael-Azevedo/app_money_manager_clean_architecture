// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_add_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TransactionAddModel _$TransactionAddModelFromJson(Map<String, dynamic> json) =>
    TransactionAddModel(
      json['timestamp'],
      json['eTag'],
      rowKey: json['rowKey'] as String,
      value: (json['value'] as num).toDouble(),
      title: json['title'] as String,
      description: json['description'] as String,
      category: json['category'] as String,
      date: DateTime.parse(json['date'] as String),
    );

Map<String, dynamic> _$TransactionAddModelToJson(
        TransactionAddModel instance) =>
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
