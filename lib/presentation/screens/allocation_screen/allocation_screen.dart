import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:moneylog/presentation/screens/allocation_screen/widgets/settings_allocation_screen.dart';
import 'package:moneylog/presentation/screens/allocation_screen/widgets/categories_card.dart';
import 'package:moneylog/presentation/screens/allocation_screen/widgets/debt_card.dart';
import 'package:moneylog/presentation/screens/allocation_screen/widgets/perfect_cardtile.dart';

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
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Budget Allocation",
                      style: GoogleFonts.inter(
                        color: colors.textMain,
                        fontSize: 22.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 3),

                    Text(
                      "Manage your income wisely",
                      style: GoogleFonts.inter(
                        color: Colors.grey,
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              actions: [
                Padding(
                  padding: const EdgeInsets.only(right: 16),
                  child: IconButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        PageRouteBuilder(
                          pageBuilder: (context, animation, secondaryAnimation) => SettingsAllocationScreen(),
                          transitionsBuilder: (context, animation, secondaryAnimation, child) {
                            // Apply curve for smooth animation
                            final curvedAnimation = CurvedAnimation(
                              parent: animation,
                              curve: Curves.easeInOut,
                            );

                            // Fade transition
                            final fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(curvedAnimation);

                            // Scale transition
                            final scaleAnimation = Tween<double>(begin: 0.8, end: 1.0).animate(curvedAnimation);

                            return FadeTransition(
                              opacity: fadeAnimation,
                              child: ScaleTransition(
                                scale: scaleAnimation,
                                child: child,
                              ),
                            );
                          },
                          transitionDuration: const Duration(milliseconds: 200), // Smooth duration
                        ),
                      );

                    },
                    icon: Icon(Icons.settings, color: colors.primary, size: 25),
                  ),
                ),
              ],
            ),

            /// Body Content
            SliverPadding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
              sliver: SliverList(
                delegate: SliverChildListDelegate([
                  DebtCard(),
                  SizedBox(height: 20),
                  PerfectAllocation(),
                  SizedBox(height: 20),
                  Text(
                    "Categories",
                    style: GoogleFonts.inter(
                      color: colors.textMain,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ]),
              ),
            ),
            SliverPadding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              sliver: SliverList(
                delegate: SliverChildBuilderDelegate(
                  childCount: 10,
                      (context, index) => Padding(
                        padding: const EdgeInsetsGeometry.only(bottom: 20),
                        child: CategoriesCard(
                          count: index+1,
                        ),
                      ),

                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
