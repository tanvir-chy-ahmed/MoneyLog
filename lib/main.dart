import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moneylog/presentation/screens/analytics_screen/analytics_screen.dart';
import 'package:moneylog/presentation/screens/debt_screen/debt_screen.dart';
import 'package:moneylog/presentation/screens/home_screen/widgets/home_bottom_sheet.dart';
import 'package:moneylog/presentation/screens/living_room_screen/livingroom.dart';
import 'package:moneylog/presentation/screens/living_room_screen/widgets/livingroom_bottom_sheet.dart';
import 'package:moneylog/presentation/state_management/net_income_provider.dart';
import 'package:moneylog/presentation/themes/colors.dart';
import 'package:provider/provider.dart';

import 'presentation/screens/home_screen/home_screen.dart';

void main() async {
  runApp(const AppRoot());
}

class AppRoot extends StatelessWidget {
  const AppRoot({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => NetIncomeProvider())
      ],
      child: const MainScreen(),
    );
  }
}

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, _) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          home: const RootScreen(),
        );
      },
    );
  }
}

class RootScreen extends StatefulWidget {
  const RootScreen({super.key});

  @override
  State<RootScreen> createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> {
  int _currentIndex = 0;

  final List<Widget> _pages = const [
    HomeScreen(),
    AnalyticsScreen(),
    DebtScreen(),
    LivingRoom(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true, // allow floating effect
      floatingActionButton: _currentIndex == 1
          ? Container()
          : FloatingActionButton(
              shape: CircleBorder(),
              backgroundColor: _currentIndex == 2
                  ? Color(0xFFfe754c)
                  : MyColor.marketUp,
              onPressed: () {
                if (_currentIndex == 0) {
                  showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    // Allows the sheet to go full height
                    backgroundColor: Colors.transparent,
                    builder: (BuildContext context) {
                      return CustomBottomSheet();
                    },
                  );
                } else if (_currentIndex == 2) {
                } else if (_currentIndex == 3) {
                  showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    // Allows the sheet to go full height
                    backgroundColor: Colors.transparent,
                    builder: (BuildContext context) {
                      return LivingroomBottomSheet();
                    },
                  );
                }
              },
              child: Icon(Icons.add, color: Colors.black, size: 28),
            ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(30.r),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaY: 15, sigmaX: 15),
            child: Container(
              height: 65.0.h,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.15),
                borderRadius: BorderRadius.circular(30.r),
                border: Border.all(color: Colors.white.withOpacity(0.2)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.white.withOpacity(0.1),
                    blurRadius: 20.r,
                    offset: Offset(0, 10),
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildNavItem(Icons.home_outlined, 0),
                  _buildNavItem(Icons.pie_chart_outline, 1),
                  _buildNavItem(Icons.credit_card_sharp, 2),
                  _buildNavItem(Icons.control_point_duplicate, 3),
                ],
              ),
            ),
          ),
        ),
      ),
      body: IndexedStack(index: _currentIndex, children: _pages),
    );
  }

  Widget _buildNavItem(IconData icon, int index) {
    bool isSelected = _currentIndex == index;

    return GestureDetector(
      onTap: () => setState(() => _currentIndex = index),
      behavior: HitTestBehavior.opaque, // Makes the whole area tappable
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        padding: EdgeInsets.all(10.w),
        decoration: BoxDecoration(
          // Adds a soft glow behind the selected icon
          color: isSelected ? Colors.blue.withOpacity(0.2) : Colors.transparent,
          shape: BoxShape.circle,
        ),
        child: Icon(
          icon,
          size: isSelected ? 24.h : 20.h, // Subtle scale effect
          color: isSelected ? Colors.blue : Colors.white.withOpacity(0.7),
        ),
      ),
    );
  }
}
