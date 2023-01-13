import 'package:json_annotation/json_annotation.dart';
import 'package:money_manager/features/transaction/domain/entities/transactions.dart';

part 'transaction_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.pascal)
class TransactionModel extends Transaction {
  const TransactionModel({
    required String id,
    required double value,
    required String title,
    required String description,
      required String category,
    required DateTime date,
  }) : super(
          id:id,
          value: value,
          title: title,
          description: description,
          category: category,
          date: date,
        );

  factory TransactionModel.fromJson(Map<String, dynamic> json) => _$TransactionModelFromJson(json);


  Map<String, dynamic> toJson() => _$TransactionModelToJson(this);
}

