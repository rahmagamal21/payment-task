import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../entity/payment_entity.dart';

abstract class PaymentRepository {
  Future<Either<Failure, PaymentKey>> processPayment(OrderEntity order);
}
