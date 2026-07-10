import 'package:flutter/material.dart';

class DBSearchField extends StatelessWidget {
  const DBSearchField({required this.controller, this.hintText, this.onSubmitted, this.onChanged, super.key});

  final TextEditingController controller;
  final String? hintText;
  final ValueChanged<String>? onSubmitted;
  final ValueChanged<String>? onChanged;

  @override
  Widget build(BuildContext context) => TextField(
    controller: controller,
    textInputAction: .search,
    onSubmitted: onSubmitted,
    onChanged: onChanged,
    decoration: InputDecoration(
      hintText: hintText,
      prefixIcon: const Icon(Icons.search),
      suffixIcon: ValueListenableBuilder(
        valueListenable: controller,
        builder: (context, value, _) => value.text.isEmpty
            ? const SizedBox.shrink()
            : IconButton(
                icon: const Icon(Icons.close),
                onPressed: () {
                  controller.clear();
                  onChanged?.call('');
                },
              ),
      ),
    ),
  );
}
