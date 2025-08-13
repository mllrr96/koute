import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:picked/data/models/quote_model.dart';
import 'package:picked/data/repositories/i_quote_repository.dart';
import 'package:picked/injection.dart';

part 'random_quote_state.dart';

@injectable
class RandomQuoteCubit extends Cubit<RandomQuoteState> {
  static RandomQuoteCubit get init => getIt<RandomQuoteCubit>();
  final IQuoteRepository _repository;

  RandomQuoteCubit(this._repository) : super(RandomQuoteInitial());

  Future<void> fetchRandomQuote() async {
    emit(RandomQuoteLoading());
    final result = await _repository.getRandomQuote();
    result.when(
      (quote) => emit(RandomQuoteLoaded(quote.first)),
      (failure) => emit(RandomQuoteError(failure.message)),
    );
  }
}
