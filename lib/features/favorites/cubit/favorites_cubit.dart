import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:picked/data/models/quote_model.dart';
import 'package:picked/data/repositories/i_quote_repository.dart';

part 'favorites_state.dart';

@injectable
class FavoritesCubit extends Cubit<FavoritesState> {
  final IQuoteRepository _repository;

  FavoritesCubit(this._repository) : super(FavoritesInitial());

  Future<void> loadFavorites() async {
    emit(FavoritesLoading());
    final result = await _repository.getFavoriteQuotes();
    result.when(
      (quotes) => emit(FavoritesLoaded(quotes)),
      (failure) => emit(FavoritesError(failure.message)),
    );
  }

  Future<void> toggleFavorite(QuoteModel quote) async {
    final isCurrentlyFavoriteResult = await _repository.isFavorite(quote.id);
     isCurrentlyFavoriteResult.when(
      (isFavorite) async {
        if (isFavorite) {
          await _repository.removeFavoriteQuote(quote.id);
        } else {
          await _repository.saveFavoriteQuote(quote);
        }
        // Reload favorites to reflect changes
        await loadFavorites();
      },
      (failure) => emit(FavoritesError(failure.message)),
    );
  }

  Future<bool> checkIsFavorite(String quoteId) async {
    final result = await _repository.isFavorite(quoteId);
    return result.when(
      (isFavorite) => isFavorite,
      (failure) => false, // Assume not favorite on error
    );
  }
}
