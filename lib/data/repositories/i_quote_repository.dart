import 'package:multiple_result/multiple_result.dart';
import 'package:picked/core/failures.dart';
import 'package:picked/data/models/quote_model.dart';
import 'package:picked/data/models/tag_model.dart';

abstract class IQuoteRepository {
  Future<Result<List<QuoteModel>, Failure>> getRandomQuote();

  Future<Result<List<TagModel>, Failure>> getTags();

  Future<Result<List<QuoteModel>, Failure>> getQuotes({
    String? tags,
    int page = 1,
  });

  Future<Result<List<QuoteModel>, Failure>> getFavoriteQuotes();

  Future<Result<Unit, Failure>> saveFavoriteQuote(QuoteModel quote);

  Future<Result<Unit, Failure>> removeFavoriteQuote(String quoteId);

  Future<Result<bool, Failure>> isFavorite(String quoteId);
}
