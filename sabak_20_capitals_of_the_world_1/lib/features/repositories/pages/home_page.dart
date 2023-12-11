import 'package:flutter/material.dart';
import 'package:sabak_20_capitals_of_the_world_1/features/doimain/model/continents.dart';
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
      body: Column(
        children: [
          const LineDivider(),
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 8.0,
                crossAxisSpacing: 8.0,
              ),
              itemCount: continentsList.length,
              padding: const EdgeInsets.all(8.0),
              itemBuilder: (context, index) {
                return Container(
                  color: const Color.fromARGB(255, 183, 247, 205),
                  child: Center(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        continentsList[index].continentName,
                      ),
                      Image.network(
                        continentsList[index].continentImage,
                        width: 160,
                      ),
                    ],
                  )),
                );
              },
            ),
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
