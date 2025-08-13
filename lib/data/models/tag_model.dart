// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'tag_model.freezed.dart';
part 'tag_model.g.dart';

@freezed
sealed class TagModel with _$TagModel {
  const TagModel._();
  const factory TagModel({
    @JsonKey(name: '_id') required String id,
    required String name,
    required int quoteCount,
  }) = _TagModel;

  factory TagModel.fromJson(Map<String, dynamic> json) =>
      _$TagModelFromJson(json);
}
