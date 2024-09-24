import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../models/auth_response.dart';
import '../models/order_response.dart';
import '../models/payment_key_response.dart';

part 'paymob_service.g.dart';

@RestApi(baseUrl: "https://accept.paymobsolutions.com/api")
abstract class PaymobService {
  factory PaymobService(Dio dio, {String baseUrl}) = _PaymobService;

  @POST("/auth/tokens")
  Future<AuthResponse> getAuthToken(@Body() Map<String, dynamic> body);

  @POST("/ecommerce/orders")
  Future<OrderResponse> registerOrder(
      @Header("Authorization") String authToken,
      @Body() Map<String, dynamic> body);

  @POST("/acceptance/payment_keys")
  Future<PaymentKeyResponse> generatePaymentKey(
       @Header("Authorization") String authToken,
      @Body() Map<String, dynamic> body);
}
