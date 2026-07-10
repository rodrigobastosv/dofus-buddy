import 'package:dofus_buddy/app/design_system/tokens/db_spacing.dart';
import 'package:flutter/widgets.dart';

class DBGap extends SizedBox {
  const DBGap.xs({super.key}) : super.square(dimension: DBSpacing.xs);

  const DBGap.s({super.key}) : super.square(dimension: DBSpacing.s);

  const DBGap.m({super.key}) : super.square(dimension: DBSpacing.m);

  const DBGap.l({super.key}) : super.square(dimension: DBSpacing.l);

  const DBGap.xl({super.key}) : super.square(dimension: DBSpacing.xl);

  const DBGap.xxl({super.key}) : super.square(dimension: DBSpacing.xxl);
}
