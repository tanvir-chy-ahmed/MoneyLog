import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:moneylog/presentation/themes/colors.dart';

import '../../../themes/theme.dart';

class DebtCard extends StatelessWidget {
  const DebtCard({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<AppColors>()!;
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.22,
      width: double.infinity,
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18.r),
        ),
        clipBehavior: Clip.antiAlias,
        child: Container(
          padding: EdgeInsets.only(left: 18, right: 18, top: 18, bottom: 0),
          decoration: BoxDecoration(
            color: Color(0xFF171616),
            border: Border.all(color: Colors.white.withOpacity(0.10), width: 1),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header Row
              Row(
                children: [
                  Text(
                    "Mac Book Air",
                    style: GoogleFonts.inter(
                      fontWeight: FontWeight.bold,
                      fontSize: 15.sp,
                      color: Colors.white,
                    ),
                  ),
                  const Spacer(),
                  Icon(Icons.delete_outlined, color: colors.marketDown),
                ],
              ),

              SizedBox(height: 4.h),

              // Amount Row
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "\$4,400",
                          style: GoogleFonts.roboto(
                            fontSize: 25.sp,
                            fontWeight: FontWeight.w700,
                            color: colors.info2,
                          ),
                        ),
                        TextSpan(
                          text: ".00",
                          style: GoogleFonts.roboto(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w600,
                            color: colors.info2,
                          ),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(width: 5.w),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.edit, color: colors.textMuted),
                  ),
                  const Spacer(),
                ],
              ),

              Text(
                "Due: 11-12-2025",
                style: GoogleFonts.roboto(
                  fontWeight: FontWeight.w500,
                  fontSize: 12.sp,
                  color: Colors.white.withOpacity(0.7),
                ),
              ),

              SizedBox(height: MediaQuery.of(context).size.height * 0.007),
              Row(
                children: [
                  Text(
                    "Progress",
                    style: GoogleFonts.roboto(
                      fontWeight: .w600,
                      fontSize: 15.sp,
                      color: Colors.white.withOpacity(0.9),
                    ),
                  ),
                  const Spacer(),
                  Text(
                    "0%",
                    style: GoogleFonts.roboto(
                      fontWeight: FontWeight.bold,
                      fontSize: 15.sp,
                      color: Colors.white.withOpacity(0.9),
                    ),
                  ),
                ],
              ),

              SizedBox(height: 6.h),
              LinearProgressIndicator(
                value: 0.4,
                minHeight: 4.h,
                borderRadius: BorderRadius.circular(12.r),
                backgroundColor: Colors.grey.withOpacity(0.3),
                valueColor: AlwaysStoppedAnimation<Color>(colors.marketUp),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
