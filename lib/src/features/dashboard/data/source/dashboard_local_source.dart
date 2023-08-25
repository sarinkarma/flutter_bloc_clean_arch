
import 'package:injectable/injectable.dart';

abstract class DashboardLocalSource {}

@LazySingleton(as: DashboardLocalSource)
class DashboardLocalSourceImpl implements DashboardLocalSource {}
