import 'dart:io';

void main(List<String> args) {
  if (args.isEmpty) {
    print('❌ Please provide a feature name.');
    return;
  }

  final featureName = args[0];
  final basePath = 'lib/features/$featureName';

  final filesWithContent = {
    '/data/datasources/${featureName}_remote_datasource.dart': '''
    import '../../../../core/http_client/client.dart';
import '../../../../core/http_client/exception.dart';

abstract class ${featureName.capitalize()}RemoteDataSource {
  Future<dynamic> get${featureName.capitalize()}();
}
class ${featureName.capitalize()}RemoteDataSourceImpl implements ${featureName.capitalize()}RemoteDataSource {
    final BaseApiClient client;

  ${featureName.capitalize()}RemoteDataSourceImpl({required this.client});

  @override
  Future<dynamic> get${featureName.capitalize()}() async {
    const String url = '';
    try {
      final response = await client.get(endPoint: '/end_pont');

      //Utils.responseLog(url, response);

        //final ${featureName.capitalize()}Response ${featureName}Response = ${featureName.capitalize()}Response.fromRawJson(response.body);
        return '';
    
    } catch (e) {
      throw ServerException();
    }
  }
}
''',
    '/data/models/${featureName}_model.dart': '''
class ${featureName.capitalize()}Model {
  // Define your model properties and methods here
  
  ${featureName.capitalize()}Model();

  factory ${featureName.capitalize()}Model.fromJson(Map<String, dynamic> json) {
    // Parse JSON to Model
    return ${featureName.capitalize()}Model();
  }

  Map<String, dynamic> toJson() {
    // Convert Model to JSON
    return {};
  }
}
''',
    '/data/repositories/${featureName}_repository_impl.dart': '''
import 'dart:io';
import 'package:dartz/dartz.dart';
import '../../../../core/http_client/exception.dart';
import '../../../../core/http_client/failure.dart';
import '../../domain/repositories/${featureName}_repository.dart';
import '../datasources/${featureName}_remote_datasource.dart';
import '../models/${featureName}_model.dart';

class ${featureName.capitalize()}RepositoryImpl implements ${featureName.capitalize()}Repository {
  // Implement repository logic
  final ${featureName.capitalize()}RemoteDataSource _remoteDataSource;

  const ${featureName.capitalize()}RepositoryImpl({required ${featureName.capitalize()}RemoteDataSource remoteDataSource})
      : _remoteDataSource = remoteDataSource;

  @override
  Future<Either<Failure, dynamic>> get${featureName.capitalize()}() async {
    try {
      final result = await _remoteDataSource.get${featureName.capitalize()}();
      return Right(result);
    } on ServerException {
      return const Left(ServerFailure('An error has occurred'));
    } on SocketException {
      return const Left(ConnectionFailure('Failed to connect to the network'));
    } on AuthException {
      return const Left(AuthFailure(''));
    }
  }
}
''',
    '/domain/entities/${featureName}_entity.dart': '''
class ${featureName.capitalize()}Entity {
  // Define your domain entity properties here
}
''',
    '/domain/repositories/${featureName}_repository.dart': '''
import 'package:dartz/dartz.dart';
import '../../../../core/http_client/failure.dart';

abstract class ${featureName.capitalize()}Repository {
  // Define repository contract here
  Future<Either<Failure, dynamic>> get${featureName.capitalize()}();
}
''',
    '/domain/usecases/${featureName}_usecase.dart': '''
import 'package:dartz/dartz.dart';
import '../../../../core/http_client/failure.dart';
import '../repositories/${featureName}_repository.dart';

class ${featureName.capitalize()}UseCase {
  final ${featureName.capitalize()}Repository _repository;

  ${featureName.capitalize()}UseCase({required ${featureName.capitalize()}Repository repository})
      : _repository = repository;
  // Define your use case logic
   Future<Either<Failure, dynamic>> get${featureName.capitalize()}() {
    return _repository.get${featureName.capitalize()}();
  }
}
''',
    '/presentation/bloc/$featureName/${featureName}_bloc.dart': '''
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/usecases/${featureName}_usecase.dart';

part '${featureName}_event.dart';
part '${featureName}_state.dart';

class ${featureName.capitalize()}Bloc extends Bloc<${featureName.capitalize()}Event, ${featureName.capitalize()}State> {
  final ${featureName.capitalize()}UseCase _useCase;

  ${featureName.capitalize()}Bloc({
    required ${featureName.capitalize()}UseCase useCase,
  })  : _useCase = useCase,
        super(const ${featureName.capitalize()}InitialState()) {
    on<${featureName.capitalize()}LoadEvent>(_onLoad${featureName.capitalize()});
  }

  Future<void> _onLoad${featureName.capitalize()}(
    ${featureName.capitalize()}LoadEvent event,
    Emitter<${featureName.capitalize()}State> emit,
  ) async {
    final result = await _useCase.get${featureName.capitalize()}();
    result.fold((failure) {
      emit(${featureName.capitalize()}ErrorState(error: failure.message));
    }, (data) {
      emit(${featureName.capitalize()}SuccessState(data: data));
    });
  }
}
''',

    '/presentation/bloc/$featureName/${featureName}_event.dart': '''
part of '${featureName}_bloc.dart';

abstract class ${featureName.capitalize()}Event extends Equatable {
  const ${featureName.capitalize()}Event();

  @override
  List<Object?> get props => [];
}

class ${featureName.capitalize()}LoadEvent extends ${featureName.capitalize()}Event {}
''',

    '/presentation/bloc/$featureName/${featureName}_state.dart': '''
part of '${featureName}_bloc.dart';

abstract class ${featureName.capitalize()}State extends Equatable {
  const ${featureName.capitalize()}State();

  @override
  List<Object?> get props => [];
}

class ${featureName.capitalize()}InitialState extends ${featureName.capitalize()}State {
  const ${featureName.capitalize()}InitialState();
}

class ${featureName.capitalize()}LoadingState extends ${featureName.capitalize()}State {
  final String? message;

  const ${featureName.capitalize()}LoadingState({this.message});

  @override
  List<Object?> get props => [
        message,
      ];
}

class ${featureName.capitalize()}SuccessState extends ${featureName.capitalize()}State {
  final dynamic data;

  const ${featureName.capitalize()}SuccessState({
    required this.data,
  });
  @override
  List<Object?> get props => [data];
}

class ${featureName.capitalize()}ErrorState extends ${featureName.capitalize()}State {
  final String error;

  const ${featureName.capitalize()}ErrorState({
    required this.error,
  });
  @override
  List<Object?> get props => [error];
}
''',

    '/presentation/pages/${featureName}_page.dart': '''
import 'package:flutter/material.dart';

class ${featureName.capitalize()}Page extends StatelessWidget {
  const ${featureName.capitalize()}Page({super.key});

  static const String route = '/$featureName';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${featureName.capitalize()} Page'),
      ),
      body: Center(
        child: Text('Welcome to ${featureName.capitalize()} Page!'),
      ),
    );
  }
}
''',
    '/presentation/widget/${featureName}_view.dart': '''
// Implement your view
''',
  };

  filesWithContent.forEach((relativePath, content) {
    final filePath = '$basePath$relativePath';
    final file = File(filePath);
    file.createSync(recursive: true);
    file.writeAsStringSync(content.trim());
    print('📝 Created file: $filePath');
  });

  print(
      '\n🎉 Feature folder structure with example files created for feature: $featureName');
}

extension StringExtension on String {
  String capitalize() {
    if (isEmpty) return this;
    return this[0].toUpperCase() + substring(1);
  }
}
