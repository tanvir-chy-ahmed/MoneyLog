import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:moneylog/core/constants/assets.dart';
import 'package:provider/provider.dart';

import '../../../provider/net_income_provider.dart';
import '../../../themes/theme.dart';

class DebtCard extends StatelessWidget {
  const DebtCard({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<AppColors>()!;
    print("main widget rebuild");

    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.24,
      width: double.infinity,
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(22.r),
        ),
        clipBehavior: Clip.antiAlias,
        child: Container(
          padding: EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 0),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.white.withOpacity(0.10), width: 1),
            gradient: LinearGradient(
              colors: [
                Color(0xFF262041), // Replaced 0xFF1a1526
                Color(0xFF4c261d), // Replaced 0xFF1e100e
              ],
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header Row
              Text(
                "Monthly Income",
                style: GoogleFonts.inter(
                  fontWeight: FontWeight.w500,
                  fontSize: 15.sp,
                  color: colors.textMuted,
                ),
              ),

              // Amount Row
              Consumer<NetIncomeProvider>(
                builder: (context, value, child) {
                  print("text widget rebuild");
                  return Text(
                    value.totalBudget.toString(),
                    style: GoogleFonts.roboto(
                      fontWeight: FontWeight.bold,
                      fontSize: 20.sp,
                      color: colors.textMain,
                    ),
                  );
                },
              ),

              SizedBox(
                height: MediaQuery.of(context).size.height * 0.01,
              ), // Pushes bottom text down if needed




              Container(
                height: 30.h,
                width: 80.w,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: colors.marketUp.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(12.r)
                ),
                child: Row(
                  children: [
                    Image.asset(Assets.market_up,height: 20,width: 20,),
                    Text(
                      "Recurring",
                      style: GoogleFonts.inter(
                        fontWeight: FontWeight.w500,
                        fontSize: 12.sp,
                        color: colors.marketUp,
                      ),
                    ),
                  ],
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
