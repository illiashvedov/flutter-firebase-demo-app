import 'package:auto_route/auto_route.dart';
import 'package:firebase_demo_app/presentation/pages/entry/entry_page_cubit.dart';
import 'package:firebase_demo_app/presentation/routing/app.router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EntryPage extends StatelessWidget {
  const EntryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => EntryPageCubit.create(),
      child: const _EntryPage(),
    );
  }
}

class _EntryPage extends StatelessWidget {
  const _EntryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<EntryPageCubit, EntryPageState>(
      builder: (context, state) {
        return const Scaffold();
      },
      listener: (context, state) {
        if (state is EntryPageLoggedOutState) {
          AutoRouter.of(context).replaceAll([const LoginRoute()]);
        } else if (state is EntryPageLoggedState) {
          AutoRouter.of(context).replaceAll([const HomeRoute()]);
        }
      },
    );
  }
}
