import 'package:money_manager/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:money_manager/features/home/data/models/transaction_model.dart';
import 'package:money_manager/features/home/domain/entities/transactions.dart';

import '../../../../core/usecases/usecase.dart';
import '../repositories/home_repository.dart';

class AddTransaction implements UseCaseSingle<Transaction, TransactionModel> {
  final HomeRepository repository;

  AddTransaction(this.repository);

  @override
  Future<Either<Failure, Map<String, dynamic>>?> call(params) async {
    final requestModel = TransactionModel(
        value: params.value,
        title: params.title,
        description: params.description,
        category: params.category,
        date: params.date);

    final result = await repository.addTransaction(requestModel);
    return result;
  }
}
