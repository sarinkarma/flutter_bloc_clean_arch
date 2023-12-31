import 'package:auto_route/annotations.dart';
import 'package:flutter_bloc_clean_arch/src/app/app.dart';
import 'package:flutter_bloc_clean_arch/src/features/auth/auth.dart';
import 'package:flutter_bloc_clean_arch/src/features/dashboard/dashboard.dart';

import 'app_routes.dart';

export 'app_router.gr.dart';
export 'app_routes.dart';

@AdaptiveAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: [
    AutoRoute<void>(page: SplashPage, path: AppRoutes.splash, initial: true),
    AutoRoute<void>(page: LoginPage, path: AppRoutes.login),
    AutoRoute<void>(page: DashboardPage, path: AppRoutes.dashboard),
  ],
)
class $AppRouter {}
