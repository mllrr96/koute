// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

/// generated route for
/// [ExploreScreen]
class ExploreRoute extends PageRouteInfo<void> {
  const ExploreRoute({List<PageRouteInfo>? children})
      : super(ExploreRoute.name, initialChildren: children);

  static const String name = 'ExploreRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const ExploreScreen();
    },
  );
}

/// generated route for
/// [FavoritesScreen]
class FavoritesRoute extends PageRouteInfo<void> {
  const FavoritesRoute({List<PageRouteInfo>? children})
      : super(FavoritesRoute.name, initialChildren: children);

  static const String name = 'FavoritesRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const FavoritesScreen();
    },
  );
}

/// generated route for
/// [LandingScreen]
class LandingRoute extends PageRouteInfo<void> {
  const LandingRoute({List<PageRouteInfo>? children})
      : super(LandingRoute.name, initialChildren: children);

  static const String name = 'LandingRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const LandingScreen();
    },
  );
}

/// generated route for
/// [QuoteDetailScreen]
class QuoteDetailRoute extends PageRouteInfo<QuoteDetailRouteArgs> {
  QuoteDetailRoute({
    Key? key,
    required QuoteModel quote,
    required int index,
    List<PageRouteInfo>? children,
  }) : super(
          QuoteDetailRoute.name,
          args: QuoteDetailRouteArgs(key: key, quote: quote, index: index),
          initialChildren: children,
        );

  static const String name = 'QuoteDetailRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<QuoteDetailRouteArgs>();
      return QuoteDetailScreen(
        key: args.key,
        quote: args.quote,
        index: args.index,
      );
    },
  );
}

class QuoteDetailRouteArgs {
  const QuoteDetailRouteArgs({
    this.key,
    required this.quote,
    required this.index,
  });

  final Key? key;

  final QuoteModel quote;

  final int index;

  @override
  String toString() {
    return 'QuoteDetailRouteArgs{key: $key, quote: $quote, index: $index}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! QuoteDetailRouteArgs) return false;
    return key == other.key && quote == other.quote && index == other.index;
  }

  @override
  int get hashCode => key.hashCode ^ quote.hashCode ^ index.hashCode;
}
