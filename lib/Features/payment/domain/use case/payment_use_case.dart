import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../entity/payment_entity.dart';
import '../repository/base_payment_repo.dart';

class ProcessPaymentUseCase {
  final PaymentRepository repository;

  ProcessPaymentUseCase({required this.repository});

  Future<Either<Failure, PaymentKey>> call(OrderEntity order) async {
    return await repository.processPayment(order);
  }
}
