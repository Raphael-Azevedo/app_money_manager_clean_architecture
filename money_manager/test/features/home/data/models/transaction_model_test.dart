import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:money_manager/features/transaction/data/models/transaction_model.dart';
import 'package:money_manager/features/transaction/domain/entities/transactions.dart';

import '../../../../fixtures/fixture_reader.dart';

void main() {
  final tTransactionModel = TransactionModel(
    rowKey: "teste",
    value: 1.0,
    title: 'test',
    description: 'test',
    category: "Casa",
    date: DateTime.parse("2019-07-04T13:33:03.969Z"),
  );

  test(
    'should be a subclass of Transaction entity',
    () async {
      // assert
      expect(tTransactionModel, isA<Transaction>());
    },
  );
  group(
    'fromJson',
    () {
      test(
        'should return a valid model when all the props is correct',
        () async {
          // arrange
          final Map<String, dynamic> jsonMap =
              json.decode(fixture('transaction.json'));
          // act
          final result = TransactionModel.fromJson(jsonMap);
          // assert
          expect(result, equals(tTransactionModel));
        },
      );
    },
  );
  group(
    'toJson',
    () {
      test(
        'should return a valid json when convert a model',
        () async {
          // act
          final result = tTransactionModel.toJson();
          // assert
          final expectedMap = {
            "rowKey": "teste",
            "Value": 1.0,
            "Title": "test",
            "Description": "test",
            "Category": "Casa",
            "Date": "2019-07-04T13:33:03.969Z"
          };
          expect(result, equals(expectedMap));
        },
      );
    },
  );
}
