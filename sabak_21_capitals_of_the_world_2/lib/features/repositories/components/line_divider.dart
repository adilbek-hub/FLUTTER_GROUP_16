import 'package:flutter/material.dart';
import 'package:sabak_21_capitals_of_the_world_2/features/repositories/theme/app_colors.dart';

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
