import 'package:flutter/material.dart';
import 'package:sabak_20_capitals_of_the_world_1/features/doimain/model/continents.dart';
import 'package:sabak_20_capitals_of_the_world_1/features/repositories/components/continents_widget.dart';
import 'package:sabak_20_capitals_of_the_world_1/features/repositories/components/line_divider.dart';
import 'package:sabak_20_capitals_of_the_world_1/features/repositories/theme/app_size.dart';
import 'package:sabak_20_capitals_of_the_world_1/features/repositories/theme/app_text_style.dart';
import 'package:sabak_20_capitals_of_the_world_1/features/repositories/theme/app_texts.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _myAppBar(),
      body: const Column(
        children: [
          LineDivider(),
          Expanded(
            child: ContinentsWidget(),
          )
        ],
      ),
    );
  }

  AppBar _myAppBar() {
    return AppBar(
      title: const Text(
        AppTexts.titleText,
        style: AppTextStyles.titleTextStyle,
      ),
      actions: const [
        Icon(
          Icons.settings,
          size: 25,
          color: Color(0xff355CE5),
        ),
        AppSize.w20,
        Icon(Icons.more_vert),
      ],
    );
  }
}
