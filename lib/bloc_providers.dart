import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:picked/features/detail/cubit/random_quote_cubit.dart';
import 'package:picked/features/favorites/cubit/favorites_cubit.dart';
import 'package:picked/injection.dart';

class BlocProviders extends StatelessWidget {
  const BlocProviders({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt<RandomQuoteCubit>(),
        ),
        BlocProvider(
          create: (context) => getIt<FavoritesCubit>()..loadFavorites(),
        ),
      ],
      child: child,
    );
  }
}
