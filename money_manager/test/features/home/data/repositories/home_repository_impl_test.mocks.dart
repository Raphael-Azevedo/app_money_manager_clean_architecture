// Mocks generated by Mockito 5.3.2 from annotations
// in money_manager/test/features/home/data/repositories/home_repository_impl_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i3;

import 'package:mockito/mockito.dart' as _i1;
import 'package:money_manager/features/home/data/datasources/interface/home_remote_datasource.dart'
    as _i2;
import 'package:money_manager/features/home/data/models/transaction_model.dart'
    as _i4;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

/// A class which mocks [HomeRemoteDataSource].
///
/// See the documentation for Mockito's code generation for more information.
class MockHomeRemoteDataSource extends _i1.Mock
    implements _i2.HomeRemoteDataSource {
  MockHomeRemoteDataSource() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.Future<List<_i4.TransactionModel>> getMonthTransactionList() =>
      (super.noSuchMethod(
        Invocation.method(
          #getMonthTransactionList,
          [],
        ),
        returnValue: _i3.Future<List<_i4.TransactionModel>>.value(
            <_i4.TransactionModel>[]),
      ) as _i3.Future<List<_i4.TransactionModel>>);
}

/// A class which mocks [HomeRemoteDataSource].
///
/// See the documentation for Mockito's code generation for more information.
class MockHomeRemoteDataSourceForTest extends _i1.Mock
    implements _i2.HomeRemoteDataSource {
  @override
  _i3.Future<List<_i4.TransactionModel>> getMonthTransactionList() =>
      (super.noSuchMethod(
        Invocation.method(
          #getMonthTransactionList,
          [],
        ),
        returnValue: _i3.Future<List<_i4.TransactionModel>>.value(
            <_i4.TransactionModel>[]),
        returnValueForMissingStub: _i3.Future<List<_i4.TransactionModel>>.value(
            <_i4.TransactionModel>[]),
      ) as _i3.Future<List<_i4.TransactionModel>>);
}
