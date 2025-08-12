import 'package:flutter_test/flutter_test.dart';
import 'package:picked/data/models/quote_model.dart';

void main() {
  group('QuoteModel', () {
    test('fromJson should correctly parse JSON', () {
      final Map<String, dynamic> jsonMap = {
        '_id': '123',
        'content': 'Test quote content',
        'author': 'Test Author',
        'tags': ['tag1', 'tag2'],
        'authorSlug': 'test-author',
        'length': 20,
        'dateAdded': '2023-01-01',
        'dateModified': '2023-01-02',
      };

      final quote = QuoteModel.fromJson(jsonMap);

      expect(quote.id, '123');
      expect(quote.content, 'Test quote content');
      expect(quote.author, 'Test Author');
      expect(quote.tags, ['tag1', 'tag2']);
      expect(quote.authorSlug, 'test-author');
      expect(quote.length, 20);
      expect(quote.dateAdded, '2023-01-01');
      expect(quote.dateModified, '2023-01-02');
    });

    test('toJson should correctly convert to JSON', () {
      const quote = QuoteModel(
        id: '123',
        content: 'Test quote content',
        author: 'Test Author',
        tags: ['tag1', 'tag2'],
        authorSlug: 'test-author',
        length: 20,
        dateAdded: '2023-01-01',
        dateModified: '2023-01-02',
      );

      final jsonMap = quote.toJson();

      expect(jsonMap['_id'], '123');
      expect(jsonMap['content'], 'Test quote content');
      expect(jsonMap['author'], 'Test Author');
      expect(jsonMap['tags'], ['tag1', 'tag2']);
      expect(jsonMap['authorSlug'], 'test-author');
      expect(jsonMap['length'], 20);
      expect(jsonMap['dateAdded'], '2023-01-01');
      expect(jsonMap['dateModified'], '2023-01-02');
    });

    test('fromJson should handle missing optional fields', () {
      final Map<String, dynamic> jsonMap = {
        '_id': '456',
        'content': 'Another quote',
        'author': 'Another Author',
        'tags': [],
      };

      final quote = QuoteModel.fromJson(jsonMap);

      expect(quote.id, '456');
      expect(quote.content, 'Another quote');
      expect(quote.author, 'Another Author');
      expect(quote.tags, []);
      expect(quote.authorSlug, isNull);
      expect(quote.length, isNull);
      expect(quote.dateAdded, isNull);
      expect(quote.dateModified, isNull);
    });
  });
}
