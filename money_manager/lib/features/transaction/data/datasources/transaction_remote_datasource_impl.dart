import 'dart:convert';

import 'package:money_manager/features/transaction/data/datasources/interface/transaction_remote_datasource.dart';
import 'package:money_manager/features/transaction/data/models/transaction_model.dart';
import 'package:http/http.dart' as http;

import '../../../../core/settings/api_settings.dart';
import '../models/transaction_add_model.dart';

class HomeRemoteDataSourceImpl extends TransactionRemoteDataSource {
  @override
  Future<List<TransactionModel>> getMonthTransactionList() async {
    const url = 'GetMonthTransaction';
    final response =
        await http.get(ApiSettings.baseUri(url), headers: ApiSettings.headers);

    if (response.statusCode == 200) {
      final resultListJsonBody = jsonDecode(response.body);
      Iterable resultListJson = resultListJsonBody["resultData"].toList();
      return List<TransactionModel>.from(
          resultListJson.map((model) => TransactionModel.fromJson(model)));
    } else {
      throw Exception();
    }
  }

  @override
  Future<List<TransactionModel>> getYearTransactionList() async {
    const url = 'GetAllTransactions';
    final response =
        await http.get(ApiSettings.baseUri(url), headers: ApiSettings.headers);

    if (response.statusCode == 200) {
      final resultListJsonBody = jsonDecode(response.body);
      Iterable resultListJson = resultListJsonBody["resultData"].toList();
      return List<TransactionModel>.from(
          resultListJson.map((model) => TransactionModel.fromJson(model)));
    } else {
      throw Exception();
    }
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
    const url = 'AddTransaction';
    final response = await http.post(ApiSettings.baseUri(url),
        headers: ApiSettings.headers, body: utf8.encode(jsonEncode(result)));

    if (response.statusCode == 200) {
      return Future.value(result.toJson());
    } else {
      throw Exception();
    }
  }

  @override
  Future<Map<String, dynamic>> deleteTransaction(
      TransactionModel params) async {
    final result = TransactionModel(params.timestamp, params.eTag,
        rowKey: params.rowKey,
        value: params.value,
        title: params.title,
        description: params.description,
        category: params.category,
        date: params.date);
    const url = 'DeleteTransaction';
    final response = await http.post(ApiSettings.baseUri(url),
        headers: ApiSettings.headers, body: utf8.encode(jsonEncode(result)));

    if (response.statusCode == 200) {
      return Future.value(result.toJson());
    } else {
      throw Exception();
    }
  }

  @override
  Future<Map<String, dynamic>> updateTransaction(
      TransactionModel params) async {
    final result = TransactionModel(params.timestamp, params.eTag,
        rowKey: params.rowKey,
        value: params.value,
        title: params.title,
        description: params.description,
        category: params.category,
        date: params.date);
    const url = 'UpdateTransaction';
    final response = await http.post(ApiSettings.baseUri(url),
        headers: ApiSettings.headers, body: utf8.encode(jsonEncode(result)));

    if (response.statusCode == 200) {
      return Future.value(result.toJson());
    } else {
      throw Exception();
    }
  }
}
