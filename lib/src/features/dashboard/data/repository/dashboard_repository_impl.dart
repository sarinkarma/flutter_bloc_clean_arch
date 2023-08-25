/*
 * Copyright (c) 2022.
 * Author: Kishor Mainali
 * Company: EB Pearls
 */

import 'package:flutter_bloc_clean_arch/src/features/dashboard/domain/repository/dashboard_repository.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: DashboardRepository)
class DashboardRepositoryImpl implements DashboardRepository {}
