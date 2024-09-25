import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:payment/Features/payment/presentation/view/widgets/add_card.dart';

import '../../../../../core/common/res/colors.dart';
import '../../../../../generated/l10n.dart';
import '../../../domain/entity/payment_entity.dart';
import '../../controller/payment_provider.dart';
import 'payment_methods.dart';

class PaymentColumn extends StatelessWidget {
  const PaymentColumn({
    super.key,
    required this.order,
    required this.paymentProvider,
  });

  final OrderEntity order;
  final PaymentProvider paymentProvider;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        PaymentMethods(
          title: S.of(context).wallet_balance,
          desc: Text(
            '1200 جنية',
            style: TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w700,
              color: AllColors.gold,
            ),
          ),
          image: 'assets/images/wallet-check2.png',
          iselected: paymentProvider.selectedPaymentMethodIndex == 0,
          onTap: () => paymentProvider.selectPaymentMethod(0),
        ),
        SizedBox(
          height: 20.h,
        ),
        PaymentMethods(
          title: S.of(context).electronic_payment_card,
          desc: Text(
            '1245 **** **** ****',
            style: TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w700,
              color: AllColors.gold,
            ),
          ),
          image: 'assets/images/card2.png',
          iselected: paymentProvider.selectedPaymentMethodIndex == 1,
          isCard: true,
          onTap: () => paymentProvider.selectPaymentMethod(1),
        ),
        SizedBox(
          height: 10.h,
        ),
        AddCard(order: order),
        SizedBox(
          height: 20.h,
        ),
        PaymentMethods(
          title: S.of(context).electronic_wallet,
          desc: Row(
            children: [
              Image.asset('assets/images/p3.png'),
              SizedBox(
                width: 2.w,
              ),
              Image.asset('assets/images/p4.png'),
              SizedBox(
                width: 2.w,
              ),
              Image.asset('assets/images/p5.png'),
              SizedBox(
                width: 2.w,
              ),
              Image.asset('assets/images/p6.png'),
              SizedBox(
                width: 2.w,
              ),
              Image.asset('assets/images/p7.png'),
              SizedBox(
                width: 2.w,
              ),
              Image.asset('assets/images/p8.png'),
            ],
          ),
          image: 'assets/images/money-send2.png',
          iselected: paymentProvider.selectedPaymentMethodIndex == 2,
          onTap: () => paymentProvider.selectPaymentMethod(2),
        ),
      ],
    );
  }
}
