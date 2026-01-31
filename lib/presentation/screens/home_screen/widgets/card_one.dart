import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:moneylog/presentation/screens/profile_screen/widgets/income_section.dart';
import 'package:moneylog/presentation/state_management/net_income_provider.dart';
import 'package:moneylog/presentation/themes/colors.dart';
import 'package:provider/provider.dart';
class CardOne extends StatelessWidget {
  const CardOne({super.key});

  @override
  Widget build(BuildContext context) {
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
                MyColor.cardGradientStart, // Replaced 0xFF1a1526
                MyColor.cardGradientEnd, // Replaced 0xFF1e100e
              ],
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header Row
              Row(
                children: [
                  Text(
                    "Monthly Income",
                    style: GoogleFonts.inter(
                      fontWeight: FontWeight.w500,
                      fontSize: 15.sp,
                      color: MyColor.textMuted,
                    ),
                  ),
                  const Spacer(),
                  Container(
                    height: 30.h,
                    width: 40.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25.r),
                      color: MyColor.bgCard, // Replaced 0xFF342b30
                    ),
                    child: const Icon(
                      Icons.currency_bitcoin_outlined,
                      // Specific icon from snippet
                      color: MyColor.primary,
                    ),
                  ),
                ],
              ),

              // Amount Row
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [

                  Consumer<NetIncomeProvider>(builder: (context,value,child){
                    print("text widget rebuild");
                    return Text(
                      value.totalBudget.toString(),
                      style: GoogleFonts.roboto(
                        fontWeight: FontWeight.bold,
                        fontSize: 20.sp,
                        color: MyColor.textMain,
                      ),
                    );
                  }),

                  SizedBox(width: 5.w),
                  IconButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        PageRouteBuilder(
                          pageBuilder:
                              (context, animation, secondaryAnimation) =>
                                  IncomeSection(),
                          transitionsBuilder:
                              (context, animation, secondaryAnimation, child) {
                                const begin = Offset(1.0, 0.0);
                                const end = Offset.zero;
                                const curve = Curves.ease;

                                final tween = Tween(
                                  begin: begin,
                                  end: end,
                                ).chain(CurveTween(curve: curve));
                                final offsetAnimation = animation.drive(tween);

                                return SlideTransition(
                                  position: offsetAnimation,
                                  child: child,
                                );
                              },
                        ),
                      );
                    },
                    icon: Icon(Icons.edit, color: MyColor.textMuted),
                  ),
                  const Spacer(),
                ],
              ),

              SizedBox(
                height: MediaQuery.of(context).size.height * 0.01,
              ), // Pushes bottom text down if needed
              // Bottom Text
              Text(
                "Total Remaining",
                style: GoogleFonts.inter(
                  fontWeight: FontWeight.w500,
                  fontSize: 15.sp,
                  color: MyColor.textMuted,
                ),
              ),
              Text(
                "\$4400",
                style: GoogleFonts.roboto(
                  fontWeight: FontWeight.bold,
                  fontSize: 33.sp,
                  color: MyColor.textMain,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
