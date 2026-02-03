import 'package:flutter/material.dart';

@immutable
class AppColors extends ThemeExtension<AppColors> {
  final Color bgApp;
  final Color bgCard;
  final Color bgModal;
  final Color bgInput;

  final Color primary;
  final Color secondary;

  final Color success;
  final Color danger;
  final Color warning;
  final Color info;

  final Color textMain;
  final Color textMuted;

  final Color marketUp;
  final Color marketDown;
  final Color info2;

  const AppColors({
    required this.bgApp,
    required this.bgCard,
    required this.bgModal,
    required this.bgInput,
    required this.primary,
    required this.secondary,
    required this.success,
    required this.danger,
    required this.warning,
    required this.info,
    required this.textMain,
    required this.textMuted,
    required this.marketUp,
    required this.marketDown,
    required this.info2,
  });

  @override
  AppColors copyWith({
    Color? bgApp,
    Color? bgCard,
    Color? bgModal,
    Color? bgInput,
    Color? primary,
    Color? secondary,
    Color? success,
    Color? danger,
    Color? warning,
    Color? info,
    Color? textMain,
    Color? textMuted,
    Color? marketUp,
    Color? marketDown,
    Color? info2,
  }) {
    return AppColors(
      bgApp: bgApp ?? this.bgApp,
      bgCard: bgCard ?? this.bgCard,
      bgModal: bgModal ?? this.bgModal,
      bgInput: bgInput ?? this.bgInput,
      primary: primary ?? this.primary,
      secondary: secondary ?? this.secondary,
      success: success ?? this.success,
      danger: danger ?? this.danger,
      warning: warning ?? this.warning,
      info: info ?? this.info,
      textMain: textMain ?? this.textMain,
      textMuted: textMuted ?? this.textMuted,
      marketUp: marketUp ?? this.marketUp,
      marketDown: marketDown ?? this.marketDown,
      info2: info2 ?? this.info2,
    );
  }

  @override
  AppColors lerp(ThemeExtension<AppColors>? other, double t) {
    if (other is! AppColors) return this;
    return AppColors(
      bgApp: Color.lerp(bgApp, other.bgApp, t)!,
      bgCard: Color.lerp(bgCard, other.bgCard, t)!,
      bgModal: Color.lerp(bgModal, other.bgModal, t)!,
      bgInput: Color.lerp(bgInput, other.bgInput, t)!,
      primary: Color.lerp(primary, other.primary, t)!,
      secondary: Color.lerp(secondary, other.secondary, t)!,
      success: Color.lerp(success, other.success, t)!,
      danger: Color.lerp(danger, other.danger, t)!,
      warning: Color.lerp(warning, other.warning, t)!,
      info: Color.lerp(info, other.info, t)!,
      textMain: Color.lerp(textMain, other.textMain, t)!,
      textMuted: Color.lerp(textMuted, other.textMuted, t)!,
      marketUp: Color.lerp(marketUp, other.marketUp, t)!,
      marketDown: Color.lerp(marketDown, other.marketDown, t)!,
      info2: Color.lerp(info2, other.info2, t)!,
    );
  }
}
