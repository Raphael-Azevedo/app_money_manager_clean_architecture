import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:money_manager/core/error/exceptions.dart';
import 'package:money_manager/core/error/failures.dart';
import 'package:money_manager/features/home/data/datasources/interface/home_remote_datasource.dart';
import 'package:money_manager/features/home/data/models/transaction_model.dart';
import 'package:money_manager/features/home/data/repositories/home_repository_impl.dart';
import 'package:money_manager/features/home/domain/entities/transactions.dart';

import 'home_repository_impl_test.mocks.dart';

@GenerateMocks([
  HomeRemoteDataSource
], customMocks: [
  MockSpec<HomeRemoteDataSource>(
      as: #MockHomeRemoteDataSourceForTest,
      onMissingStub: OnMissingStub.returnDefault),
])
void main() {
  late MockHomeRemoteDataSource mockHomeRemoteDataSource;
  late HomeRepositoryImpl repository;

  setUp(() {
    mockHomeRemoteDataSource = MockHomeRemoteDataSource();
    repository = HomeRepositoryImpl(remoteDataSource: mockHomeRemoteDataSource);
  });

  group('getMonthTransactionList', () {
    final tTransactionModel = [
      TransactionModel(
          value: 18.80,
          title: 'title',
          description: 'description',
          date: DateTime.now())
    ];
    final List<Transaction> tTransaction = tTransactionModel;
    test(
        'should return remote data when the call to remote data source is success',
        () async {
      // arrange
      when(mockHomeRemoteDataSource.getMonthTransactionList())
          .thenAnswer((_) async => tTransactionModel);
      // act
      final result = await repository.getMonthTransactionList();
      // assert
      verify(mockHomeRemoteDataSource.getMonthTransactionList());
      expect(result, equals(Right(tTransaction)));
    });
    test(
        'should return server failure when the call to remote data source is unsuccess',
        () async {
      // arrange
      when(mockHomeRemoteDataSource.getMonthTransactionList())
          .thenThrow(ServerException());
      // act
      final result = await repository.getMonthTransactionList();
      // assert
      verify(mockHomeRemoteDataSource.getMonthTransactionList());
      expect(result, equals(Left(ServerFailure())));
    });
  });
}
