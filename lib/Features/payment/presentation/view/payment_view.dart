import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:payment/Features/payment/presentation/controller/payment/payment_event.dart';
import 'package:payment/Features/payment/presentation/view/widgets/payment_methods.dart';
import 'package:payment/Features/payment/presentation/view/widgets/price_button.dart';
import 'package:svg_flutter/svg.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../core/common/res/colors.dart';
import '../../../../generated/l10n.dart';
import '../../domain/entity/payment_entity.dart';
import '../controller/payment/payment_bloc.dart';
import '../controller/payment/payment_state.dart';
import 'widgets/confirmatio_button.dart';
import 'widgets/details_row.dart';

class PaymentView extends StatelessWidget {
  const PaymentView({super.key});

  @override
  Widget build(BuildContext context) {
    final order = OrderEntity(amountCents: 10000, currency: "EGP");
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: Text(
            S.of(context).payment,
            style: TextStyle(
                fontSize: 20.sp,
                fontWeight: FontWeight.w400,
                color: AllColors.mainColor),
          ),
          centerTitle: true,
          actions: [
            Padding(
              padding: EdgeInsets.only(left: 16.w, top: 15.h),
              child: SvgPicture.asset(
                'assets/images/Group icon.svg',
                width: 55.w,
                height: 55.h,
              ),
            ),
          ],
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 20.w,
            vertical: 30.h,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Stack(
                clipBehavior: Clip.none,
                alignment: AlignmentDirectional.bottomCenter,
                children: [
                  Material(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    elevation: 0.5,
                    child: Container(
                      height: 193.h,
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            S.of(context).receipt_details,
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                              color: AllColors.gold,
                            ),
                          ),
                          SizedBox(
                            height: 30.h,
                          ),
                          DetailsRow(
                            title: S.of(context).general_consultation_type,
                            type: 'قانون جنائي',
                          ),
                          SizedBox(
                            height: 12.h,
                          ),
                          DetailsRow(
                            title: S.of(context).sub_type_of_consultation,
                            type: 'تحرش',
                          ),
                        ],
                      ),
                    ),
                  ),
                  const Positioned(
                    bottom: -20,
                    child: PriceButton(),
                  ),
                ],
              ),
              SizedBox(
                height: 60.h,
              ),
              Column(
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
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  BlocConsumer<PaymentBloc, PaymentState>(
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
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  PaymentMethods(
                    title: S.of(context).electronic_wallet,
                    desc: Row(
                      children: [
                        SvgPicture.asset('assets/images/image3.svg'),
                        SizedBox(
                          width: 2.w,
                        ),
                        SvgPicture.asset('assets/images/image4.svg'),
                        SizedBox(
                          width: 2.w,
                        ),
                        SvgPicture.asset('assets/images/image5.svg'),
                        SizedBox(
                          width: 2.w,
                        ),
                        SvgPicture.asset('assets/images/image6.svg'),
                        SizedBox(
                          width: 2.w,
                        ),
                        SvgPicture.asset('assets/images/image7.svg'),
                        SizedBox(
                          width: 2.w,
                        ),
                        SvgPicture.asset('assets/images/image8.svg'),
                      ],
                    ),
                    image: 'assets/images/money-send2.png',
                  ),
                ],
              ),
              const Spacer(),
              const ConformationButton(),
            ],
          ),
        ),
      ),
    );
  }
}
