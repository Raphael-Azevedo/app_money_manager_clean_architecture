import 'package:equatable/equatable.dart';

class Transaction extends Equatable {
  final double value;
  final String title;
  final String description;
  final DateTime date;

  const Transaction({
    required this.value,
    required this.title,
    required this.description,
    required this.date,
  });

  @override
  List<Object?> get props => [value, title, description, date];
}
