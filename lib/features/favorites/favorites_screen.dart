import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:picked/app_router.dart';
import 'package:picked/features/explore/widgets/quote_card.dart';
import 'package:picked/features/favorites/cubit/favorites_cubit.dart';
import 'package:picked/injection.dart';

@RoutePage()
class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<FavoritesCubit>()..loadFavorites(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Favorites',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
        ),
        body: BlocBuilder<FavoritesCubit, FavoritesState>(
          builder: (context, state) {
            if (state is FavoritesLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is FavoritesLoaded) {
              if (state.quotes.isEmpty) {
                return const Center(
                  child: Text('No favorite quotes yet.'),
                );
              }
              return GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.8,
                  crossAxisSpacing: 8.0,
                  mainAxisSpacing: 8.0,
                ),
                padding: const EdgeInsets.all(8.0),
                itemCount: state.quotes.length,
                itemBuilder: (context, index) {
                  final quote = state.quotes[index];
                  return QuoteCard(
                    quote: quote,
                    onTap: () {
                      AutoRouter.of(context).push(
                        QuoteDetailRoute(quote: quote, index: index),
                      );
                    },
                  );
                },
              );
            } else if (state is FavoritesError) {
              return Center(child: Text('Error: ${state.message}'));
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
