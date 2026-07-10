import 'package:cached_network_image_ce/cached_network_image.dart';
import 'package:dofus_buddy/app/design_system/tokens/db_radius.dart';
import 'package:flutter/material.dart';

class DBNetworkImage extends StatelessWidget {
  const DBNetworkImage({required this.url, this.size = 48, this.borderRadius = DBRadius.borderRadiusS, super.key});

  final String url;
  final double size;
  final BorderRadius borderRadius;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return ClipRRect(
      borderRadius: borderRadius,
      child: CachedNetworkImage(
        imageUrl: url,
        width: size,
        height: size,
        fit: .cover,
        placeholder: (context, url) => Container(color: colorScheme.surfaceContainerHighest),
        errorBuilder: (context, url, error) => Container(
          color: colorScheme.surfaceContainerHighest,
          alignment: Alignment.center,
          child: Icon(Icons.image_not_supported_outlined, size: size * 0.5, color: colorScheme.onSurfaceVariant),
        ),
      ),
    );
  }
}
