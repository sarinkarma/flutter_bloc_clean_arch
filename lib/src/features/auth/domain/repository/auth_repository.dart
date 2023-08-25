/*
 * Copyright (c) 2022.
 * Author: Kishor Mainali
 * Company: EB Pearls
 */

import 'package:flutter_bloc_clean_arch/src/core/typedefs/typedefs.dart';

abstract class AuthRepository {
  bool get isLoggedIn;

  EitherResponse<String> login(Map<String, dynamic> values);
}
