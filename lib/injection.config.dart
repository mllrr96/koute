// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:shared_preferences/shared_preferences.dart' as _i460;

import 'data/api/quotable_api_service.dart' as _i60;
import 'data/repositories/i_quote_repository.dart' as _i352;
import 'data/repositories/quote_repository.dart' as _i465;
import 'features/detail/cubit/random_quote_cubit.dart' as _i116;
import 'features/explore/bloc/explore_bloc.dart' as _i122;
import 'features/favorites/cubit/favorites_cubit.dart' as _i440;
import 'injection_module.dart' as _i212;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final registerModule = _$RegisterModule();
    await gh.factoryAsync<_i460.SharedPreferences>(
      () => registerModule.prefs,
      preResolve: true,
    );
    gh.lazySingleton<_i361.Dio>(() => registerModule.dio);
    gh.lazySingleton<_i60.QuotableApiService>(
        () => _i60.QuotableApiService(gh<_i361.Dio>()));
    gh.lazySingleton<_i352.IQuoteRepository>(() => _i465.QuoteRepository(
          gh<_i60.QuotableApiService>(),
          gh<_i460.SharedPreferences>(),
        ));
    gh.factory<_i116.RandomQuoteCubit>(
        () => _i116.RandomQuoteCubit(gh<_i352.IQuoteRepository>()));
    gh.factory<_i122.ExploreBloc>(
        () => _i122.ExploreBloc(gh<_i352.IQuoteRepository>()));
    gh.factory<_i440.FavoritesCubit>(
        () => _i440.FavoritesCubit(gh<_i352.IQuoteRepository>()));
    return this;
  }
}

class _$RegisterModule extends _i212.RegisterModule {}
