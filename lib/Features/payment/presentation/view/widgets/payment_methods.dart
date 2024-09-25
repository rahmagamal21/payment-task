import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:payment/core/common/res/colors.dart';

class PaymentMethods extends StatelessWidget {
  final String image;
  final String title;
  final Widget desc;
  final bool iselected;
  final void Function()? onTap;
  final bool isCard;
  const PaymentMethods(
      {super.key,
      required this.image,
      required this.title,
      required this.desc,
      required this.iselected,
      this.isCard = false, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
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
              isCard
                  ? Row(
                      children: [
                        Image.asset('assets/images/m.png'),
                        Icon(
                          Icons.check_box_outlined,
                          color: iselected
                              ? const Color(0xff4CD964)
                              : AllColors.desc,
                        ),
                      ],
                    )
                  : Icon(
                      Icons.check_box_outlined,
                      color: iselected ? const Color(0xff4CD964) : AllColors.desc,
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
