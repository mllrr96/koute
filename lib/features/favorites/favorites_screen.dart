import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:picked/app_router.dart';
import 'package:picked/core/extension/build_context_extension.dart';
import 'package:picked/features/explore/widgets/quote_card.dart';
import 'package:picked/features/favorites/cubit/favorites_cubit.dart';

@RoutePage()
class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    return BlocProvider(
      create: (context) => FavoritesCubit.init..loadFavorites(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Favorites', style: theme.textTheme.headlineSmall),
        ),
        body: BlocBuilder<FavoritesCubit, FavoritesState>(
          builder: (context, state) {
            return switch (state) {
              FavoritesLoaded(:final quotes) => GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.8,
                    crossAxisSpacing: 8.0,
                    mainAxisSpacing: 8.0,
                  ),
                  padding: const EdgeInsets.all(8.0),
                  itemCount: quotes.length,
                  itemBuilder: (context, index) {
                    final quote = quotes[index];
                    return Hero(
                      tag: quote.id + (index + 123).toString(),
                      child: QuoteCard(
                        quote: quote,
                        onTap: () =>
                          context.pushRoute(
                            QuoteDetailRoute(quote: quote, index: index + 123),
                          )
                        ,
                      ),
                    );
                  },
                ),
              FavoritesEmpty() => const Center(
                  child: Text('No favorite quotes yet.'),
                ),
              FavoritesError(:final message) => Center(child: Text('Error: $message')),
              _ => const Center(child: CircularProgressIndicator()),
            };
          },
        ),
      ),
    );
  }
}
