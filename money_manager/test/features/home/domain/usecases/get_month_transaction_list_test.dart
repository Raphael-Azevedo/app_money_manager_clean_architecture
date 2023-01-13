import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:money_manager/core/usecases/usecase.dart';
import 'package:money_manager/features/transaction/domain/entities/transactions.dart';
import 'package:money_manager/features/transaction/domain/repositories/transaction_repository.dart';
import 'package:money_manager/features/transaction/domain/usecases/get_month_transaction_list.dart';

import 'get_month_transaction_list_test.mocks.dart';

@GenerateMocks([TransactionRepository])
void main() {
  late MockTransactionRepository mockTransactionRepository;
  late GetMonthTransactionList usecase;
  late List<Transaction> tTransaction;

  setUp(() {
    mockTransactionRepository = MockTransactionRepository();
    usecase = GetMonthTransactionList(mockTransactionRepository);
    tTransaction = [
      Transaction(
        id: "teste",
        value: 1.0,
        title: 'test',
        description: 'test',
        category: "Casa",
        date: DateTime.now(),
      )
    ];
  });

  test(
    'should get transaction list from the repository',
    () async {
      // arrange
      when(mockTransactionRepository.getMonthTransactionList())
          .thenAnswer((_) async => Right(tTransaction));
      // act
      final result = await usecase(NoParams());
      // assert
      expect(result, equals(Right(tTransaction)));
      verify(mockTransactionRepository.getMonthTransactionList());
      verifyNoMoreInteractions(mockTransactionRepository);
    },
  );
}
