import 'package:flutter/material.dart';
import 'package:picked/data/models/quote_model.dart';
import 'package:picked/features/explore/widgets/quote_card.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ExploreShimmer extends StatelessWidget {
  const ExploreShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    // Using a simple Wrap. This avoids all intrinsic dimension errors,
    // as Wrap can calculate its size from its children, and QuoteCard
    // should have an intrinsic size.
    // This may not produce a perfectly aligned grid, but it will not crash.
    return const Skeletonizer(
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Wrap(
          spacing: 8.0,
          runSpacing: 8.0,
          alignment: WrapAlignment.center,
          children: [
            // NOTE: The width of the card is now determined by the QuoteCard's own content.
            // For a skeleton, this should be consistent.
            QuoteCard(
              quote: QuoteModel(id: '', content: '', author: '', tags: []),
            ),
            QuoteCard(
              quote: QuoteModel(id: '', content: '', author: '', tags: []),
              onTap: null,
            ),
            QuoteCard(
              quote: QuoteModel(id: '', content: '', author: '', tags: []),
              onTap: null,
            ),
            QuoteCard(
              quote: QuoteModel(id: '', content: '', author: '', tags: []),
              onTap: null,
            ),
            QuoteCard(
              quote: QuoteModel(id: '', content: '', author: '', tags: []),
              onTap: null,
            ),
            QuoteCard(
              quote: QuoteModel(id: '', content: '', author: '', tags: []),
              onTap: null,
            ),
          ],
        ),
      ),
    );
  }
}
