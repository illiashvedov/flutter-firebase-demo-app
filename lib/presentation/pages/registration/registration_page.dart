import 'package:auto_route/auto_route.dart';
import 'package:firebase_demo_app/presentation/pages/registration/registration_page_cubit.dart';
import 'package:firebase_demo_app/presentation/routing/app.router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegistrationPage extends StatelessWidget {
  const RegistrationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => RegistrationPageCubit.create(),
      child: const _LoginPage(),
    );
  }
}

class _LoginPage extends StatelessWidget {
  const _LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<RegistrationPageCubit>();

    return BlocConsumer<RegistrationPageCubit, RegistrationPageState>(
      builder: (context, state) {
        bool isLoading = true;
        Widget content = const SizedBox();

        if (state is RegistrationPageIdleState) {
          isLoading = state.isLoading;

          content = _Content(
            state: state,
            cubit: cubit,
          );
        }

        if (isLoading) {
          content = const Center(
            child: CircularProgressIndicator(),
          );
        }

        return Scaffold(
          body: content,
        );
      },
      listener: (context, state) {
        if (state is RegistrationPageSuccessState) {
          AutoRouter.of(context).replaceAll([const HomeRoute()]);
        } else if (state is RegistrationPageErrorState) {
          final snackBar = SnackBar(content: Text(state.e.toString()));

          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
      },
    );
  }
}

class _Content extends StatelessWidget {
  final RegistrationPageIdleState state;
  final RegistrationPageCubit cubit;

  const _Content({
    required this.state,
    required this.cubit,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Registration',
                  style: Theme.of(context).textTheme.headline5,
                ),
                const SizedBox(height: 64),
                TextFormField(
                  initialValue: state.email,
                  decoration: InputDecoration(
                    label: const Text('Email'),
                    errorText: state.errors[RegistrationFormFields.email],
                  ),
                  textInputAction: TextInputAction.next,
                  onChanged: cubit.setEmail,
                  onFieldSubmitted: (_) => cubit.validateEmail(),
                ),
                const SizedBox(height: 16),
                TextFormField(
                  initialValue: state.password,
                  decoration: InputDecoration(
                    label: const Text('Password'),
                    errorText: state.errors[RegistrationFormFields.password],
                  ),
                  textInputAction: TextInputAction.next,
                  onChanged: cubit.setPassword,
                  onFieldSubmitted: (_) => cubit.validatePassword(),
                ),
                const SizedBox(height: 16),
                TextFormField(
                  initialValue: state.confirmPassword,
                  decoration: InputDecoration(
                    label: const Text('Confirm Password'),
                    errorText: state.errors[RegistrationFormFields.confirmPassword],
                  ),
                  textInputAction: TextInputAction.done,
                  onChanged: cubit.setConfirmPassword,
                  onFieldSubmitted: (_) => cubit.validateConfirmPassword(),
                ),
                const SizedBox(height: 24),
                ElevatedButton(
                  onPressed: state.canSendData ? cubit.submit : null,
                  child: const Text('Sign up'),
                ),
              ],
            ),
          ),
          const Positioned(
            child: SizedBox(
              height: 56,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: BackButton(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
