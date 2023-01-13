import 'package:money_manager/features/transaction/data/datasources/interface/transaction_remote_datasource.dart';
import 'package:money_manager/features/transaction/data/models/transaction_model.dart';
import 'package:uuid/uuid.dart';

class HomeRemoteDataSourceImpl extends TransactionRemoteDataSource {
  final List<Map<String, dynamic>> response = [
    {
      "Id": "123123",
      "Value": -191.90,
      "Title": "Conta de luz",
      "Description": "Conta de luz do mês de dezembro",
      "Category": "Moradia",
      "Date": "2023-01-01T13:33:03.969Z"
    },
    {
      "Id": "12313",
      "Value": 1200,
      "Title": "Pagamento Nathalie",
      "Description": "Pagamento dia 30 de Nathalie",
      "Category": "Moradia",
      "Date": "2023-01-01T13:33:03.969Z"
    },
    {
      "Id": "1223",
      "Value": 930,
      "Title": "Pagamento Raphael",
      "Description": "Pagamento dia 30 de Raphael",
      "Category": "Moradia",
      "Date": "2023-01-01T13:33:03.969Z"
    },
    {
      "Id": "23123",
      "Value": -112.55,
      "Title": "Conta de água",
      "Description": " Conta de agua do mês de dezembro",
      "Category": "Moradia",
      "Date": "2023-01-01T13:33:03.969Z"
    },
    {
      "Id": "1235123",
      "Value": -112.55,
      "Title": "Conta de água",
      "Description": "Conta de agua do mês de dezembro",
      "Category": "Moradia",
      "Date": "2023-01-01T13:33:03.969Z"
    }
  ];
  @override
  Future<List<TransactionModel>> getMonthTransactionList() async {
    Iterable resultList = response;
    return List<TransactionModel>.from(
        resultList.map((model) => TransactionModel.fromJson(model)));
  }

  @override
  Future<List<TransactionModel>> getYearTransactionList() async {
    Iterable resultList = response;

    return List<TransactionModel>.from(
        resultList.map((model) => TransactionModel.fromJson(model)));
  }

  @override
  Future<Map<String, dynamic>> addTransaction(TransactionModel params) {
    final result = TransactionModel(
            id: const Uuid().v4(),
            value: params.value,
            title: params.title,
            description: params.description,
            category: params.category,
            date: params.date)
        .toJson();

    response.add(result);
    return Future.value(result);
  }

  @override
  Future<Map<String, dynamic>> deleteTransaction(TransactionModel params) {
    // TODO: implement deleteTransaction
    throw UnimplementedError();
  }

  @override
  Future<Map<String, dynamic>> updateTransaction(TransactionModel params) {
    // TODO: implement updateTransaction
    throw UnimplementedError();
  }
}
