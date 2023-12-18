import 'package:flutter/material.dart';
import 'package:sabak_22_capitals_of_the_world_3/features/presentation/theme/app_colors.dart';

class LineDivider extends StatelessWidget {
  const LineDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Divider(
      indent: 14,
      endIndent: 14,
      color: AppColors.black,
    );
  }
}
