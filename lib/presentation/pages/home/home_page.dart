import 'package:auto_route/auto_route.dart';
import 'package:firebase_demo_app/presentation/pages/home/home_page_cubit.dart';
import 'package:firebase_demo_app/presentation/routing/app.router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => HomePageCubit.create(),
      child: const _HomePage(),
    );
  }
}

class _HomePage extends StatelessWidget {
  const _HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<HomePageCubit>();

    return BlocConsumer<HomePageCubit, HomePageState>(
      builder: (context, state) {
        bool isLoading = true;
        Widget content = const SizedBox();

        if (state is HomePageIdleState) {
          isLoading = false;

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
        if (state is HomePageSuccessState) {
          AutoRouter.of(context).replaceAll([const LoginRoute()]);
        }
      },
    );
  }
}

class _Content extends StatelessWidget {
  final HomePageState state;
  final HomePageCubit cubit;

  const _Content({
    required this.state,
    required this.cubit,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Home'),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: cubit.logOut,
              child: const Text('Log out'),
            ),
          ],
        ),
      ),
    );
  }
}
