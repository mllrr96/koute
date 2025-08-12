// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'quote_model.freezed.dart';

part 'quote_model.g.dart';

@freezed
sealed class QuoteModel with _$QuoteModel {
  const factory QuoteModel({
    @JsonKey(name: '_id') required String id,
    required String content,
    required String author,
    required List<String> tags,
    String? authorSlug,
    int? length,
    String? dateAdded,
    String? dateModified,
  }) = _QuoteModel;

  factory QuoteModel.fromJson(Map<String, dynamic> json) =>
      _$QuoteModelFromJson(json);

}
