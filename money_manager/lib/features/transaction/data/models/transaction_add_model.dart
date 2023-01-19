import 'package:json_annotation/json_annotation.dart';
import 'package:money_manager/features/transaction/domain/entities/transactions.dart';

part 'transaction_add_model.g.dart';

@JsonSerializable()
class TransactionAddModel extends Transaction {
 const TransactionAddModel(
    timestamp,
    eTag, {
    required String rowKey,
    required double value,
    required String title,
    required String description,
    required String category,
    required DateTime date,
  }) : super(
          timestamp,
          eTag,
          rowKey: rowKey,
          value: value,
          title: title,
          description: description,
          category: category,
          date: date,
        );

  factory TransactionAddModel.fromJson(Map<String, dynamic> json) =>
      _$TransactionAddModelFromJson(json);

  Map<String, dynamic> toJson() => _$TransactionAddModelToJson(this);
}
