import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:picked/core/constants.dart';
import 'package:picked/data/models/quote_model.dart';
import 'package:picked/data/models/tag_model.dart';

@lazySingleton
class QuotableApiService {
  final Dio _dio;

  QuotableApiService(this._dio) {
    _dio.options.baseUrl = AppConstants.apiBaseUrl;
  }

  Future<List<QuoteModel>> getRandomQuote() async {
    final response = await _dio.get('/quotes/random');
    final results = response.data['results'] as List;

    return results.map((quoteJson) => QuoteModel.fromJson(quoteJson)).toList();
  }

  Future<List<TagModel>> getTags() async {
    final response = await _dio.get('/tags');
    return (response.data as List)
        .map((tagJson) => TagModel.fromJson(tagJson))
        .toList();
  }

  Future<List<QuoteModel>> getQuotes({
    String? tags,
    int page = 1,
    int limit = 20,
  }) async {
    final response = await _dio.get('/quotes', queryParameters: {
      'tags': tags,
      'page': page,
      'limit': limit,
    });
    // The API returns a paginated result object
    final results = response.data['results'] as List;
    return results.map((quoteJson) => QuoteModel.fromJson(quoteJson)).toList();
  }
}
