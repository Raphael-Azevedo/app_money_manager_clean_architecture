import 'package:money_manager/features/home/data/datasources/interface/home_remote_datasource.dart';
import 'package:money_manager/features/home/data/models/transaction_model.dart';

class HomeRemoteDataSourceImpl extends HomeRemoteDataSource {
  @override
  Future<List<TransactionModel>> getMonthTransactionList() async {
    final List<Map<String, dynamic>> response = [
      {
        "Value": -191.90,
        "Title": "Conta de luz",
        "Description": "Conta de luz do mês de dezembro",
        "Date": "2023-01-01T13:33:03.969Z"
      },
      {
        "Value": 1200,
        "Title": "Pagamento Nathalie",
        "Description": "Pagamento dia 30 de Nathalie",
        "Date": "2023-01-01T13:33:03.969Z"
      },
      {
        "Value": 930,
        "Title": "Pagamento Raphael",
        "Description": "Pagamento dia 30 de Raphael",
        "Date": "2023-01-01T13:33:03.969Z"
      },
      {
        "Value": -112.55,
        "Title": "Conta de água",
        "Description": " Conta de agua do mês de dezembro",
        "Date": "2023-01-01T13:33:03.969Z"
      },
      {
        "Value": -112.55,
        "Title": "Conta de água",
        "Description": "Conta de agua do mês de dezembro",
        "Date": "2023-01-01T13:33:03.969Z"
      }
    ];
    Iterable resultList = response;

    return List<TransactionModel>.from(
        resultList.map((model) => TransactionModel.fromJson(model)));
  }
}
