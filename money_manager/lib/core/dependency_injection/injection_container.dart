import 'package:get_it/get_it.dart';
import 'package:money_manager/core/usecases/usecase.dart';
import 'package:money_manager/features/home/data/datasources/home_remote_datasource_impl.dart';
import 'package:money_manager/features/home/data/datasources/interface/home_remote_datasource.dart';
import 'package:money_manager/features/home/data/repositories/home_repository_impl.dart';
import 'package:money_manager/features/home/domain/repositories/home_repository.dart';
import 'package:money_manager/features/home/domain/usecases/add_transaction.dart';
import 'package:money_manager/features/home/domain/usecases/get_month_transaction_list.dart';
import 'package:money_manager/features/home/presention/controller/home_controller.dart';
import 'package:money_manager/features/home/presention/pages/add_transaction_page.dart';
import 'package:money_manager/features/home/presention/pages/transaction_page.dart';

import '../../features/home/domain/usecases/get_year_transaction_list.dart';
import '../../features/home/presention/pages/home_page.dart';

final sl = GetIt.instance;

Future<void> init() async {
  sl.registerLazySingleton(() => NoParams());
  sl.registerLazySingleton(() => HomeController(
      getMonthTransactionListUseCase: sl(),
      getYearTransactionListUseCase: sl(),
      addTransactionUseCase: sl()));
  // Use cases
  sl.registerLazySingleton(() => GetMonthTransactionList(sl()));
  sl.registerLazySingleton(() => GetYearTransactionList(sl()));
  sl.registerFactory(() => AddTransaction(sl()));
  // Repository
  sl.registerLazySingleton<HomeRepository>(() => HomeRepositoryImpl(
        remoteDataSource: sl(),
      ));
  // Data Sources
  sl.registerLazySingleton<HomeRemoteDataSource>(
      () => HomeRemoteDataSourceImpl());

  sl.registerFactory(() => const HomePage());
  sl.registerFactory(() => const TransactionPage());
  sl.registerFactory(() => const AddTransactionPage());
}
