import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class DBTextStyles {
  static TextStyle display(BuildContext context) =>
      GoogleFonts.baloo2(fontSize: 32, fontWeight: .w700, height: 1.2, color: Theme.of(context).colorScheme.onSurface);

  static TextStyle headline(BuildContext context) =>
      GoogleFonts.baloo2(fontSize: 24, fontWeight: .w700, height: 1.25, color: Theme.of(context).colorScheme.onSurface);

  static TextStyle title(BuildContext context) =>
      GoogleFonts.baloo2(fontSize: 18, fontWeight: .w600, height: 1.3, color: Theme.of(context).colorScheme.onSurface);

  static TextStyle body(BuildContext context) =>
      GoogleFonts.nunito(fontSize: 16, fontWeight: .w400, height: 1.4, color: Theme.of(context).colorScheme.onSurface);

  static TextStyle bodyStrong(BuildContext context) =>
      GoogleFonts.nunito(fontSize: 16, fontWeight: .w700, height: 1.4, color: Theme.of(context).colorScheme.onSurface);

  static TextStyle caption(BuildContext context) =>
      GoogleFonts.nunito(fontSize: 13, fontWeight: .w500, height: 1.3, color: Theme.of(context).colorScheme.onSurfaceVariant);
}
