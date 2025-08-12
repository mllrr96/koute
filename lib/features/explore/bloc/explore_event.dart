part of 'explore_bloc.dart';

abstract class ExploreEvent extends Equatable {
  const ExploreEvent();

  @override
  List<Object> get props => [];
}

class LoadTags extends ExploreEvent {}

class SelectTag extends ExploreEvent {
  final String tag;

  const SelectTag(this.tag);

  @override
  List<Object> get props => [tag];
}

class FetchQuotes extends ExploreEvent {
  final int pageKey;

  const FetchQuotes({required this.pageKey});

  @override
  List<Object> get props => [pageKey];
}
