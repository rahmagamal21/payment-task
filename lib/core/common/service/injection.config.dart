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
import 'package:payment/core/common/service/app_module.dart' as _i593;
import 'package:payment/Features/payment/data/repository/payment_repo_imp.dart'
    as _i1065;
import 'package:payment/Features/payment/data/service/paymob_service.dart'
    as _i425;
import 'package:payment/Features/payment/domain/use%20case/payment_use_case.dart'
    as _i68;
import 'package:payment/Features/payment/presentation/controller/payment/payment_bloc.dart'
    as _i904;

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
    final paymentModule = _$PaymentModule();
    gh.singleton<_i425.PaymobService>(() => paymentModule.paymobService);
    gh.singleton<_i1065.PaymentRepositoryImpl>(
        () => paymentModule.paymentRepositoryImpl);
    gh.singleton<_i68.ProcessPaymentUseCase>(
        () => paymentModule.processPaymentUseCase);
    gh.lazySingleton<_i361.Dio>(() => paymentModule.dio);
    gh.factory<_i904.PaymentBloc>(() => _i904.PaymentBloc(
        processPaymentUseCase: gh<_i68.ProcessPaymentUseCase>()));
    return this;
  }
}

class _$PaymentModule extends _i593.PaymentModule {}
