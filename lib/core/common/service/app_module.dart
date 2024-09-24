import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:payment/Features/payment/data/service/paymob_service.dart';

import '../../../Features/payment/data/repository/payment_repo_imp.dart';
import '../../../Features/payment/domain/use case/payment_use_case.dart';

@module
abstract class PaymentModule {
  @lazySingleton
  Dio get dio => Dio();

  @singleton
  PaymobService get paymobService => PaymobService(dio);
  @singleton
  PaymentRepositoryImpl get paymentRepositoryImpl =>
      PaymentRepositoryImpl(paymobService);
  @singleton
  ProcessPaymentUseCase get processPaymentUseCase =>
      ProcessPaymentUseCase(repository: paymentRepositoryImpl);
}
