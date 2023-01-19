import 'package:flutter/cupertino.dart';

class TransactionViewModel {
  String rowKey;
  TextEditingController value;
  TextEditingController title;
  TextEditingController description;
  String category;
  DateTime date;
  String? timestamp;
  String? eTag;

  TransactionViewModel(
    this.timestamp,
    this.eTag, {
    required this.rowKey,
    required this.value,
    required this.title,
    required this.description,
    required this.category,
    required this.date,
  });
}
