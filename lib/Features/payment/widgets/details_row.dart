import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/common/res/colors.dart';

class DetailsRow extends StatelessWidget {
  final String title;
  final String type;
  const DetailsRow({
    super.key,
    required this.title,
    required this.type,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: AllColors.desc,
          ),
        ),
        SizedBox(
          width: 10.w,
        ),
        Expanded(
          child: Divider(
            color: AllColors.gold.withOpacity(0.5),
            height: 20,
            thickness: 1,
          ),
        ),
        SizedBox(
          width: 10.w,
        ),
        Text(
          type,
          style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: AllColors.mainColor),
        ),
      ],
    );
  }
}
