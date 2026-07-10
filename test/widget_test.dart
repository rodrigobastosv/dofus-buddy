import 'package:dofus_buddy/app/core/di/dependencies.dart';
import 'package:dofus_buddy/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  setUpAll(setupDependencies);

  testWidgets('renders the home page with its feature tiles and a settings action', (tester) async {
    await tester.pumpWidget(const DofusBuddyApp());
    await tester.pumpAndSettle();

    expect(find.byType(GridView), findsOneWidget);
    expect(find.byIcon(Icons.settings_outlined), findsOneWidget);
  });

  testWidgets('navigates to the item search page when the items tile is tapped', (tester) async {
    await tester.pumpWidget(const DofusBuddyApp());
    await tester.pumpAndSettle();

    await tester.tap(find.text('Items'));
    await tester.pumpAndSettle();

    expect(find.byType(TextField), findsOneWidget);
  });
}
