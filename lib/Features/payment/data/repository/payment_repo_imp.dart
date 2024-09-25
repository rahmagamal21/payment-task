import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:payment/Features/payment/domain/entity/payment_entity.dart';
import 'package:payment/core/common/res/constatnts.dart';

import '../../../../core/error/failure.dart';
import '../../domain/repository/base_payment_repo.dart';
import '../service/paymob_service.dart';

class PaymentRepositoryImpl implements PaymentRepository {
  final PaymobService apiService;

  PaymentRepositoryImpl(this.apiService);

  @override
  Future<Either<Failure, PaymentKey>> processPayment(OrderEntity order) async {
    try {
      // 1. Authenticate
      final authResponse = await apiService.getAuthToken({
        "api_key": Constants.kpayMob,
      });

      // 2. Register Order
      final orderResponse = await apiService.registerOrder(
          "Bearer ${authResponse.token}", order.toJson());

      // 3. Request Payment Key
      final paymentKeyData = {
        "expiration": 3600,
        "auth_token": authResponse.token,
        "order_id": orderResponse.id.toString(),
        "integration_id": 4840182,
        "amount_cents": order.amountCents,
        "currency": order.currency,
        "billing_data": {
          "first_name": "Clifford",
          "last_name": "Nicolas",
          "email": "claudette09@exa.com",
          "phone_number": "+86(8)9135210487",
          "apartment": "NA",
          "floor": "NA",
          "street": "NA",
          "building": "NA",
          "shipping_method": "NA",
          "postal_code": "NA",
          "city": "NA",
          "country": "NA",
          "state": "NA",
        },
      };
      final paymentKeyResponse = await apiService.generatePaymentKey(
          "Bearer ${authResponse.token}", paymentKeyData);

      return Right(PaymentKey(token: paymentKeyResponse.token));
    } on DioException catch (e) {
      return Left(ServerFailure(
          e.response?.data['message'] ?? 'An unexpected error occurred'));
    }
  }

  // @override
  // Future<AuthResponse> generateAuthToken() async {
  //   final authResponse =
  //       await apiService.getAuthToken({"api_key": Constants.kpayMob});
  //   return authResponse;
  // }

  // @override
  // Future<OrderResponse> createOrder(int amount) async {
  //   final authToken = await generateAuthToken();
  //   final orderResponse = await apiService.registerOrder(
  //     "Bearer $authToken",
  //     {
  //       // "auth_token": authToken,
  //       // "amount_cents": amount * 100,
  //       // "currency": "EGP",

  //       // "data": [
  //       //   {
  //       //     "payfor": "extend",
  //       //     "type": [0, 1],
  //       //     "amount": "1476",
  //       //     "consultation_id": "2896",
  //       //     "extend_id": "3"
  //       //   }
  //       // ]

  //       "delivery_needed": "false",
  //       "amount_cents": amount * 100,
  //       "currency": "EGP",
  //       "items": [],
  //     },
  //   );
  //   return orderResponse;
  // }

  // @override
  // Future<PaymentKeyResponse> generatePaymentKey(
  //     int amount, String orderId) async {
  //   final authToken = await generateAuthToken();
  //   final paymentKeyResponse = await apiService.generatePaymentKey(
  //     authToken,
  //     {
  //       //ALL OF THEM ARE REQIERD
  //       "expiration": 3600,

  //       "auth_token": authToken//From First Api
  //       "order_id":orderResponse.id.toString(),//From Second Api  >>(STRING)<<
  //       "integration_id": 4839998,//Integration Id Of The Payment Method

  //       "amount_cents":order.amountCents,
  //       "currency": order.currency,

  //       "billing_data": {
  //         //Have To Be Values
  //         "first_name": "Clifford",
  //         "last_name": "Nicolas",
  //         "email": "claudette09@exa.com",
  //         "phone_number": "+86(8)9135210487",

  //         //Can Set "NA"
  //         "apartment": "NA",
  //         "floor": "NA",
  //         "street": "NA",
  //         "building": "NA",
  //         "shipping_method": "NA",
  //         "postal_code": "NA",
  //         "city": "NA",
  //         "country": "NA",
  //         "state": "NA"
  //       },
  //     };
  //     // {
  //     //   //"auth_token": authToken,
  //     //   "amount_cents": amount * 100,
  //     //   // "currency": "EGP",
  //     //   // "order_id": orderId,
  //     //   // "expiration": "3600",
  //     //   // "billing_data": {
  //     //   //   "apartment": "NA",
  //     //   //   "email": "user@gmail.com",
  //     //   //   "floor": "NA",
  //     //   //   "first_name": "new",
  //     //   //   "street": "NA",
  //     //   //   "building": "NA",
  //     //   //   "phone_number": "+201987654321",
  //     //   //   "shipping_method": "NA",
  //     //   //   "postal_code": "NA",
  //     //   //   "city": "Tanta",
  //     //   //   "country": "Egypt",
  //     //   //   "last_name": "user",
  //     //   //   "state": "NA"
  //     //   // },
  //     //   // "integration_id": "1741458",
  //     //   // "data": "3",
  //     //   // "lock_order_when_paid": "false"

  //     //   "expiration": 3600,
  //     //   "order_id": orderId,
  //     //   "billing_data": {
  //     //     "apartment": "NA",
  //     //     "email": "example@example.com",
  //     //     "floor": "NA",
  //     //     "first_name": "First",
  //     //     "last_name": "Last",
  //     //     "phone_number": "+201234567890",
  //     //     "city": "City",
  //     //     "country": "EGY",
  //     //     "street": "Street",
  //     //   },
  //     //   "currency": "EGP",
  //     //   "integration_id": "your_integration_id"
  //     // },
  //   );
  //   return paymentKeyResponse;
  // }
}
