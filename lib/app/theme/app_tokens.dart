import 'dart:ui' show lerpDouble;

import 'package:material_ui/material_ui.dart';

import 'app_colors.dart';

/// Пара цветов для статуса пункта плана: фон бейджа и цвет текста/иконки.
@immutable
class StatusColors {
  const StatusColors({required this.background, required this.foreground});

  final Color background;
  final Color foreground;

  StatusColors lerp(StatusColors other, double t) => StatusColors(
    background: Color.lerp(background, other.background, t)!,
    foreground: Color.lerp(foreground, other.foreground, t)!,
  );
}

/// Дизайн-токены приложения, которых нет в стандартном [ColorScheme].
///
/// Доступ: `Theme.of(context).extension<AppTokens>()!` или `context.tokens`.
@immutable
class AppTokens extends ThemeExtension<AppTokens> {
  const AppTokens({
    required this.statusOk,
    required this.statusSoon,
    required this.statusOverdue,
    required this.brandGradient,
    required this.textSecondary,
    required this.cardRadius,
    required this.headerRadius,
    required this.navBarHeight,
  });

  static const light = AppTokens(
    statusOk: StatusColors(
      background: AppColors.okBackground,
      foreground: AppColors.okForeground,
    ),
    statusSoon: StatusColors(
      background: AppColors.soonBackground,
      foreground: AppColors.soonForeground,
    ),
    statusOverdue: StatusColors(
      background: AppColors.overdueBackground,
      foreground: AppColors.overdueForeground,
    ),
    brandGradient: LinearGradient(
      begin: Alignment(-0.6, -1),
      end: Alignment(0.6, 1),
      colors: [AppColors.navyDeep, AppColors.navy, AppColors.blue],
      stops: [0, 0.52, 1],
    ),
    textSecondary: AppColors.textSecondary,
    cardRadius: 26,
    headerRadius: 40,
    navBarHeight: 70,
  );

  final StatusColors statusOk;
  final StatusColors statusSoon;
  final StatusColors statusOverdue;
  final LinearGradient brandGradient;
  final Color textSecondary;
  final double cardRadius;
  final double headerRadius;
  final double navBarHeight;

  @override
  AppTokens copyWith({
    StatusColors? statusOk,
    StatusColors? statusSoon,
    StatusColors? statusOverdue,
    LinearGradient? brandGradient,
    Color? textSecondary,
    double? cardRadius,
    double? headerRadius,
    double? navBarHeight,
  }) {
    return AppTokens(
      statusOk: statusOk ?? this.statusOk,
      statusSoon: statusSoon ?? this.statusSoon,
      statusOverdue: statusOverdue ?? this.statusOverdue,
      brandGradient: brandGradient ?? this.brandGradient,
      textSecondary: textSecondary ?? this.textSecondary,
      cardRadius: cardRadius ?? this.cardRadius,
      headerRadius: headerRadius ?? this.headerRadius,
      navBarHeight: navBarHeight ?? this.navBarHeight,
    );
  }

  @override
  AppTokens lerp(AppTokens? other, double t) {
    if (other == null) return this;
    return AppTokens(
      statusOk: statusOk.lerp(other.statusOk, t),
      statusSoon: statusSoon.lerp(other.statusSoon, t),
      statusOverdue: statusOverdue.lerp(other.statusOverdue, t),
      brandGradient: LinearGradient.lerp(
        brandGradient,
        other.brandGradient,
        t,
      )!,
      textSecondary: Color.lerp(textSecondary, other.textSecondary, t)!,
      cardRadius: lerpDouble(cardRadius, other.cardRadius, t)!,
      headerRadius: lerpDouble(headerRadius, other.headerRadius, t)!,
      navBarHeight: lerpDouble(navBarHeight, other.navBarHeight, t)!,
    );
  }
}

extension AppTokensX on BuildContext {
  AppTokens get tokens => Theme.of(this).extension<AppTokens>()!;
}
