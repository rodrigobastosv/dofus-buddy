import 'package:dofus_buddy/app/cubit/app_cubit.dart';
import 'package:dofus_buddy/app/cubit/app_state.dart';
import 'package:dofus_buddy/app/design_system/components/general/db_gap.dart';
import 'package:dofus_buddy/app/design_system/tokens/db_spacing.dart';
import 'package:dofus_buddy/app/design_system/tokens/db_text_styles.dart';
import 'package:dofus_buddy/app/presentation/general/db_page.dart';
import 'package:dofus_buddy/l10n/arb/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) => BlocProvider<AppCubit>.value(value: context.read<AppCubit>(), child: const _SettingsView());
}

class _SettingsView extends StatelessWidget {
  const _SettingsView();

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return DBPage<AppCubit, AppState>(
      builder: (context, cubit, state) => Scaffold(
        appBar: AppBar(title: Text(l10n.settingsTitle)),
        body: ListView(
          padding: const EdgeInsets.symmetric(vertical: DBSpacing.s),
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: DBSpacing.m),
              child: Text(l10n.settingsLanguageLabel, style: DBTextStyles.title(context)),
            ),
            const DBGap.s(),
            RadioGroup<Locale?>(
              groupValue: state.locale,
              onChanged: (locale) => locale == null ? cubit.useSystemLocale() : cubit.changeLocale(locale),
              child: Column(
                children: [
                  RadioListTile<Locale?>(title: Text(l10n.languageSystemDefault), value: null),
                  RadioListTile<Locale?>(title: Text(l10n.languageEnglish), value: const Locale('en')),
                  RadioListTile<Locale?>(title: Text(l10n.languagePortuguese), value: const Locale('pt')),
                  RadioListTile<Locale?>(title: Text(l10n.languageFrench), value: const Locale('fr')),
                ],
              ),
            ),
            const DBGap.m(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: DBSpacing.m),
              child: Text(l10n.settingsThemeLabel, style: DBTextStyles.title(context)),
            ),
            const DBGap.s(),
            RadioGroup<ThemeMode>(
              groupValue: state.themeMode,
              onChanged: (themeMode) => cubit.changeThemeMode(themeMode!),
              child: Column(
                children: [
                  RadioListTile<ThemeMode>(title: Text(l10n.themeSystemDefault), value: .system),
                  RadioListTile<ThemeMode>(title: Text(l10n.themeLight), value: .light),
                  RadioListTile<ThemeMode>(title: Text(l10n.themeDark), value: .dark),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
