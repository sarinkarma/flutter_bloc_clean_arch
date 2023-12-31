import 'package:dio/dio.dart';
import 'package:flutter_bloc_clean_arch/src/core/base/base_remote_source.dart';
import 'package:injectable/injectable.dart';

import '../models/login_model.dart';

abstract class AuthRemoteSource {
  Future<LoginModel> login(Map<String, dynamic> values);
}

@LazySingleton(as: AuthRemoteSource)
class AuthRemoteSourceImpl extends BaseRemoteSource
    implements AuthRemoteSource {
  AuthRemoteSourceImpl(Dio super.dio);

  @override
  Future<LoginModel> login(Map<String, dynamic> values) async {
    return await networkRequest(
      request: (dio) => dio.post('/login', data: values),
      onResponse: (response) => LoginModel.fromJson(response['login']),
    );
  }
}
