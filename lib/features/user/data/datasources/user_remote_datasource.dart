import 'dart:io';

import '../../../../core/http_client/client.dart';
import '../../../../core/http_client/exception.dart';
import '../models/user_model.dart';

abstract class UserRemoteDataSource {
  Future<UserModel> getUser({required int page, required int limit});
}
class UserRemoteDataSourceImpl implements UserRemoteDataSource {
    final BaseApiClient client;

  UserRemoteDataSourceImpl({required this.client});

  @override
  Future<UserModel> getUser({required int page, required int limit}) async {
    try {
      final response = await client.get(endPoint: '/users?per_page=$limit&page=$page');

        final UserModel userResponse = UserModel.fromJson(response);
        return userResponse;
    
    } on SocketException {
      throw const ServerException('No Internet Connection');
    } catch (e) {
      throw const ServerException('Something went wrong');
    }
  }
}