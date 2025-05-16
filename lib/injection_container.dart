import 'package:get_it/get_it.dart';
import 'package:get_storage/get_storage.dart';
import 'core/http_client/client.dart';
import 'features/user/data/datasources/user_remote_datasource.dart';
import 'features/user/data/repositories/user_repository_impl.dart';
import 'features/user/domain/repositories/user_repository.dart';
import 'features/user/domain/usecases/user_usecase.dart';
import 'features/user/presentation/bloc/user/user_bloc.dart';

GetIt sl = GetIt.instance;

Future<void> initializeDependencies() async {
  // Bloc
  sl.registerFactory(() => UserBloc(useCase: sl(), box: sl()));

  // Use cases
  sl.registerLazySingleton(() => UserUseCase(repository: sl()));

  // Repositories
  sl.registerLazySingleton<UserRepository>(
      () => UserRepositoryImpl(remoteDataSource: sl()));
  // Data sources
  sl.registerLazySingleton<UserRemoteDataSource>(
      () => UserRemoteDataSourceImpl(client: sl()));
  // Http service
  sl.registerLazySingleton<BaseApiClient>(() => BaseApiClient());
  sl.registerLazySingleton(() => GetStorage());
}
