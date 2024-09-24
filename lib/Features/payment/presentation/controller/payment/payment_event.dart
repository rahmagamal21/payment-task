import '../../../domain/entity/payment_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'payment_event.freezed.dart';

@freezed
class PaymentEvent with _$PaymentEvent {
  const factory PaymentEvent.processPayment(OrderEntity order) = ProcessPayment;
}
