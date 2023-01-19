import 'package:equatable/equatable.dart';

class Transaction extends Equatable {
  final String rowKey;
  final double value;
  final String title;
  final String description;
  final String category;
  final DateTime date;
    final String? timestamp;
  final String? eTag;

  const Transaction(this.timestamp, this.eTag, {
    required this.rowKey,
    required this.value,
    required this.title,
    required this.description,
    required this.category,
    required this.date,
  });

  @override
  List<Object?> get props => [timestamp, eTag, rowKey, value, title, description, category, date];
}
