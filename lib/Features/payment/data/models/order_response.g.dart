// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderResponse _$OrderResponseFromJson(Map<String, dynamic> json) =>
    OrderResponse(
      id: (json['id'] as num).toInt(),
      createdAt: json['created_at'] as String,
      deliveryNeeded: json['delivery_needed'] as bool,
      merchant: Merchant.fromJson(json['merchant'] as Map<String, dynamic>),
      amountCents: (json['amount_cents'] as num).toInt(),
      currency: json['currency'] as String,
      orderUrl: json['order_url'] as String,
    );

Map<String, dynamic> _$OrderResponseToJson(OrderResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'created_at': instance.createdAt,
      'delivery_needed': instance.deliveryNeeded,
      'merchant': instance.merchant,
      'amount_cents': instance.amountCents,
      'currency': instance.currency,
      'order_url': instance.orderUrl,
    };

Merchant _$MerchantFromJson(Map<String, dynamic> json) => Merchant(
      id: (json['id'] as num).toInt(),
      createdAt: json['created_at'] as String,
      phones:
          (json['phones'] as List<dynamic>).map((e) => e as String).toList(),
      companyEmails: (json['company_emails'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      companyName: json['company_name'] as String,
    );

Map<String, dynamic> _$MerchantToJson(Merchant instance) => <String, dynamic>{
      'id': instance.id,
      'created_at': instance.createdAt,
      'phones': instance.phones,
      'company_emails': instance.companyEmails,
      'company_name': instance.companyName,
    };
