import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_bloc_clean_arch/localization/generated/l10n.dart';
import 'package:flutter_bloc_clean_arch/src/app/presentation/blocs/app/app_cubit.dart';
import 'package:flutter_bloc_clean_arch/src/app/presentation/blocs/locale/locale_cubit.dart';
import 'package:flutter_bloc_clean_arch/src/core/di/injector.dart';
import 'package:flutter_bloc_clean_arch/src/core/helpers/device_info_helper.dart';
import 'package:flutter_bloc_clean_arch/src/core/routes/app_router.dart';
import 'package:flutter_bloc_clean_arch/src/core/themes/theme.dart';
import 'package:flutter_bloc_clean_arch/src/core/widgets/widgets.dart';

class App extends StatelessWidget {
  App({super.key});

  final AppRouter _appRouter = getIt<AppRouter>();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AppCubit>(
          create: (_) =>
              getIt<AppCubit>(param1: DeviceInfoHelper.instance)..change(),
        ),
        BlocProvider<LocaleCubit>(
          create: (_) => LocaleCubit(),
        ),
      ],
      child: BlocBuilder<LocaleCubit, LocaleState>(
        builder: (context, state) {
          return MaterialApp.router(
            restorationScopeId: 'root',
            debugShowCheckedModeBanner: false,
            useInheritedMediaQuery: true,
            routeInformationParser: _appRouter.defaultRouteParser(),
            routerDelegate: _appRouter.delegate(),
            localizationsDelegates: [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            locale: state.locale,
            theme: AppTheme.lightTheme,
            supportedLocales: AppLocalizations.delegate.supportedLocales,
            builder: (BuildContext context, Widget? child) {
              ErrorWidget.builder = (FlutterErrorDetails details) =>
                  AppErrorWidget(details: details);
              return child!;
            },
          );
        },
      ),
    );
  }
}
