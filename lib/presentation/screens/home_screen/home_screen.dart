import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:moneylog/core/constants/assets.dart';
import 'package:moneylog/presentation/screens/home_screen/widgets/card_five.dart';
import 'package:moneylog/presentation/screens/home_screen/widgets/card_four.dart';
import 'package:moneylog/presentation/screens/home_screen/widgets/card_one.dart';
import 'package:moneylog/presentation/screens/home_screen/widgets/card_six.dart';
import 'package:moneylog/presentation/screens/home_screen/widgets/card_three.dart';
import 'package:moneylog/presentation/screens/home_screen/widgets/card_two.dart';
import 'package:moneylog/presentation/screens/profile_screen/profile_screen.dart';
import 'package:moneylog/presentation/themes/colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final stocksTitle = ["Exp", "Save", "Debt"];
  final stockBudget = [0, 5000, 0];
  final stockIcon = [Assets.market_down, Assets.market_up, Assets.info];
  final stockColor = [MyColor.marketDown, MyColor.marketUp, MyColor.info2Color];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColor.bgApp,
      body: SafeArea(
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            /// AppBar
            SliverAppBar(
              pinned: false,
              floating: false,
              snap: false,
              backgroundColor: MyColor.bgApp,
              elevation: 0,
              automaticallyImplyLeading: false,
              expandedHeight: kToolbarHeight + 10.h,
              title: Padding(
                padding: const EdgeInsets.only(left: 16),
                child: Text(
                  "Dashboard",
                  style: GoogleFonts.inter(
                    color: MyColor.textMain,
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              actions: [
                Padding(
                  padding: const EdgeInsets.only(right: 16),
                  child: Container(
                    width: 40.r,
                    height: 40.r,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: RadialGradient(
                        colors: [Color(0xFF5A7FB7), Color(0xFF3FB08E)],
                      ),
                    ),
                    child: IconButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          PageRouteBuilder(
                            pageBuilder: (context, animation, secondaryAnimation) =>
                            const ProfileScreen(),
                            transitionsBuilder: (context, animation, secondaryAnimation, child) {
                              final curvedAnimation = CurvedAnimation(
                                parent: animation,
                                curve: Curves.easeOut,
                              );
                              final slideAnimation = Tween<Offset>(
                                begin: const Offset(1.0, 0.0),
                                end: Offset.zero,
                              ).animate(curvedAnimation);
                              final fadeAnimation = Tween<double>(
                                begin: 0.0,
                                end: 1.0,
                              ).animate(curvedAnimation);

                              return SlideTransition(
                                position: slideAnimation,
                                child: FadeTransition(
                                  opacity: fadeAnimation,
                                  child: child,
                                ),
                              );
                            },
                            transitionDuration: const Duration(milliseconds: 400),
                          ),
                        );
                      },
                      icon: const Icon(Icons.person, color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),

            /// Body Content
            SliverPadding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
              sliver: SliverList(
                delegate: SliverChildListDelegate(
                  [
                    CardOne(),
                    SizedBox(height: 12.h),

                    /// Quick Stats
                    Padding(
                      padding: EdgeInsets.only(left: 10.w),
                      child: Text(
                        "Quick Stats",
                        style: GoogleFonts.roboto(
                          fontWeight: FontWeight.bold,
                          fontSize: 20.sp,
                          color: MyColor.textMain,
                        ),
                      ),
                    ),
                    SizedBox(height: 10.h),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.13,
                      child: ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        itemCount: stocksTitle.length,
                        itemBuilder: (_, index) => Padding(
                          padding: EdgeInsets.only(right: 6.w),
                          child: CardTwo(
                            text: stocksTitle[index],
                            budget: stockBudget[index],
                            img: stockIcon[index],
                            color: stockColor[index],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 15.h),

                    /// Details Section
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Details",
                            style: GoogleFonts.roboto(
                              fontWeight: FontWeight.bold,
                              fontSize: 20.sp,
                              color: MyColor.textMain,
                            ),
                          ),
                          TextButton(
                            onPressed: () {},
                            child: Text(
                              "See All",
                              style: GoogleFonts.roboto(
                                fontWeight: FontWeight.bold,
                                fontSize: 14.sp,
                                color: MyColor.marketUp,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10.h),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.20,
                      child: ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        itemCount: stocksTitle.length,
                        itemBuilder: (_, index) => Padding(
                          padding: EdgeInsets.only(right: 6.w),
                          child: CardThree(
                            text: stocksTitle[index],
                            budget: stockBudget[index],
                            img: stockIcon[index],
                            color: stockColor[index],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 15.h),

                    /// Analytics Section
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.w),
                      child: Text(
                        "Analytics",
                        style: GoogleFonts.roboto(
                          fontWeight: FontWeight.bold,
                          fontSize: 20.sp,
                          color: MyColor.textMain,
                        ),
                      ),
                    ),
                    SizedBox(height: 10.h),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          CardFour(),
                          SizedBox(width: 8.w),
                          CardFive(),
                          SizedBox(width: 8.w),
                          CardSix(),
                        ],
                      ),
                    ),
                    SizedBox(height: 20.h),

                    /// Planned Purchases
                    SizedBox(
                      width: double.infinity,
                      height: 100.h,
                      child: Card(
                        elevation: 4,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(22.r),
                        ),
                        clipBehavior: Clip.antiAlias,
                        child: Container(
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(22.r),
                            border: Border.all(
                              color: Colors.white.withOpacity(0.10),
                              width: 0.8.w,
                            ),
                            color: const Color(0xFF171616),
                          ),
                          child: ListTile(
                            contentPadding: EdgeInsets.zero,
                            title: Text(
                              "Planned Purchases",
                              style: GoogleFonts.roboto(
                                fontWeight: FontWeight.bold,
                                fontSize: 16.sp,
                                color: MyColor.textMain,
                              ),
                            ),
                            subtitle: const Text(
                              "2 Items on Wishlist",
                              style: TextStyle(color: Colors.grey),
                            ),
                            leading: Container(
                              height: 40.h,
                              width: 45.w,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25.r),
                                color: const Color(0xFF28131a),
                              ),
                              child: const Icon(
                                Icons.favorite,
                                color: Colors.redAccent,
                              ),
                            ),
                            trailing: const Icon(
                              Icons.arrow_forward_ios_rounded,
                              color: Colors.grey,
                              size: 16,
                            ),
                          ),
                        ),
                      ),
                    ),

                    SizedBox(height: 30.h),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
