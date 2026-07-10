import 'package:dofus_buddy/app/design_system/tokens/db_colors.dart';
import 'package:dofus_buddy/app/design_system/tokens/db_radius.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class DBTheme {
  static ThemeData get light => _buildTheme(_lightColorScheme);

  static ThemeData get dark => _buildTheme(_darkColorScheme);

  static const ColorScheme _lightColorScheme = ColorScheme(
    brightness: .light,
    primary: DBColors.amber,
    onPrimary: DBColors.onAmber,
    primaryContainer: DBColors.amberContainerLight,
    onPrimaryContainer: DBColors.onAmberContainerLight,
    secondary: DBColors.purple,
    onSecondary: DBColors.onPurple,
    secondaryContainer: DBColors.purpleContainerLight,
    onSecondaryContainer: DBColors.onPurpleContainerLight,
    tertiary: DBColors.success,
    onTertiary: DBColors.onAmber,
    error: DBColors.error,
    onError: DBColors.onError,
    errorContainer: DBColors.errorContainerLight,
    onErrorContainer: DBColors.onErrorContainerLight,
    surface: DBColors.surfaceLight,
    onSurface: DBColors.onSurfaceLight,
    surfaceContainerHighest: DBColors.surfaceContainerLight,
    onSurfaceVariant: DBColors.onSurfaceLight,
    outline: DBColors.outlineLight,
  );

  static const ColorScheme _darkColorScheme = ColorScheme(
    brightness: .dark,
    primary: DBColors.amberLight,
    onPrimary: DBColors.onAmberDark,
    primaryContainer: DBColors.amberContainerDark,
    onPrimaryContainer: DBColors.onAmberContainerDark,
    secondary: DBColors.purpleLight,
    onSecondary: DBColors.onPurpleDark,
    secondaryContainer: DBColors.purpleContainerDark,
    onSecondaryContainer: DBColors.onPurpleContainerDark,
    tertiary: DBColors.success,
    onTertiary: DBColors.onAmber,
    error: DBColors.error,
    onError: DBColors.onError,
    errorContainer: DBColors.errorContainerDark,
    onErrorContainer: DBColors.onErrorContainerDark,
    surface: DBColors.surfaceDark,
    onSurface: DBColors.onSurfaceDark,
    surfaceContainerHighest: DBColors.surfaceContainerDark,
    onSurfaceVariant: DBColors.onSurfaceDark,
    outline: DBColors.outlineDark,
  );

  static ThemeData _buildTheme(ColorScheme colorScheme) {
    final textTheme = GoogleFonts.nunitoTextTheme().copyWith(
      displayLarge: GoogleFonts.baloo2(fontWeight: .w700),
      displayMedium: GoogleFonts.baloo2(fontWeight: .w700),
      headlineLarge: GoogleFonts.baloo2(fontWeight: .w700),
      headlineMedium: GoogleFonts.baloo2(fontWeight: .w700),
      titleLarge: GoogleFonts.baloo2(fontWeight: .w600),
      titleMedium: GoogleFonts.baloo2(fontWeight: .w600),
    );

    return ThemeData(
      useMaterial3: true,
      colorScheme: colorScheme,
      scaffoldBackgroundColor: colorScheme.surface,
      textTheme: textTheme.apply(bodyColor: colorScheme.onSurface, displayColor: colorScheme.onSurface),
      appBarTheme: AppBarTheme(
        backgroundColor: colorScheme.surface,
        foregroundColor: colorScheme.onSurface,
        elevation: 0,
        centerTitle: false,
        titleTextStyle: GoogleFonts.baloo2(fontSize: 22, fontWeight: .w700, color: colorScheme.onSurface),
      ),
      navigationBarTheme: NavigationBarThemeData(
        backgroundColor: colorScheme.surface,
        indicatorColor: colorScheme.primaryContainer,
        elevation: 0,
        height: 68,
        labelTextStyle: WidgetStateProperty.resolveWith((states) {
          final isSelected = states.contains(WidgetState.selected);
          return GoogleFonts.nunito(
            fontSize: 12,
            fontWeight: isSelected ? .w700 : .w500,
            color: isSelected ? colorScheme.onSecondaryContainer : colorScheme.onSurfaceVariant,
          );
        }),
      ),
      cardTheme: CardThemeData(
        color: colorScheme.surfaceContainerHighest,
        elevation: 0,
        shape: const RoundedRectangleBorder(borderRadius: DBRadius.borderRadiusM),
        margin: EdgeInsets.zero,
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: colorScheme.surfaceContainerHighest,
        border: const OutlineInputBorder(borderRadius: DBRadius.borderRadiusM, borderSide: BorderSide.none),
        enabledBorder: const OutlineInputBorder(borderRadius: DBRadius.borderRadiusM, borderSide: BorderSide.none),
        focusedBorder: OutlineInputBorder(
          borderRadius: DBRadius.borderRadiusM,
          borderSide: BorderSide(color: colorScheme.primary, width: 2),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: colorScheme.primary,
          foregroundColor: colorScheme.onPrimary,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
          shape: const RoundedRectangleBorder(borderRadius: DBRadius.borderRadiusM),
          textStyle: GoogleFonts.nunito(fontSize: 16, fontWeight: .w700),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: colorScheme.primary,
          side: BorderSide(color: colorScheme.outline),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
          shape: const RoundedRectangleBorder(borderRadius: DBRadius.borderRadiusM),
          textStyle: GoogleFonts.nunito(fontSize: 16, fontWeight: .w700),
        ),
      ),
    );
  }
}
