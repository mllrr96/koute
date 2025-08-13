import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:picked/core/extension/build_context_extension.dart';
import 'package:picked/data/models/quote_model.dart';

extension QuoteExtension on QuoteModel {
  TextStyle getTextStyle(BuildContext context) {
    final theme = context.theme;
    final styleIndex = id.hashCode % 4;
    TextStyle quoteStyle;

    switch (styleIndex) {
      case 0: // Bold, Sans-Serif Style
        quoteStyle = GoogleFonts.montserrat(
          fontWeight: FontWeight.bold,
          fontSize: 16,
          color: theme.colorScheme.onSurface,
        );
        break;
      case 1: // Cursive/Script Style
        quoteStyle = GoogleFonts.dancingScript(
          fontSize: 20,
          color: theme.colorScheme.onSurface,
        );
        break;
      case 2: // Light, spaced-out style
        quoteStyle = GoogleFonts.lato(
          fontWeight: FontWeight.w300,
          letterSpacing: 1.2,
          height: 1.5,
          color: theme.colorScheme.onSurface,
        );
        break;
      default: // Standard Style from the original code
        quoteStyle = theme.textTheme.titleMedium?.copyWith(
              color: theme.colorScheme.onSurface,
            ) ??
            TextStyle(
              color: theme.colorScheme.onSurface,
            );
        break;
    }
    return quoteStyle;
  }
}
