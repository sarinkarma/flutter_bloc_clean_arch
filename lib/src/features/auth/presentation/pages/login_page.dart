import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_clean_arch/localization/l10n.dart';
import 'package:flutter_bloc_clean_arch/src/core/di/injector.dart';
import 'package:flutter_bloc_clean_arch/src/core/extensions/extensions.dart';
import 'package:flutter_bloc_clean_arch/src/core/routes/app_router.dart';
import 'package:flutter_bloc_clean_arch/src/core/themes/theme.dart';
import 'package:flutter_bloc_clean_arch/src/core/widgets/widgets.dart';

import '../blocs/login/login_cubit.dart';
import '../blocs/login_form/login_form_cubit.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<LoginFormCubit>(create: (_) => getIt<LoginFormCubit>()),
        BlocProvider<LoginCubit>(create: (_) => getIt<LoginCubit>()),
      ],
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Login'),
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(20),
          child: BlocListener<LoginCubit, LoginState>(
            listener: (context, state) {
              state.maybeWhen(
                orElse: () {},
                error: (message) {
                  context.showSnackbar(
                      title: l10n.login, message: message, error: true);
                  getIt<AppRouter>().replaceAll([const DashboardRoute()]);
                },
                validationError: (message, errors) {
                  if (errors.isEmpty) {
                    context.showSnackbar(
                        title: l10n.login, message: message, error: true);
                  } else {
                    context.read<LoginFormCubit>().setErrors(errors: errors);
                  }
                  getIt<AppRouter>().replaceAll([const DashboardRoute()]);
                },
                success: (message) {
                  context.showSnackbar(
                      title: l10n.login, message: message, error: true);
                  getIt<AppRouter>().replaceAll([const DashboardRoute()]);
                },
              );
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  l10n.email,
                  style: AppStyles.text14PxMedium.textGrey,
                ),
                const _EmailField(),
                Text(
                  l10n.password,
                  style: AppStyles.text14PxMedium.textGrey,
                ),
                const _PasswordField(),
                BlocBuilder<LoginFormCubit, LoginFormState>(
                  builder: (context, state) {
                    final loading = context.select<LoginCubit, bool>((value) =>
                        value.state.maybeWhen(
                            orElse: () => false, loading: () => true));
                    return CustomButton(
                      onPressed: () {
                        context.read<LoginCubit>().login(state.values);
                      },
                      isDisabled: !state.isValid,
                      loading: loading,
                      label: l10n.login,
                      fullWidth: true,
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _PasswordField extends StatelessWidget {
  const _PasswordField();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginFormCubit, LoginFormState>(
      buildWhen: (previous, current) =>
          current.passwordField != previous.passwordField,
      builder: (context, state) {
        return TextFormField(
          style: AppStyles.text14PxMedium.primary,
          keyboardType: TextInputType.visiblePassword,
          textInputAction: TextInputAction.done,
          obscureText: state.passwordField.obscureText,
          onChanged: (value) =>
              context.read<LoginFormCubit>().onPasswordChange(value),
          decoration: InputDecoration(
            errorText: state.passwordField.hasError
                ? state.passwordField.errorMessage
                : null,
            hintText: l10n.passwordHint,
            suffixIcon: IconButton(
              onPressed: context.read<LoginFormCubit>().togglePassword,
              icon: Icon(state.passwordField.obscureText
                  ? Icons.visibility
                  : Icons.visibility_off),
            ),
          ),
        );
      },
    );
  }
}

class _EmailField extends StatelessWidget {
  const _EmailField();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginFormCubit, LoginFormState>(
      buildWhen: (previous, current) =>
          current.emailField != previous.emailField,
      builder: (context, state) {
        return TextFormField(
          style: AppStyles.text14PxMedium.primary,
          keyboardType: TextInputType.emailAddress,
          textInputAction: TextInputAction.next,
          onChanged: (value) =>
              context.read<LoginFormCubit>().onEmailChange(value),
          decoration: InputDecoration(
            errorText: state.emailField.hasError
                ? state.emailField.errorMessage
                : null,
            hintText: l10n.emailHint,
          ),
        );
      },
    );
  }
}
