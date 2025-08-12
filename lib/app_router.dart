import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:picked/data/models/quote_model.dart';
import 'package:picked/features/detail/quote_detail_screen.dart';
import 'package:picked/features/explore/explore_screen.dart';
import 'package:picked/features/favorites/favorites_screen.dart';
import 'package:picked/features/landing/landing_screen.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen,Route')
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: LandingRoute.page, initial: true),
        AutoRoute(page: ExploreRoute.page),
        AutoRoute(page: QuoteDetailRoute.page),
        AutoRoute(page: FavoritesRoute.page),
      ];
}
