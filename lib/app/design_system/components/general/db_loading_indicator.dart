import 'package:flutter/material.dart';

class DBLoadingIndicator extends StatelessWidget {
  const DBLoadingIndicator({this.size = 32, super.key});

  final double size;

  @override
  Widget build(BuildContext context) => Center(
    child: SizedBox(
      width: size,
      height: size,
      child: CircularProgressIndicator(strokeWidth: 3, color: Theme.of(context).colorScheme.primary),
    ),
  );
}
