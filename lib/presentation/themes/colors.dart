import 'dart:ui';

class MyColor {
  // Core Theme Colors
  static const bgApp = Color(0xFF050505);
  static const bgCard = Color(0x0DFFFFFF); // 5% opacity white
  static const bgCardHover = Color(0x14FFFFFF); // 8% opacity white
  static const bgModal = Color(0xFF1A1A1A);
  static const bgInput = Color(0xFF2A2A2A);

  // Card Specific Colors (From Dashboard/Income Card)
  static const cardGradientStart = Color(0xFF1A1526); // Dark Purpleish
  static const cardGradientEnd = Color(0xFF1E100E); // Dark Brownish
  static const iconContainerBg = Color(
    0xFF342B30,
  ); // Muted Brown/Purple container

  // Brand Colors
  static const primary = Color(0xFF6C5DD3);
  static const primaryGlow = Color(0x806C5DD3);
  static const secondary = Color(0xFFFF754C);

  // Status Colors
  static const success = Color(0xFF33C67C);
  static const successDark = Color(0xFF208F58);
  static const danger = Color(0xFFFF4C4C);
  static const warning = Color(0xFFFFC107);
  static const info = Color(0xFF03A9F4);

  // Text Colors
  static const textMain = Color(0xFFFFFFFF);
  static const textMuted = Color(0xFFA0A0A0);
  static const textDark = Color(0xFF000000);

  // UI Elements
  static const border = Color(0xFF333333);
  static const heart = Color(0xFFE91E63);
  static const hobby = Color(0xFF9C27B0);

  // Light Mode Overrides
  static const lightBgApp = Color(0xFFF2F2F7);
  static const lightBgCard = Color(0xA6FFFFFF);
  static const lightTextMuted = Color(0xFF8A8A8E);
  static const marketUp = Color(0xFF33c67c);
  static const marketDown = Color(0xFFff4c4c);
  static const info2Color = Color(0xFFfd744b);
}
