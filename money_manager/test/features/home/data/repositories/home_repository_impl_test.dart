import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:money_manager/core/error/exceptions.dart';
import 'package:money_manager/core/error/failures.dart';
import 'package:money_manager/features/transaction/data/datasources/interface/transaction_remote_datasource.dart';
import 'package:money_manager/features/transaction/data/models/transaction_model.dart';
import 'package:money_manager/features/transaction/data/repositories/transaction_repository_impl.dart';
import 'package:money_manager/features/transaction/domain/entities/transactions.dart';

import 'home_repository_impl_test.mocks.dart';

@GenerateMocks([
  TransactionRemoteDataSource
], customMocks: [
  MockSpec<TransactionRemoteDataSource>(
      as: #mockTransactionRemoteDataSourceForTest,
      onMissingStub: OnMissingStub.returnDefault),
])
void main() {
  late MockTransactionRemoteDataSource mockTransactionRemoteDataSource;
  late TransactionRepositoryImpl repository;

  setUp(() {
    mockTransactionRemoteDataSource = MockTransactionRemoteDataSource();
    repository = TransactionRepositoryImpl(
        remoteDataSource: mockTransactionRemoteDataSource);
  });

  group('getMonthTransactionList', () {
    final tTransactionModel = [
      TransactionModel(
          rowKey: "teste",
          value: 18.80,
          title: 'title',
          description: 'description',
          category: "Casa",
          date: DateTime.now())
    ];
    final List<Transaction> tTransaction = tTransactionModel;
    test(
        'should return remote data when the call to remote data source is success',
        () async {
      // arrange
      when(mockTransactionRemoteDataSource.getMonthTransactionList())
          .thenAnswer((_) async => tTransactionModel);
      // act
      final result = await repository.getMonthTransactionList();
      // assert
      verify(mockTransactionRemoteDataSource.getMonthTransactionList());
      expect(result, equals(Right(tTransaction)));
    });
    test(
        'should return server failure when the call to remote data source is unsuccess',
        () async {
      // arrange
      when(mockTransactionRemoteDataSource.getMonthTransactionList())
          .thenThrow(ServerException());
      // act
      final result = await repository.getMonthTransactionList();
      // assert
      verify(mockTransactionRemoteDataSource.getMonthTransactionList());
      expect(result, equals(Left(ServerFailure())));
    });
  });
}
