import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../../../../core/error/failure.dart';
import '../../../domain/entity/payment_entity.dart';
import '../../../domain/use case/payment_use_case.dart';
import 'payment_event.dart';
import 'payment_state.dart';

@injectable
class PaymentBloc extends Bloc<PaymentEvent, PaymentState> {
  final ProcessPaymentUseCase processPaymentUseCase;

  PaymentBloc({required this.processPaymentUseCase})
      : super(const PaymentState.initial()) {
    on<ProcessPayment>(_onProcessPayment);
  }

  Future<void> _onProcessPayment(
      ProcessPayment event, Emitter<PaymentState> emit) async {
    emit(const PaymentState.loading());
    final Either<Failure, PaymentKey> failureOrPaymentKey =
        (await processPaymentUseCase(event.order));

    failureOrPaymentKey.fold(
      (failure) => emit(PaymentState.failure(failure.message)),
      (paymentKey) => emit(PaymentState.success(paymentKey)),
    );
  }
}
