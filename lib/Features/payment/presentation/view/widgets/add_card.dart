import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../../core/common/res/colors.dart';
import '../../../../../generated/l10n.dart';
import '../../../domain/entity/payment_entity.dart';
import '../../controller/payment/payment_bloc.dart';
import '../../controller/payment/payment_event.dart';
import '../../controller/payment/payment_state.dart';
class AddCard extends StatelessWidget {
  const AddCard({
    super.key,
    required this.order,
  });

  final OrderEntity order;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PaymentBloc, PaymentState>(
      listener: (context, state) async {
        if (state is Success) {
          final paymentUrl =
              "https://accept.paymob.com/api/acceptance/iframes/870669?payment_token=${state.paymentKey.token}";
          await launchUrl(Uri.parse(paymentUrl));
        } else if (state is Failure) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Failure'),
            ),
          );
        }
      },
      builder: (context, state) {
        if (state is Loading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return InkWell(
            onTap: () => context
                .read<PaymentBloc>()
                .add(PaymentEvent.processPayment(order)),
            child: Text(
              S.of(context).add_new_card,
              style: TextStyle(
                color: AllColors.gold,
                fontSize: 10.sp,
                fontWeight: FontWeight.w400,
              ),
            ),
          );
        }
      },
    );
  }
}
