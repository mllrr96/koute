part of 'explore_bloc.dart';

sealed class ExploreState extends Equatable {
  const ExploreState();

  @override
  List<Object> get props => [];
}

class ExploreInitial extends ExploreState {}

class TagsLoading extends ExploreState {}

class TagsLoaded extends ExploreState {
  final List<TagModel> tags;
  final String? selectedTag;

  const TagsLoaded(this.tags, this.selectedTag);

  @override
  List<Object> get props => [tags, selectedTag ?? ''];
}

class TagsError extends ExploreState {
  final String message;

  const TagsError(this.message);

  @override
  List<Object> get props => [message];
}
