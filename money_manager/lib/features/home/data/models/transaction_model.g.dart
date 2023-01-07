// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TransactionModel _$TransactionModelFromJson(Map<String, dynamic> json) =>
    TransactionModel(
      value: (json['Value'] as num).toDouble(),
      title: json['Title'] as String,
      description: json['Description'] as String,
      date: DateTime.parse(json['Date'] as String),
    );

Map<String, dynamic> _$TransactionModelToJson(TransactionModel instance) =>
    <String, dynamic>{
      'Value': instance.value,
      'Title': instance.title,
      'Description': instance.description,
      'Date': instance.date.toIso8601String(),
    };
