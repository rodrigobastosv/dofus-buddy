import 'package:dofus_buddy/app/core/http/db_http_client.dart';
import 'package:dofus_buddy/app/core/http/dio_factory.dart';
import 'package:dofus_buddy/app/cubit/app_cubit.dart';
import 'package:dofus_buddy/app/data/items/datasources/items_remote_datasource.dart';
import 'package:dofus_buddy/app/data/items/items_repository.dart';
import 'package:dofus_buddy/app/domain/items/use_cases/search_items_use_case.dart';
import 'package:get_it/get_it.dart';

final G = GetIt.instance;

void setupDependencies() {
  G
    ..registerLazySingleton(AppCubit.new)
    ..registerLazySingleton(DioFactory.create)
    ..registerLazySingleton(() => DBHttpClient(G()))
    ..registerLazySingleton(() => ItemsRemoteDatasource(G()))
    ..registerLazySingleton(() => ItemsRepository(G()))
    ..registerLazySingleton(() => SearchItemsUseCase(itemsRepository: G()));
}
