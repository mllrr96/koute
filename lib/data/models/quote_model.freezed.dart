// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'quote_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$QuoteModel {
  @JsonKey(name: '_id')
  String get id;
  String get content;
  String get author;
  List<String> get tags;
  String? get authorSlug;
  int? get length;
  String? get dateAdded;
  String? get dateModified;

  /// Create a copy of QuoteModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $QuoteModelCopyWith<QuoteModel> get copyWith =>
      _$QuoteModelCopyWithImpl<QuoteModel>(this as QuoteModel, _$identity);

  /// Serializes this QuoteModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is QuoteModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.author, author) || other.author == author) &&
            const DeepCollectionEquality().equals(other.tags, tags) &&
            (identical(other.authorSlug, authorSlug) ||
                other.authorSlug == authorSlug) &&
            (identical(other.length, length) || other.length == length) &&
            (identical(other.dateAdded, dateAdded) ||
                other.dateAdded == dateAdded) &&
            (identical(other.dateModified, dateModified) ||
                other.dateModified == dateModified));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      content,
      author,
      const DeepCollectionEquality().hash(tags),
      authorSlug,
      length,
      dateAdded,
      dateModified);

  @override
  String toString() {
    return 'QuoteModel(id: $id, content: $content, author: $author, tags: $tags, authorSlug: $authorSlug, length: $length, dateAdded: $dateAdded, dateModified: $dateModified)';
  }
}

/// @nodoc
abstract mixin class $QuoteModelCopyWith<$Res> {
  factory $QuoteModelCopyWith(
          QuoteModel value, $Res Function(QuoteModel) _then) =
      _$QuoteModelCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: '_id') String id,
      String content,
      String author,
      List<String> tags,
      String? authorSlug,
      int? length,
      String? dateAdded,
      String? dateModified});
}

/// @nodoc
class _$QuoteModelCopyWithImpl<$Res> implements $QuoteModelCopyWith<$Res> {
  _$QuoteModelCopyWithImpl(this._self, this._then);

  final QuoteModel _self;
  final $Res Function(QuoteModel) _then;

  /// Create a copy of QuoteModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? content = null,
    Object? author = null,
    Object? tags = null,
    Object? authorSlug = freezed,
    Object? length = freezed,
    Object? dateAdded = freezed,
    Object? dateModified = freezed,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _self.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      author: null == author
          ? _self.author
          : author // ignore: cast_nullable_to_non_nullable
              as String,
      tags: null == tags
          ? _self.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>,
      authorSlug: freezed == authorSlug
          ? _self.authorSlug
          : authorSlug // ignore: cast_nullable_to_non_nullable
              as String?,
      length: freezed == length
          ? _self.length
          : length // ignore: cast_nullable_to_non_nullable
              as int?,
      dateAdded: freezed == dateAdded
          ? _self.dateAdded
          : dateAdded // ignore: cast_nullable_to_non_nullable
              as String?,
      dateModified: freezed == dateModified
          ? _self.dateModified
          : dateModified // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// Adds pattern-matching-related methods to [QuoteModel].
extension QuoteModelPatterns on QuoteModel {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_QuoteModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _QuoteModel() when $default != null:
        return $default(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_QuoteModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _QuoteModel():
        return $default(_that);
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_QuoteModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _QuoteModel() when $default != null:
        return $default(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            @JsonKey(name: '_id') String id,
            String content,
            String author,
            List<String> tags,
            String? authorSlug,
            int? length,
            String? dateAdded,
            String? dateModified)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _QuoteModel() when $default != null:
        return $default(
            _that.id,
            _that.content,
            _that.author,
            _that.tags,
            _that.authorSlug,
            _that.length,
            _that.dateAdded,
            _that.dateModified);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
            @JsonKey(name: '_id') String id,
            String content,
            String author,
            List<String> tags,
            String? authorSlug,
            int? length,
            String? dateAdded,
            String? dateModified)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _QuoteModel():
        return $default(
            _that.id,
            _that.content,
            _that.author,
            _that.tags,
            _that.authorSlug,
            _that.length,
            _that.dateAdded,
            _that.dateModified);
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
            @JsonKey(name: '_id') String id,
            String content,
            String author,
            List<String> tags,
            String? authorSlug,
            int? length,
            String? dateAdded,
            String? dateModified)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _QuoteModel() when $default != null:
        return $default(
            _that.id,
            _that.content,
            _that.author,
            _that.tags,
            _that.authorSlug,
            _that.length,
            _that.dateAdded,
            _that.dateModified);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _QuoteModel implements QuoteModel {
  const _QuoteModel(
      {@JsonKey(name: '_id') required this.id,
      required this.content,
      required this.author,
      required final List<String> tags,
      this.authorSlug,
      this.length,
      this.dateAdded,
      this.dateModified})
      : _tags = tags;
  factory _QuoteModel.fromJson(Map<String, dynamic> json) =>
      _$QuoteModelFromJson(json);

  @override
  @JsonKey(name: '_id')
  final String id;
  @override
  final String content;
  @override
  final String author;
  final List<String> _tags;
  @override
  List<String> get tags {
    if (_tags is EqualUnmodifiableListView) return _tags;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tags);
  }

