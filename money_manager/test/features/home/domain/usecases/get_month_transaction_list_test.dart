import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:money_manager/core/usecases/usecase.dart';
import 'package:money_manager/features/home/domain/entities/transactions.dart';
import 'package:money_manager/features/home/domain/repositories/home_repository.dart';
import 'package:money_manager/features/home/domain/usecases/get_month_transaction_list.dart';

import 'get_month_transaction_list_test.mocks.dart';

@GenerateMocks([HomeRepository])
void main() {
  late MockHomeRepository mockHomeRepository;
  late GetMonthTransactionList usecase;
  late List<Transaction> tTransaction;

  setUp(() {
    mockHomeRepository = MockHomeRepository();
    usecase = GetMonthTransactionList(mockHomeRepository);
    tTransaction = [Transaction(
      value: 1.0,
      title: 'test',
      description: 'test',
      category : "Casa",
      date: DateTime.now(),
    )];
  });

  test(
    'should get transaction list from the repository',
    () async {
      // arrange
      when(mockHomeRepository.getMonthTransactionList())
          .thenAnswer((_) async => Right(tTransaction));
      // act
      final result = await usecase(NoParams());
      // assert
      expect(result, equals(Right(tTransaction)));
      verify(mockHomeRepository.getMonthTransactionList());
      verifyNoMoreInteractions(mockHomeRepository);
    },
  );
}
