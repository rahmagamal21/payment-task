import 'package:json_annotation/json_annotation.dart';

part 'order_response.g.dart';

@JsonSerializable()
class OrderResponse {
  final int id;
  @JsonKey(name: 'created_at')
  final String createdAt;
  @JsonKey(name: 'delivery_needed')
  final bool deliveryNeeded;
  final Merchant merchant;
  @JsonKey(name: 'amount_cents')
  final int amountCents;
  final String currency;
  @JsonKey(name: 'order_url')
  final String orderUrl;
  // Add other fields as needed

  OrderResponse({
    required this.id,
    required this.createdAt,
    required this.deliveryNeeded,
    required this.merchant,
    required this.amountCents,
    required this.currency,
    required this.orderUrl,
    // Initialize other fields
  });

  factory OrderResponse.fromJson(Map<String, dynamic> json) =>
      _$OrderResponseFromJson(json);
  Map<String, dynamic> toJson() => _$OrderResponseToJson(this);
}

@JsonSerializable()
class Merchant {
  final int id;
  @JsonKey(name: 'created_at')
  final String createdAt;
  final List<String> phones;
  @JsonKey(name: 'company_emails')
  final List<String> companyEmails;
  @JsonKey(name: 'company_name')
  final String companyName;

  Merchant({
    required this.id,
    required this.createdAt,
    required this.phones,
    required this.companyEmails,
    required this.companyName,
    // Initialize other fields
  });

  factory Merchant.fromJson(Map<String, dynamic> json) =>
      _$MerchantFromJson(json);
  Map<String, dynamic> toJson() => _$MerchantToJson(this);
}