  @override
  final String? authorSlug;
  @override
  final int? length;
  @override
  final String? dateAdded;
  @override
  final String? dateModified;

  /// Create a copy of QuoteModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$QuoteModelCopyWith<_QuoteModel> get copyWith =>
      __$QuoteModelCopyWithImpl<_QuoteModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$QuoteModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _QuoteModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.author, author) || other.author == author) &&
            const DeepCollectionEquality().equals(other._tags, _tags) &&
            (identical(other.authorSlug, authorSlug) ||
                other.authorSlug == authorSlug) &&
            (identical(other.length, length) || other.length == length) &&
            (identical(other.dateAdded, dateAdded) ||
                other.dateAdded == dateAdded) &&
            (identical(other.dateModified, dateModified) ||
                other.dateModified == dateModified));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      content,
      author,
      const DeepCollectionEquality().hash(_tags),
      authorSlug,
      length,
      dateAdded,
      dateModified);

  @override
  String toString() {
    return 'QuoteModel(id: $id, content: $content, author: $author, tags: $tags, authorSlug: $authorSlug, length: $length, dateAdded: $dateAdded, dateModified: $dateModified)';
  }
}

/// @nodoc
abstract mixin class _$QuoteModelCopyWith<$Res>
    implements $QuoteModelCopyWith<$Res> {
  factory _$QuoteModelCopyWith(
          _QuoteModel value, $Res Function(_QuoteModel) _then) =
      __$QuoteModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: '_id') String id,
      String content,
      String author,
      List<String> tags,
      String? authorSlug,
      int? length,
      String? dateAdded,
      String? dateModified});
}

/// @nodoc
class __$QuoteModelCopyWithImpl<$Res> implements _$QuoteModelCopyWith<$Res> {
  __$QuoteModelCopyWithImpl(this._self, this._then);

  final _QuoteModel _self;
  final $Res Function(_QuoteModel) _then;

  /// Create a copy of QuoteModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? content = null,
    Object? author = null,
    Object? tags = null,
    Object? authorSlug = freezed,
    Object? length = freezed,
    Object? dateAdded = freezed,
    Object? dateModified = freezed,
  }) {
    return _then(_QuoteModel(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _self.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      author: null == author
          ? _self.author
          : author // ignore: cast_nullable_to_non_nullable
              as String,
      tags: null == tags
          ? _self._tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>,
      authorSlug: freezed == authorSlug
          ? _self.authorSlug
          : authorSlug // ignore: cast_nullable_to_non_nullable
              as String?,
      length: freezed == length
          ? _self.length
          : length // ignore: cast_nullable_to_non_nullable
              as int?,
      dateAdded: freezed == dateAdded
          ? _self.dateAdded
          : dateAdded // ignore: cast_nullable_to_non_nullable
              as String?,
      dateModified: freezed == dateModified
          ? _self.dateModified
          : dateModified // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on
