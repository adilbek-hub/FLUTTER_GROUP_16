import 'package:flutter/material.dart';
import 'package:sabak_21_capitals_of_the_world_2/features/repositories/theme/app_text_style.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({
    Key? key,
    required this.image,
  }) : super(key: key);
  final String image;
  final double sl = 10;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _detailAppBar(),
      body: Column(
        children: [
          SizedBox(
            width: double.infinity,
            child: SliderTheme(
              data: SliderTheme.of(context).copyWith(
                  trackHeight: 18,
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
          const Text(
            'Бишкек',
            style: AppTextStyles.capitalNameStyle,
          ),
          Image.network('http://st-1.akipress.org/st_limon/1/1523419800_0.jpg'),
          SizedBox(
            height: 20,
          ),
          Expanded(
            child: Row(
              children: [
                ChooseCountries(),
                ChooseCountries(),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                ChooseCountries(),
                ChooseCountries(),
              ],
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
    return Card(
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
    );
  }
}
