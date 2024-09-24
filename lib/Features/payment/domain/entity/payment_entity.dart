// class PaymentEntity {
//   final String paymentToken;
//   final String orderId;

//   PaymentEntity({
//     required this.paymentToken,
//     required this.orderId,
//   });
// }

class OrderEntity {
  final int amountCents;
  final String currency;

  OrderEntity({
    required this.amountCents,
    required this.currency,
  });

  Map<String, dynamic> toJson() {
    return {
      "amount_cents": amountCents,
      "currency": currency,
    };
  }
}

class PaymentKey {
  final String token;

  PaymentKey({required this.token});
}
