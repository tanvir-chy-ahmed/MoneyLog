import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:moneylog/presentation/screens/profile_screen/widgets/income_section.dart';
import 'package:moneylog/presentation/screens/profile_screen/widgets/profile_section.dart';
import 'package:provider/provider.dart';

import '../../provider/theme_changer.dart';
import '../../themes/theme.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String _selectedItem = "BDT (৳)";

  List<String> categoryCurrencys = [
    "USD (\$)", // United States
    "EUR (€)", // Eurozone (France, Germany, Spain, Italy, Netherlands)
    "BDT (৳)", // Bangladesh
    "INR (₹)", // India
    "AUD (\$)", // Australia
    // "GBP (£)", // United Kingdom
    // "CHF (CHF)", // Switzerland
    // "NOK (kr)", // Norway
    // "SEK (kr)", // Sweden
    // "CAD (\$)", // Canada
    "TRY (₺)", // Turkey
    // "AED (د.إ)", // United Arab Emirates
    "SAR (﷼)", // Saudi Arabia
    // "MYR (RM)", // Malaysia
    //
    // "JPY (¥)", // Japan
    // "CNY (¥)", // China
    // "PKR (₨)", // Pakistan
    // "KRW (₩)", // South Korea
    // "SGD (\$)", // Singapore
    // "IDR (Rp)", // Indonesia
  ];

  bool isDark = true;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<AppColors>()!;
    final themeMode = Provider.of<ThemeChangerProvider>(context);
    return Scaffold(
      backgroundColor: colors.bgApp,
      appBar: AppBar(
        backgroundColor: colors.bgApp,
        elevation: 0,
        automaticallyImplyLeading: false,
        titleSpacing: 16,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Settings",
              style: GoogleFonts.inter(
                color: colors.textMain,
                fontSize: 22.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 3.h),
            Text(
              "Customize your experience",
              style: GoogleFonts.inter(
                color: Colors.grey,
                fontSize: 15.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              Card(
                elevation: 6,
                shadowColor: Colors.black.withOpacity(0.45),
                color: colors.bgCard,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(22.r),
                  side: BorderSide(
                    color: Colors.white.withOpacity(0.10),
                    width: 0.8.w,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(
                    bottom: 8,
                    top: 8,
                    right: 5,
                    left: 5,
                  ),
                  child: Column(
                    spacing: 8,
                    children: [
                      SizedBox(height: 5),
                      GestureDetector(
                        onTap: () async {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => IncomeSection(),
                            ),
                          );
                        },
                        child: _settingsTile(
                          icon: Icons.currency_bitcoin,
                          title: "Income & Setup",
                          subtitle: "Manage budget allocations",
                          icColor: colors.marketUp,
                          icbgColor: Color(0xFF15241d),
                        ),
                      ),
                      Divider(
                        thickness: 0.8.w,
                        color: Colors.grey.withOpacity(0.2),
                      ),
                      GestureDetector(
                        onTap: () async {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ProfileSection(),
                            ),
                          );
                        },
                        child: _settingsTile(
                          icon: Icons.person_outline,
                          title: "Profile",
                          subtitle: "Personal Details & Name",
                          icColor: Colors.deepPurple,
                          icbgColor: Color(0xFF1b1926),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 15),

              Card(
                elevation: 6,
                shadowColor: Colors.black.withOpacity(0.45),
                color: colors.bgCard,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(22.r),
                  side: BorderSide(
                    color: colors.bgCard.withOpacity(0.10),
                    width: 0.8.w,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(
                    bottom: 8,
                    top: 8,
                    right: 5,
                    left: 5,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 8,
                    children: [
                      SizedBox(height: 5),

                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Text(
                          "Preferences",
                          style: GoogleFonts.inter(
                            color: Colors.white,
                            fontSize: 17.sp,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),

                      ListTile(
                        leading: const Icon(Icons.settings, color: Colors.grey),
                        title: Text(
                          "Currency Symbol",
                          style: GoogleFonts.inter(
                            color: Colors.white,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        trailing: Container(
                          height: 34.h,
                          width: 90.w,
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(8.r),
                            border: Border.all(color: Colors.grey.shade400),
                          ),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton<String>(
                              isExpanded: true,
                              value: _selectedItem,
                              hint: const Center(
                                child: Text(
                                  "Select",
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              icon: const Icon(
                                Icons.keyboard_arrow_down_rounded,
                                size: 20,
                                color: Colors.white,
                              ),
                              dropdownColor: Colors.grey,
                              items: categoryCurrencys.map((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Center(
                                    child: Text(
                                      value,
                                      style: const TextStyle(
                                        fontSize: 13,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                );
                              }).toList(),
                              onChanged: (String? value) {
                                setState(() {
                                  _selectedItem = value!;
                                });
                              },
                            ),
                          ),
                        ),
                      ),
                      ListTile(
                        leading: Icon(
                          isDark ? Icons.dark_mode : Icons.light_mode_outlined,
                          color: Colors.grey,
                        ),
                        title: Text(
                          "App Theme",
                          style: GoogleFonts.inter(
                            color: Colors.white,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        trailing: Container(
                          height: 30.h,
                          width: 107.w,
                          padding: EdgeInsets.all(2.w),
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(8.r),
                            border: Border.all(color: Colors.grey.shade400),
                          ),
                          child: Row(
                            children: [
                              // DARK CHIP
                              InkWell(
                                onTap: () {
                                  themeMode.setTheme(ThemeMode.dark);
                                },
                                child: Container(
                                  height: double.infinity,
                                  width: 50.w,
                                  decoration: BoxDecoration(
                                    color: themeMode.isDark
                                        ? Colors.white
                                        : Colors.transparent,
                                    borderRadius: BorderRadius.circular(6.r),
                                  ),
                                  child: Center(
                                    child: Text(
                                      "Dark",
                                      style: TextStyle(
                                        color: themeMode.isDark
                                            ? Colors.black
                                            : Colors.white,
                                        fontSize: 13.sp,
                                        fontWeight: themeMode.isDark
                                            ? FontWeight.w600
                                            : FontWeight.normal,
                                      ),
                                    ),
                                  ),
                                ),
                              ),

                              // LIGHT CHIP
                              InkWell(
                                onTap: () {
                                  themeMode.setTheme(ThemeMode.light);
                                },
                                child: Container(
                                  height: double.infinity,
                                  width: 50.w,
                                  decoration: BoxDecoration(
                                    color: !themeMode.isDark
                                        ? Colors.white
                                        : Colors.transparent,
                                    borderRadius: BorderRadius.circular(6.r),
                                  ),
                                  child: Center(
                                    child: Text(
                                      "Light",
                                      style: TextStyle(
                                        color: !themeMode.isDark
                                            ? Colors.black
                                            : Colors.white,
                                        fontSize: 13.sp,
                                        fontWeight: !themeMode.isDark
                                            ? FontWeight.w600
                                            : FontWeight.normal,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 15),
              Card(
                elevation: 6,
                shadowColor: Colors.black.withOpacity(0.45),
                color: const Color(0xFF171616),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(22.r),
                  side: BorderSide(
                    color: Colors.white.withOpacity(0.10),
                    width: 0.8.w,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(
                    bottom: 8,
                    top: 8,
                    right: 5,
                    left: 5,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 8,
                    children: [
                      SizedBox(height: 5),

                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Text(
                          "Data Management",
                          style: GoogleFonts.inter(
                            color: Colors.white,
                            fontSize: 17.sp,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),

                      Divider(
                        color: Colors.grey.shade800,
                        thickness: 0.7,
                        endIndent: 25,
                        indent: 20,
                      ),

                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Text(
                          "Danger Zone",
                          style: GoogleFonts.inter(
                            color: Colors.redAccent,
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        child: Text(
                          "Permanently delete all data.Action cannot be undone",
                          style: GoogleFonts.inter(
                            color: Colors.grey,
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.only(
                          left: 20,
                          right: 20,
                          bottom: 20,
                        ),
                        child: OutlinedButton(
                          onPressed: () {},
                          style: OutlinedButton.styleFrom(
                            foregroundColor: Colors.black,
                            backgroundColor: Color(0xFF351a1a),
                            side: BorderSide(color: Colors.red, width: 1.w),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.r),
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(Icons.delete, color: Colors.red),
                              SizedBox(width: 10.w),
                              Text(
                                "Reset All Data",
                                style: TextStyle(color: Colors.red),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _settingsTile({
    required IconData icon,
    required String title,
    required Color icColor,
    required Color icbgColor,
    String? subtitle,
  }) {
    return ListTile(
      leading: Container(
        height: 38.h,
        width: 42.w,

        decoration: BoxDecoration(
          color: icbgColor,
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: Icon(icon, color: icColor),
      ),
      title: Text(
        title,
        style: GoogleFonts.inter(
          color: Colors.white,
          fontSize: 16.sp,
          fontWeight: FontWeight.w600,
        ),
      ),
      subtitle: subtitle == null
          ? null
          : Text(
              subtitle,
              style: GoogleFonts.inter(
                color: Colors.grey,
                fontSize: 13.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
      trailing: const Icon(Icons.arrow_forward, size: 24, color: Colors.grey),
    );
  }
}
