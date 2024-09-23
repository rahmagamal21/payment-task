import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:payment/core/common/res/colors.dart';

class PriceButton extends StatelessWidget {
  const PriceButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 101.w,
      height: 40.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: AllColors.mainColor,
      ),
      child: Center(
        child: Text(
          '500 جنية',
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w700,
            color: AllColors.gold,
          ),
        ),
      ),
    );
  }
}
