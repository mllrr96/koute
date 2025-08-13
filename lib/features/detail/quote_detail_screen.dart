import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:picked/core/extension/build_context_extension.dart';
import 'package:picked/core/extension/quote_extension.dart';
import 'package:picked/data/models/quote_model.dart';
import 'package:picked/features/favorites/cubit/favorites_cubit.dart';
import 'package:share_plus/share_plus.dart';

@RoutePage()
class QuoteDetailScreen extends StatelessWidget {
  final QuoteModel quote;
  final int index;

  const QuoteDetailScreen(
      {super.key, required this.quote, required this.index});

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: context.systemUiOverlayStyle,
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              children: [
                _buildCustomAppBar(context),
                Expanded(
                  child: Center(
                    child: Hero(
                        tag: quote.id + index.toString(),
                        child: Material(
                            color: Colors.transparent,
                            child: _buildQuoteCard(context, quote))),
                  ),
                ),
                const SizedBox(height: 16),
                _buildBottomActionBar(context),
                const SizedBox(height: 16),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCustomAppBar(BuildContext context) {
    return SizedBox(
      height: kToolbarHeight * 1.5,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            padding: const EdgeInsets.all(24.0),
            icon: const Icon(LucideIcons.cornerDownLeft,
                color: Colors.black, size: 30),
            onPressed: context.maybePop,
          ),
        ],
      ),
    );
  }

  Widget _buildQuoteCard(BuildContext context, QuoteModel displayQuote) {
    final theme = context.theme;
    return Container(
      padding: const EdgeInsets.all(24.0),
      decoration: BoxDecoration(
        color: theme.colorScheme.primary,
        borderRadius: BorderRadius.circular(24.0),
      ),
      child: Stack(
        children: [
          Positioned(
            top: 60,
            left: 0,
            child: Text(
              '“',
              style: TextStyle(
                fontSize: 300,
                color: Colors.white.withValues(alpha: 0.1),
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Positioned(
            bottom: -100,
            right: 0,
            child: Text(
              '”',
              style: TextStyle(
                fontSize: 300,
                color: Colors.white.withValues(alpha: 0.1),
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  if (displayQuote.tags.isNotEmpty)
                    Material(
                      child: Chip(
                        labelStyle: TextStyle(
                          color: theme.colorScheme.primary,
                          fontWeight: FontWeight.bold,
                        ),
                        label: Text(displayQuote.tags.first),
                        backgroundColor: Colors.white,
                      ),
                    ),
                  BlocBuilder<FavoritesCubit, FavoritesState>(
                    builder: (context, state) {
                      bool isFavorite = false;
                      if (state is FavoritesLoaded) {
                        isFavorite =
                            state.quotes.any((q) => q.id == displayQuote.id);
                      }

                      return IconButton(
                        padding: const EdgeInsets.all(16.0),
                        icon: Icon(
                          isFavorite ? Icons.favorite : LucideIcons.heartPlus,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          context
                              .read<FavoritesCubit>()
                              .toggleFavorite(displayQuote);
                        },
                      );
                    },
                  ),
                ],
              ),
              Flexible(
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: Text(
                      quote.content,
                      textAlign: TextAlign.center,
                      style: quote.getTextStyle(context),
                    ),
                  ),
                ),
              ),
              Center(
                child: Text(
                  quote.author,
                  style: TextStyle(color: Colors.grey, fontSize: 20),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildBottomActionBar(BuildContext context) {
    final theme = context.theme;
    return Container(
      width: double.maxFinite,
      height: kToolbarHeight * 1.5,
      decoration: BoxDecoration(
        color: theme.colorScheme.primary,
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            padding: const EdgeInsets.all(16.0),
            icon: const Icon(LucideIcons.share, color: Colors.white),
            onPressed: () {
              SharePlus.instance.share(ShareParams(
                text: '"${quote.content}" - ${quote.author}',
                subject: 'Quote from ${quote.author}',
              ));
            },
          ),
          const SizedBox(width: 24),
          IconButton(
            padding: const EdgeInsets.all(16.0),
            icon: const Icon(Icons.casino, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
