import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:injectable/injectable.dart';
import 'package:picked/data/models/quote_model.dart';
import 'package:picked/data/models/tag_model.dart';
import 'package:picked/data/repositories/i_quote_repository.dart';

part 'explore_event.dart';
part 'explore_state.dart';

@injectable
class ExploreBloc extends Bloc<ExploreEvent, ExploreState> {
  final IQuoteRepository _repository;
  late final PagingController<int, QuoteModel> pagingController =
      PagingController(
    getNextPageKey: (state) =>
        state.lastPageIsEmpty ? null : state.nextIntPageKey,
    fetchPage: _fetchPage,
  );

  String? _selectedTag;
  List<TagModel> _allTags = [];

  ExploreBloc(this._repository) : super(ExploreInitial()) {
    on<LoadTags>(_onLoadTags);
    on<SelectTag>(_onSelectTag);
  }

  Future<void> _onLoadTags(LoadTags event, Emitter<ExploreState> emit) async {
    emit(TagsLoading());
    final result = await _repository.getTags();
    result.when(
      (tags) {
        _allTags = [TagModel(id: 'all', name: 'All', quoteCount: 0), ...tags];
        emit(TagsLoaded(_allTags, _selectedTag));
        // Initial fetch of quotes after tags are loaded
        pagingController.refresh();
      },
      (failure) => emit(TagsError(failure.message)),
    );
  }

  void _onSelectTag(SelectTag event, Emitter<ExploreState> emit) {
    _selectedTag = event.tag == 'All' ? null : event.tag;
    emit(TagsLoaded(_allTags, _selectedTag));
    pagingController.refresh(); // Refresh quotes for the new tag
  }

  Future<List<QuoteModel>> _fetchPage(int pageKey) async {
    final result = await _repository.getQuotes(
      tags: _selectedTag,
      page: pageKey,
    );

    return result.when(
      (quotes) {
        return quotes;
      },
      (failure) {
        throw Exception(failure.message);
      },
    );
  }

  @override
  Future<void> close() {
    pagingController.dispose();
    return super.close();
  }
}
