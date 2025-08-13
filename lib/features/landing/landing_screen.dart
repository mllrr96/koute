import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:picked/app_router.dart';
import 'package:picked/core/extension/build_context_extension.dart';

@RoutePage()
class LandingScreen extends StatelessWidget {
  const LandingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: context.systemUiOverlayStyle,
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Icon(
                LucideIcons.quote,
                size: 120,
                color: theme.colorScheme.primary.withValues(alpha: 0.8),
              ),
              const SizedBox(height: 32.0),
              Text(
                'Kuote',
                style: theme.textTheme.displayLarge
                    ?.copyWith(fontFamily: GoogleFonts.almendra().fontFamily),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16.0),
              Text(
                'Discover daily inspiration and explore a world of wisdom.\nYour journey to profound thoughts starts here.',
                style: theme.textTheme.bodyLarge?.copyWith(
                  fontFamily: GoogleFonts.almendra().fontFamily,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 50.0),
              ElevatedButton(
                onPressed: () {
                  AutoRouter.of(context).replace(const ExploreRoute());
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 48.0),
                  padding: const EdgeInsets.symmetric(vertical: 24.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
                child: Text(
                  'Inspire me',
                  style: theme.textTheme.titleLarge?.copyWith(
                    color: theme.colorScheme.onPrimary,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
