import 'package:get_it/get_it.dart';
import 'package:money_manager/core/usecases/usecase.dart';
import 'package:money_manager/features/transaction/data/datasources/transaction_remote_datasource_impl.dart';
import 'package:money_manager/features/transaction/data/datasources/interface/transaction_remote_datasource.dart';
import 'package:money_manager/features/transaction/data/repositories/transaction_repository_impl.dart';
import 'package:money_manager/features/transaction/domain/repositories/transaction_repository.dart';
import 'package:money_manager/features/transaction/domain/usecases/add_transaction.dart';
import 'package:money_manager/features/transaction/domain/usecases/get_month_transaction_list.dart';
import 'package:money_manager/features/transaction/presention/controller/transaction_controller.dart';
import 'package:money_manager/features/transaction/presention/pages/add_transaction_page.dart';
import 'package:money_manager/features/transaction/presention/pages/transaction_page.dart';
import 'package:money_manager/features/transaction/presention/pages/update_transaction_page.dart';

import '../../features/transaction/domain/usecases/get_year_transaction_list.dart';
import '../../features/transaction/presention/pages/home_page.dart';

final sl = GetIt.instance;

Future<void> init() async {
  sl.registerLazySingleton(() => NoParams());
  sl.registerLazySingleton(() => TransactionController(
      getMonthTransactionListUseCase: sl(),
      getYearTransactionListUseCase: sl(),
      addTransactionUseCase: sl()));
  // Use cases
  sl.registerLazySingleton(() => GetMonthTransactionList(sl()));
  sl.registerLazySingleton(() => GetYearTransactionList(sl()));
  sl.registerFactory(() => AddTransaction(sl()));
  // Repository
  sl.registerLazySingleton<TransactionRepository>(() => TransactionRepositoryImpl(
        remoteDataSource: sl(),
      ));
  // Data Sources
  sl.registerLazySingleton<TransactionRemoteDataSource>(
      () => HomeRemoteDataSourceImpl());

  sl.registerFactory(() => const HomePage());
  sl.registerFactory(() => const TransactionPage());
  sl.registerFactory(() => const AddTransactionPage());
  sl.registerFactory(() => const UpdateTransactionPage());
}
