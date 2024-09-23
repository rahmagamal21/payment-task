import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:payment/core/common/res/colors.dart';

class PaymentMethods extends StatelessWidget {
  final String image;
  final String title;
  final Widget desc;
  const PaymentMethods(
      {super.key,
      required this.image,
      required this.title,
      required this.desc});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: AllColors.gold, width: 0.25),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Container(
              width: 43.w,
              height: 43.h,
              decoration: BoxDecoration(
                color: AllColors.mainColor,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Image.asset(image),
            ),
            SizedBox(
              width: 5.w,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                      color: AllColors.mainColor),
                ),
                SizedBox(
                  height: 3.h,
                ),
                desc,
              ],
            ),
            const Spacer(),
            const Icon(
              Icons.check_box_outlined,
              color: Color(0xff4CD964),
            )
          ],
        ),
      ),
    );
  }
}
