import 'dart:convert';

import 'package:money_manager/features/transaction/data/datasources/interface/transaction_remote_datasource.dart';
import 'package:money_manager/features/transaction/data/models/transaction_model.dart';
import 'package:http/http.dart' as http;

import '../models/transaction_add_model.dart';

class HomeRemoteDataSourceImpl extends TransactionRemoteDataSource {
  final List<Map<String, dynamic>> response = [
    // {
    //   "rowKey": "123123",
    //   "value": -191.90,
    //   "title": "Conta de luz",
    //   "description": "Conta de luz do mês de dezembro",
    //   "category": "Moradia",
    //   "date": "2023-01-01T13:33:03.969Z"
    // },
    // {
    //   "rowKey": "12313",
    //   "value": 1200,
    //   "title": "Pagamento Nathalie",
    //   "description": "Pagamento dia 30 de Nathalie",
    //   "category": "Moradia",
    //   "date": "2023-01-01T13:33:03.969Z"
    // },
    // {
    //   "rowKey": "1223",
    //   "value": 930,
    //   "title": "Pagamento Raphael",
    //   "description": "Pagamento dia 30 de Raphael",
    //   "category": "Moradia",
    //   "date": "2023-01-01T13:33:03.969Z"
    // },
    // {
    //   "rowKey": "23123",
    //   "value": -112.55,
    //   "title": "Conta de água",
    //   "description": " Conta de agua do mês de dezembro",
    //   "category": "Moradia",
    //   "date": "2023-01-01T13:33:03.969Z"
    // },
    // {
    //   "rowKey": "1235123",
    //   "value": -112.55,
    //   "title": "Conta de água",
    //   "description": "Conta de agua do mês de dezembro",
    //   "category": "Moradia",
    //   "date": "2023-01-01T13:33:03.969Z"
    // }
  ];
  @override
  Future<List<TransactionModel>> getMonthTransactionList() async {
    // Iterable resultList = response;
    // return List<TransactionModel>.from(
    //     resultList.map((model) => TransactionModel.fromJson(model)));
    const url =
        'https://moneymanagerapp.azurewebsites.net/api/Transaction/GetMonthTransaction';
    final resultList = await http.get(Uri.parse(url));
    final resultListJsonBody = jsonDecode(resultList.body);
    Iterable resultListJson = resultListJsonBody["resultData"].toList();
    return List<TransactionModel>.from(
        resultListJson.map((model) => TransactionModel.fromJson(model)));
  }

  @override
  Future<List<TransactionModel>> getYearTransactionList() async {
    // Iterable resultList = response;

    // return List<TransactionModel>.from(
    //     resultList.map((model) => TransactionModel.fromJson(model)));

    const url =
        'https://moneymanagerapp.azurewebsites.net/api/Transaction/GetAllTransactions';
    final resultList = await http.get(Uri.parse(url));
    final resultListJsonBody = jsonDecode(resultList.body);
    Iterable resultListJson = resultListJsonBody["resultData"].toList();

    return List<TransactionModel>.from(
        resultListJson.map((model) => TransactionModel.fromJson(model)));
  }

  @override
  Future<Map<String, dynamic>> addTransaction(
      TransactionAddModel params) async {
    final result = TransactionAddModel(params.timestamp, params.eTag,
        rowKey: params.rowKey,
        value: params.value,
        title: params.title,
        description: params.description,
        category: params.category,
        date: params.date);

    // response.add(result);
    // return Future.value(result);
    const url =
        'https://moneymanagerapp.azurewebsites.net/api/Transaction/AddTransaction';
    await http.post(Uri.parse(url),
        headers: {'Content-type': 'application/json'},
        body: utf8.encode(jsonEncode(result)));
    return Future.value(result.toJson());
  }

  @override
  Future<Map<String, dynamic>> deleteTransaction(TransactionModel params) {
    final result = TransactionModel(params.timestamp, params.eTag,
            rowKey: params.rowKey,
            value: params.value,
            title: params.title,
            description: params.description,
            category: params.category,
            date: params.date)
        .toJson();
    var oldResult = response.where((e) => e['Id'] == params.rowKey).first;
    var index = response.indexOf(oldResult);
    response.removeAt(index);
    return Future.value(result);
  }

  @override
  Future<Map<String, dynamic>> updateTransaction(TransactionModel params) {
    final result = TransactionModel(params.timestamp, params.eTag,
            rowKey: params.rowKey,
            value: params.value,
            title: params.title,
            description: params.description,
            category: params.category,
            date: params.date)
        .toJson();
    var oldResult = response.where((e) => e['Id'] == params.rowKey).first;
    var index = response.indexOf(oldResult);
    response[index] = result;
    return Future.value(result);
  }
}
