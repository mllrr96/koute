import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:picked/core/constants.dart';
import 'package:picked/core/failures.dart';
import 'package:picked/data/api/quotable_api_service.dart';
import 'package:picked/data/models/quote_model.dart';
import 'package:picked/data/models/tag_model.dart';
import 'package:picked/data/repositories/i_quote_repository.dart';

@LazySingleton(as: IQuoteRepository)
class QuoteRepository implements IQuoteRepository {
  final QuotableApiService _apiService;
  final SharedPreferences _sharedPreferences;

  QuoteRepository(this._apiService, this._sharedPreferences);

  // In-memory cache for tags
  List<TagModel>? _cachedTags;

  @override
  Future<Result<List<QuoteModel>, Failure>> getQuotes({
    String? tags,
    int page = 1,
  }) async {
    try {
      final quotes = await _apiService.getQuotes(tags: tags, page: page);
      return Success(quotes);
    } on DioException catch (e) {
      return Error(ServerFailure('Failed to fetch quotes: ${e.message}'));
    } catch (e) {
      return Error(ServerFailure('An unexpected error occurred: $e'));
    }
  }

  @override
  Future<Result<List<QuoteModel>, Failure>> getRandomQuote() async {
    try {
      final quote = await _apiService.getRandomQuote();
      return Result.success(quote);
    } on DioException catch (e) {
      return Error(ServerFailure('Failed to fetch random quote: ${e.message}'));
    } catch (e) {
      return Error(ServerFailure('An unexpected error occurred: $e'));
    }
  }

  @override
  Future<Result<List<TagModel>, Failure>> getTags() async {
    if (_cachedTags != null) {
      return Result.success(_cachedTags!);
    }
    try {
      final tags = await _apiService.getTags();
      _cachedTags = tags;
      return Result.success(tags);
    } on DioException catch (e) {
      return Error(ServerFailure('Failed to fetch tags: ${e.message}'));
    } catch (e) {
      return Error(ServerFailure('An unexpected error occurred: $e'));
    }
  }

  @override
  Future<Result<List<QuoteModel>, Failure>> getFavoriteQuotes() async {
    try {
      final jsonStringList =
          _sharedPreferences.getStringList(AppConstants.favoritesCacheKey) ??
              [];
      final favoriteQuotes = jsonStringList
          .map((jsonString) => QuoteModel.fromJson(
              json.decode(jsonString) as Map<String, dynamic>))
          .toList();
      return Success(favoriteQuotes);
    } catch (e) {
      return Error(CacheFailure('Could not retrieve favorites.'));
    }
  }

  @override
  Future<Result<bool, Failure>> isFavorite(String quoteId) async {
    try {
      final favorites = await getFavoriteQuotes();
      return favorites.when(
        (quotes) => Success(quotes.any((quote) => quote.id == quoteId)),
        (failure) => Error(failure),
      );
    } catch (e) {
      return Error(CacheFailure('Could not check favorite status.'));
    }
  }

  @override
  Future<Result<Unit, Failure>> removeFavoriteQuote(String quoteId) async {
    try {
      final favorites = await getFavoriteQuotes();
      return await favorites.when(
        (quotes) async {
          quotes.removeWhere((quote) => quote.id == quoteId);
          await _saveFavorites(quotes);
          return Success(unit);
        },
        (failure) => Error(failure),
      );
    } catch (e) {
      return Error(CacheFailure('Could not remove favorite.'));
    }
  }

  @override
  Future<Result<Unit, Failure>> saveFavoriteQuote(QuoteModel quote) async {
    try {
      final favorites = await getFavoriteQuotes();
      return await favorites.when(
        (quotes) async {
          if (!quotes.any((q) => q.id == quote.id)) {
            quotes.add(quote);
            await _saveFavorites(quotes);
          }
          return const Success(unit);
        },
        (failure) => Error(failure),
      );
    } catch (e) {
      return Error(CacheFailure('Could not save favorite.'));
    }
  }

  Future<void> _saveFavorites(List<QuoteModel> quotes) async {
    final jsonStringList =
        quotes.map((quote) => json.encode(quote.toJson())).toList();
    await _sharedPreferences.setStringList(
        AppConstants.favoritesCacheKey, jsonStringList);
  }
}
