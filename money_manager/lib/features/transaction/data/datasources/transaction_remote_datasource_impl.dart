import 'package:money_manager/features/transaction/data/datasources/interface/transaction_remote_datasource.dart';
import 'package:money_manager/features/transaction/data/models/transaction_model.dart';

class HomeRemoteDataSourceImpl extends TransactionRemoteDataSource {
  final List<Map<String, dynamic>> response = [
    {
      "Value": -191.90,
      "Title": "Conta de luz",
      "Description": "Conta de luz do mês de dezembro",
      "Category": "Moradia",
      "Date": "2023-01-01T13:33:03.969Z"
    },
    {
      "Value": 1200,
      "Title": "Pagamento Nathalie",
      "Description": "Pagamento dia 30 de Nathalie",
      "Category": "Moradia",
      "Date": "2023-01-01T13:33:03.969Z"
    },
    {
      "Value": 930,
      "Title": "Pagamento Raphael",
      "Description": "Pagamento dia 30 de Raphael",
      "Category": "Moradia",
      "Date": "2023-01-01T13:33:03.969Z"
    },
    {
      "Value": -112.55,
      "Title": "Conta de água",
      "Description": " Conta de agua do mês de dezembro",
      "Category": "Moradia",
      "Date": "2023-01-01T13:33:03.969Z"
    },
    {
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
            value: params.value,
            title: params.title,
            description: params.description,
            category: params.category,
            date: params.date)
        .toJson();

    response.add(result);
    return Future.value(result);
  }
}
