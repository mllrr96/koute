part of 'random_quote_cubit.dart';

abstract class RandomQuoteState extends Equatable {
  const RandomQuoteState();

  @override
  List<Object> get props => [];
}

class RandomQuoteInitial extends RandomQuoteState {}

class RandomQuoteLoading extends RandomQuoteState {}

class RandomQuoteLoaded extends RandomQuoteState {
  final QuoteModel quote;

  const RandomQuoteLoaded(this.quote);

  @override
  List<Object> get props => [quote];
}

class RandomQuoteError extends RandomQuoteState {
  final String message;

  const RandomQuoteError(this.message);

  @override
  List<Object> get props => [message];
}
