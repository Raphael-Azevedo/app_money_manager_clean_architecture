import 'package:equatable/equatable.dart';

class Transaction extends Equatable {
  final String id;
  final double value;
  final String title;
  final String description;
  final String category;
  final DateTime date;

  const Transaction({
    required this.id,
    required this.value,
    required this.title,
    required this.description,
    required this.category,
    required this.date,
  });

  @override
  List<Object?> get props => [id, value, title, description, category, date];
}
