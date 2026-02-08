import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../themes/theme.dart';

class PerfectAllocation extends StatelessWidget {
  const PerfectAllocation({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<AppColors>()!;

    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.06,
      width: double.infinity,
      child: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.only(left: 16, right: 16, bottom: 0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.r),
          color: colors.success.withOpacity(0.3),
          border: Border.all(color: colors.success, width: 1),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "✅ Perfectly Allocated",
              style: GoogleFonts.inter(
                fontWeight: FontWeight.bold,
                fontSize: 15.sp,
                color: colors.textMain,
              ),
            ),
            Text(
              "100%",
              style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.bold,
                color: colors.marketUp,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
