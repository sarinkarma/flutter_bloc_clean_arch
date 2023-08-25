
import 'package:injectable/injectable.dart';

abstract class DashboardRemoteSource {}

@LazySingleton(as: DashboardRemoteSource)
class DashboardRemoteSourceImpl implements DashboardRemoteSource {}
