// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:supabase_flutter/supabase_flutter.dart' as _i454;

import 'core/repository.dart' as _i717;
import 'core/spec/data/spec_repository.dart' as _i349;
import 'features/auth/data/auth.dart' as _i201;
import 'features/public/data/public_repository.dart' as _i545;
import 'supa_module.dart' as _i737;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final injectableModule = _$InjectableModule();
    gh.factory<_i349.SpecRepository>(() => _i349.SpecRepository());
    gh.lazySingleton<_i717.Repository>(() => _i717.Repository());
    gh.lazySingleton<_i454.Supabase>(() => injectableModule.supabase);
    gh.singleton<_i201.Auth>(() => _i201.Auth(gh<_i454.Supabase>()));
    gh.singleton<_i545.PublicRepository>(
      () => _i545.PublicRepository(gh<_i454.Supabase>()),
    );
    return this;
  }
}

class _$InjectableModule extends _i737.InjectableModule {}
