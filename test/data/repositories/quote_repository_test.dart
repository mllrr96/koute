import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:picked/core/constants.dart';
import 'package:picked/core/failures.dart';
import 'package:picked/data/api/quotable_api_service.dart';
import 'package:picked/data/models/quote_model.dart';
import 'package:picked/data/models/tag_model.dart';
import 'package:picked/data/repositories/quote_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'quote_repository_test.mocks.dart';

@GenerateMocks([QuotableApiService, SharedPreferences])
void main() {
  late QuoteRepository repository;
  late MockQuotableApiService mockQuotableApiService;
  late MockSharedPreferences mockSharedPreferences;

  setUp(() {
    mockQuotableApiService = MockQuotableApiService();
    mockSharedPreferences = MockSharedPreferences();
    repository = QuoteRepository(mockQuotableApiService, mockSharedPreferences);
  });

  group('getRandomQuote', () {
    final tQuoteModel = QuoteModel(
      id: '1',
      content: 'Test Quote',
      author: 'Test Author',
      tags: ['tag1'],
    );

    test(
      'should return QuoteModel when the call to api service is successful',
      () async {
        // arrange
        when(mockQuotableApiService.getRandomQuote())
            .thenAnswer((_) async => [tQuoteModel]);
        // act
        final result = await repository.getRandomQuote();
        // assert
        expect(result, Success(tQuoteModel));
        verify(mockQuotableApiService.getRandomQuote());
        verifyNoMoreInteractions(mockQuotableApiService);
      },
    );

    test(
      'should return ServerFailure when the call to api service is unsuccessful',
      () async {
        // arrange
        when(mockQuotableApiService.getRandomQuote())
            .thenThrow(Exception('API Error'));
        // act
        final result = await repository.getRandomQuote();
        // assert
        expect(result, const Error(ServerFailure('An unexpected error occurred: Exception: API Error')));
        verify(mockQuotableApiService.getRandomQuote());
        verifyNoMoreInteractions(mockQuotableApiService);
      },
    );
  });

  group('getTags', () {
    final tTagList = [
      TagModel(id: '1', name: 'tag1', quoteCount: 10),
      TagModel(id: '2', name: 'tag2', quoteCount: 20),
    ];

    test(
      'should return List<TagModel> when the call to api service is successful',
      () async {
        // arrange
        when(mockQuotableApiService.getTags())
            .thenAnswer((_) async => tTagList);
        // act
        final result = await repository.getTags();
        // assert
        expect(result, Success(tTagList));
        verify(mockQuotableApiService.getTags());
        verifyNoMoreInteractions(mockQuotableApiService);
      },
    );

    test(
      'should return ServerFailure when the call to api service is unsuccessful',
      () async {
        // arrange
        when(mockQuotableApiService.getTags())
            .thenThrow(Exception('API Error'));
        // act
        final result = await repository.getTags();
        // assert
        expect(result, const Error(ServerFailure('An unexpected error occurred: Exception: API Error')));
        verify(mockQuotableApiService.getTags());
        verifyNoMoreInteractions(mockQuotableApiService);
      },
    );

    test(
      'should return cached tags on subsequent calls',
      () async {
        // arrange
        when(mockQuotableApiService.getTags())
            .thenAnswer((_) async => tTagList);
        // act
        await repository.getTags(); // First call to cache
        final result = await repository.getTags(); // Second call from cache
        // assert
        expect(result, Success(tTagList));
        verify(mockQuotableApiService.getTags()).called(1); // Only called once
        verifyNoMoreInteractions(mockQuotableApiService);
      },
    );
  });

  group('getFavoriteQuotes', () {
    final tQuoteModel = QuoteModel(
      id: '1',
      content: 'Test Quote',
      author: 'Test Author',
      tags: ['tag1'],
    );
    final tQuoteJson = json.encode(tQuoteModel.toJson());
    final tJsonList = [tQuoteJson];

    test(
      'should return List<QuoteModel> from shared preferences',
      () async {
        // arrange
        when(mockSharedPreferences.getStringList(AppConstants.favoritesCacheKey))
            .thenReturn(tJsonList);
        // act
        final result = await repository.getFavoriteQuotes();
        // assert
        expect(result, Success([tQuoteModel]));
        verify(mockSharedPreferences.getStringList(AppConstants.favoritesCacheKey));
        verifyNoMoreInteractions(mockSharedPreferences);
      },
    );

    test(
      'should return empty list if no favorites in shared preferences',
      () async {
        // arrange
        when(mockSharedPreferences.getStringList(AppConstants.favoritesCacheKey))
            .thenReturn(null);
        // act
        final result = await repository.getFavoriteQuotes();
        // assert
        expect(result, const Success(<QuoteModel>[]));
        verify(mockSharedPreferences.getStringList(AppConstants.favoritesCacheKey));
        verifyNoMoreInteractions(mockSharedPreferences);
      },
    );

    test(
      'should return CacheFailure on error',
      () async {
        // arrange
        when(mockSharedPreferences.getStringList(AppConstants.favoritesCacheKey))
            .thenThrow(Exception('Cache Error'));
        // act
        final result = await repository.getFavoriteQuotes();
        // assert
        expect(result, const Error(CacheFailure('Could not retrieve favorites.')));
        verify(mockSharedPreferences.getStringList(AppConstants.favoritesCacheKey));
        verifyNoMoreInteractions(mockSharedPreferences);
      },
    );
  });

  group('saveFavoriteQuote', () {
    final tQuoteModel = QuoteModel(
      id: '1',
      content: 'Test Quote',
      author: 'Test Author',
      tags: ['tag1'],
    );
    final tQuoteJson = json.encode(tQuoteModel.toJson());

    test(
      'should save quote to shared preferences',
      () async {
        // arrange
        when(mockSharedPreferences.getStringList(AppConstants.favoritesCacheKey))
            .thenReturn([]);
        when(mockSharedPreferences.setStringList(
                AppConstants.favoritesCacheKey, any))
            .thenAnswer((_) async => true);
        // act
        final result = await repository.saveFavoriteQuote(tQuoteModel);
        // assert
        expect(result, const Success(unit));
        verify(mockSharedPreferences.getStringList(AppConstants.favoritesCacheKey));
        verify(mockSharedPreferences.setStringList(
            AppConstants.favoritesCacheKey, [tQuoteJson]));
        verifyNoMoreInteractions(mockSharedPreferences);
      },
    );

    test(
      'should not save duplicate quote',
      () async {
        // arrange
        when(mockSharedPreferences.getStringList(AppConstants.favoritesCacheKey))
            .thenReturn([tQuoteJson]);
        // act
        final result = await repository.saveFavoriteQuote(tQuoteModel);
        // assert
        expect(result, const Success(unit));
        verify(mockSharedPreferences.getStringList(AppConstants.favoritesCacheKey));
        verifyNoMoreInteractions(mockSharedPreferences);
      },
    );
  });

  group('removeFavoriteQuote', () {
    final tQuoteModel = QuoteModel(
      id: '1',
      content: 'Test Quote',
      author: 'Test Author',
      tags: ['tag1'],
    );
    final tQuoteJson = json.encode(tQuoteModel.toJson());

    test(
      'should remove quote from shared preferences',
      () async {
        // arrange
        when(mockSharedPreferences.getStringList(AppConstants.favoritesCacheKey))
            .thenReturn([tQuoteJson]);
        when(mockSharedPreferences.setStringList(
                AppConstants.favoritesCacheKey, any))
            .thenAnswer((_) async => true);
        // act
        final result = await repository.removeFavoriteQuote(tQuoteModel.id);
        // assert
        expect(result, const Success(unit));
        verify(mockSharedPreferences.getStringList(AppConstants.favoritesCacheKey));
        verify(mockSharedPreferences.setStringList(
            AppConstants.favoritesCacheKey, []));
        verifyNoMoreInteractions(mockSharedPreferences);
      },
    );

    test(
      'should do nothing if quote not found',
      () async {
        // arrange
        when(mockSharedPreferences.getStringList(AppConstants.favoritesCacheKey))
            .thenReturn([]);
        // act
        final result = await repository.removeFavoriteQuote(tQuoteModel.id);
        // assert
        expect(result, const Success(unit));
        verify(mockSharedPreferences.getStringList(AppConstants.favoritesCacheKey));
        verifyNoMoreInteractions(mockSharedPreferences);
      },
    );
  });

  group('isFavorite', () {
    final tQuoteModel = QuoteModel(
      id: '1',
      content: 'Test Quote',
      author: 'Test Author',
      tags: ['tag1'],
    );
    final tQuoteJson = json.encode(tQuoteModel.toJson());

    test(
      'should return true if quote is favorite',
      () async {
        // arrange
        when(mockSharedPreferences.getStringList(AppConstants.favoritesCacheKey))
            .thenReturn([tQuoteJson]);
        // act
        final result = await repository.isFavorite(tQuoteModel.id);
        // assert
        expect(result, const Success(true));
        verify(mockSharedPreferences.getStringList(AppConstants.favoritesCacheKey));
        verifyNoMoreInteractions(mockSharedPreferences);
      },
    );

    test(
      'should return false if quote is not favorite',
      () async {
        // arrange
        when(mockSharedPreferences.getStringList(AppConstants.favoritesCacheKey))
            .thenReturn([]);
        // act
        final result = await repository.isFavorite(tQuoteModel.id);
        // assert
        expect(result, const Success(false));
        verify(mockSharedPreferences.getStringList(AppConstants.favoritesCacheKey));
        verifyNoMoreInteractions(mockSharedPreferences);
      },
    );
  });
}
