import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:picked/core/extension/quote_extension.dart';
import 'package:picked/data/models/quote_model.dart';

class QuoteCard extends StatelessWidget {
  final QuoteModel quote;
  final void Function()? onTap;

  const QuoteCard({
    super.key,
    required this.quote,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        color: Theme.of(context).colorScheme.surface,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(
                LucideIcons.quote,
                size: 35,
                color: Theme.of(context)
                    .colorScheme
                    .onSurface
                    .withValues(alpha: 0.2),
              ),
              const SizedBox(height: 16),
              () {
                return Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                      quote.content,
                      style: quote.getTextStyle(context),
                      textAlign: TextAlign.center,),
                  ),
                );
              }(),
              const SizedBox(height: 16),
              Align(
                alignment: Alignment.center,
                child: Text(
                  quote.author,
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context)
                            .colorScheme
                            .onSurface
                            .withValues(alpha: 0.4),
                      ),
                  textAlign: TextAlign.right,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
