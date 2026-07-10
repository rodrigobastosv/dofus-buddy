import 'package:dofus_buddy/app/core/di/dependencies.dart';
import 'package:dofus_buddy/app/cubit/app_cubit.dart';
import 'package:dofus_buddy/app/cubit/app_state.dart';
import 'package:dofus_buddy/app/design_system/themes/db_theme.dart';
import 'package:dofus_buddy/app/presentation/routing/app_router.dart';
import 'package:dofus_buddy/l10n/arb/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  setupDependencies();
  runApp(const DofusBuddyApp());
}

class DofusBuddyApp extends StatelessWidget {
  const DofusBuddyApp({super.key});

  @override
  Widget build(BuildContext context) => BlocProvider.value(
    value: G<AppCubit>(),
    child: BlocBuilder<AppCubit, AppState>(
      builder: (context, state) => MaterialApp.router(
        onGenerateTitle: (context) => AppLocalizations.of(context).appTitle,
        theme: DBTheme.light,
        darkTheme: DBTheme.dark,
        locale: state.locale,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        routerConfig: AppRouter.router,
      ),
    ),
  );
}
