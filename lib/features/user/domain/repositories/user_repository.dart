import 'package:dartz/dartz.dart';
import '../../../../core/http_client/failure.dart';
import '../entities/user_entity.dart';

abstract class UserRepository {
  // Define repository contract here
  Future<Either<Failure, UserEntity>> getUser({required int page, required int limit});
}