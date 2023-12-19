import 'package:flutter/material.dart';
import 'package:sabak_22_capitals_of_the_world_3/features/data/model/test.dart';
import 'package:sabak_22_capitals_of_the_world_3/features/presentation/theme/app_size.dart';
import 'package:sabak_22_capitals_of_the_world_3/features/presentation/theme/app_text_style.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({
    Key? key,
    required this.test,
  }) : super(key: key);
  final List<Test> test;

  final double sl = 10;

  @override
  Widget build(BuildContext context) {
    int testIndex = 0;
    return Scaffold(
      appBar: _detailAppBar(),
      body: Column(
        children: [
          SizedBox(
            width: double.infinity,
            child: SliderTheme(
              data: SliderTheme.of(context).copyWith(
                  trackHeight: 15,
                  thumbColor: Colors.transparent,
                  thumbShape:
                      const RoundSliderThumbShape(enabledThumbRadius: 0.0)),
              child: Slider(
                min: 0.0,
                max: 100.0,
                value: sl,
                onChanged: (value) {},
              ),
            ),
          ),
          Text(
            test[testIndex].name,
            style: AppTextStyles.capitalNameStyle,
          ),
          Expanded(
              child: Image.network(
                  'http://st-1.akipress.org/st_limon/1/1523419800_0.jpg')),
          AppSize.h20,
          Expanded(
            child: GridView.count(
              childAspectRatio: (1 / .6),
              shrinkWrap: true,
              crossAxisCount: 2,
              physics: const NeverScrollableScrollPhysics(),
              children: List.generate(
                4,
                (index) {
                  return Card(
                    color: Colors.grey[500],
                    margin: const EdgeInsets.all(10),
                    child: Center(
                      child: Text(
                        'Item $index',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  AppBar _detailAppBar() {
    return AppBar(
      title: const Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '22',
            style: AppTextStyles.numberFalseStyle,
          ),
          Text('|'),
          Text(
            '10',
            style: AppTextStyles.numberTrueStyle,
          ),
        ],
      ),
      actions: const [
        Icon(Icons.more_vert),
      ],
    );
  }
}

class ChooseCountries extends StatelessWidget {
  const ChooseCountries({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Card(
        clipBehavior: Clip.hardEdge,
        child: InkWell(
          splashColor: Colors.blue.withAlpha(30),
          onTap: () {
            debugPrint('Card tapped.');
          },
          child: Center(
            child: Text('Кыргызстан'),
          ),
        ),
      ),
    );
  }
}
