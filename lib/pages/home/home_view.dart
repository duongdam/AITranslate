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
    final cubit = BlocProvider.of<HomeCubit>(context);

    return Column(
      children: [
        ElevatedButton(
          onPressed: () {},
          child: const Text('Go to User Page'),
        ),
        ElevatedButton(
          onPressed: () {},
          child: const Text('Go to Purchase Page'),
        ),
      ],
    );
  }
}
