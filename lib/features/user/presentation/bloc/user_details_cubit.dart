import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/entities/user_entity.dart';

class UserDetailCubit extends Cubit<UserDataEntity> {
  UserDetailCubit() : super(UserDataEntity());

  void user(UserDataEntity value) {
    emit(value);
  }
}
