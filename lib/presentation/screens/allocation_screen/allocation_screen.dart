import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:moneylog/presentation/screens/allocation_screen/widgets/debt_card.dart';
import 'package:moneylog/presentation/screens/home_screen/widgets/card_one.dart';

import '../../themes/theme.dart';

class AllocationScreen extends StatefulWidget {
  const AllocationScreen({super.key});

  @override
  State<AllocationScreen> createState() => _AllocationScreenState();
}

class _AllocationScreenState extends State<AllocationScreen> {
  bool empty = false;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<AppColors>()!;
    return Scaffold(
      backgroundColor: colors.bgApp,
      body: SafeArea(
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            /// AppBar
            SliverAppBar(
              pinned: false,
              floating: false,
              snap: false,
              backgroundColor: colors.bgApp,
              elevation: 0,
              automaticallyImplyLeading: false,
              expandedHeight: kToolbarHeight + 10.h,
              title: Padding(
                padding: const EdgeInsets.only(left: 16),
                child: Column(
                  mainAxisAlignment: .start,
                  crossAxisAlignment: .start,
                  children: [
                    Text(
                      "Budget Allocation",
                      style: GoogleFonts.inter(
                        color: colors.textMain,
                        fontSize: 22.sp,
                        fontWeight: .bold,
                      ),
                    ),

                    const SizedBox(height: 3),

                    Text(
                      "Manage your income wisely",
                      style: GoogleFonts.inter(
                        color: Colors.grey,
                        fontSize: 15.sp,
                        fontWeight: .w500,
                      ),
                    ),
                  ],
                ),
              ),
              actions: [
                Padding(
                  padding: const EdgeInsets.only(right: 16),
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.settings, color: colors.primary, size: 25),
                  ),
                ),
              ],
            ),

            /// Body Content
            SliverPadding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
              sliver: SliverList(delegate: SliverChildListDelegate([
                DebtCard()
              ])),
            ),
          ],
        ),
      ),
    );
  }
}
