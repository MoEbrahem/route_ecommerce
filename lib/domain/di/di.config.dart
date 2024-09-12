// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../data/apiManager.dart' as _i636;
import '../../data/data_sources/remote_data_source/auth_remote_data_source.dart'
    as _i45;
import '../../data/data_sources/remote_data_source/auth_remote_data_source_impl.dart'
    as _i373;
import '../../data/repository/auth_repository_impl.dart' as _i581;
import '../../features/authpresentationscreen/login/cubit/login_view_model.dart'
    as _i659;
import '../../features/authpresentationscreen/register/cubit/register_view_model.dart'
    as _i376;
import '../repository/auth_repository.dart' as _i106;
import '../usecases/loginUseCase.dart' as _i885;
import '../usecases/registerUseCase.dart' as _i856;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.singleton<_i636.ApiManager>(() => _i636.ApiManager());
    gh.factory<_i45.AuthRemoteDataSource>(() =>
        _i373.AuthRemoteDataSourceImpl(apiManager: gh<_i636.ApiManager>()));
    gh.factory<_i106.AuthRepository>(() => _i581.AuthRepositoryImpl(
        authRemoteDataSource: gh<_i45.AuthRemoteDataSource>()));
    gh.factory<_i885.LoginUseCase>(
        () => _i885.LoginUseCase(authRepository: gh<_i106.AuthRepository>()));
    gh.factory<_i856.RegisterUseCase>(() =>
        _i856.RegisterUseCase(authRepository: gh<_i106.AuthRepository>()));
    gh.factory<_i659.LoginViewModel>(
        () => _i659.LoginViewModel(loginUseCase: gh<_i885.LoginUseCase>()));
    gh.factory<_i376.RegisterViewModel>(() =>
        _i376.RegisterViewModel(registerUseCase: gh<_i856.RegisterUseCase>()));
    return this;
  }
}
