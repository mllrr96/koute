part of 'favorites_cubit.dart';

abstract class FavoritesState extends Equatable {
  const FavoritesState();

  @override
  List<Object> get props => [];
}

class FavoritesInitial extends FavoritesState {}

class FavoritesLoading extends FavoritesState {}

class FavoritesEmpty extends FavoritesState {}

class FavoritesLoaded extends FavoritesState {
  final List<QuoteModel> quotes;

  const FavoritesLoaded(this.quotes);

  @override
  List<Object> get props => [quotes];
}

class FavoritesError extends FavoritesState {
  final String message;

  const FavoritesError(this.message);

  @override
  List<Object> get props => [message];
}
