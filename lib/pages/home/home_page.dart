import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'home_cubit.dart';
import 'home_state.dart';

class HomePageView extends StatelessWidget {
  const HomePageView({super.key, required popBackType});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => HomeCubit(),
      child: Builder(builder: (context) => _buildPage(context)),
    );
  }

  Widget _buildPage(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AI Translate'),
      ),
      body: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          return const Center(
            child: Text(
              'Welcome to AI Translate!',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          );
        },
      ),
    );
  }
}
