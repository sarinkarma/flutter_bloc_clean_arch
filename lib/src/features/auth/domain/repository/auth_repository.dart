import 'package:flutter_bloc_clean_arch/src/core/typedefs/typedefs.dart';

abstract class AuthRepository {
  bool get isLoggedIn;

  EitherResponse<String> login(Map<String, dynamic> values);
}
