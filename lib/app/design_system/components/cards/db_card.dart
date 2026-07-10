import 'package:dofus_buddy/app/design_system/tokens/db_radius.dart';
import 'package:dofus_buddy/app/design_system/tokens/db_spacing.dart';
import 'package:flutter/material.dart';

class DBCard extends StatelessWidget {
  const DBCard({required this.child, this.onTap, this.padding = const EdgeInsets.all(DBSpacing.m), super.key});

  final Widget child;
  final VoidCallback? onTap;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) => Card(
    child: InkWell(
      onTap: onTap,
      borderRadius: DBRadius.borderRadiusM,
      child: Padding(padding: padding, child: child),
    ),
  );
}
