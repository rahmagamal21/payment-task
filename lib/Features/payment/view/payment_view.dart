import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:svg_flutter/svg.dart';

import '../../../core/common/res/colors.dart';
import '../../../generated/l10n.dart';

class PaymentView extends StatelessWidget {
  const PaymentView({super.key});

  @override
  Widget build(BuildContext context) {
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
          padding: EdgeInsets.only(
            right: 16.w,
            left: 16.w,
            top: 20.w,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Stack(
                children: [
                  Material(
                    elevation: 2,
                    child: Container(
                      padding: const EdgeInsets.all(16),
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
                          Row(
                            children: [],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
