import 'package:flutter/material.dart';
import 'package:sabak_22_capitals_of_the_world_3/features/data/model/test.dart';
import 'package:sabak_22_capitals_of_the_world_3/features/presentation/theme/app_size.dart';
import 'package:sabak_22_capitals_of_the_world_3/features/presentation/theme/app_text_style.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({
    Key? key,
  }) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  final double sl = 10;
  int indexs = 0;
  int kataJoop = 0;
  int tuuraJoop = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _detailAppBar(kata: kataJoop, tuura: tuuraJoop),
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
                max: 3,
                value: indexs.toDouble(),
                onChanged: (value) {},
              ),
            ),
          ),
          Text(
            capitalsList[indexs].capitalName,
            style: AppTextStyles.capitalNameStyle,
          ),
          Expanded(child: Image.network(capitalsList[indexs].capitalImage)),
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
                  return InkWell(
                    onTap: () {
                      if (indexs + 1 == capitalsList.length) {
                        showDialog<void>(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: const Text('Сиздин Тест Жыйынтыгыңыз'),
                              actions: <Widget>[
                                Text('Ката: $kataJoop / Туура: $tuuraJoop'),
                                TextButton(
                                  style: TextButton.styleFrom(
                                    textStyle:
                                        Theme.of(context).textTheme.labelLarge,
                                  ),
                                  child: const Text('Чыгуу'),
                                  onPressed: () {
                                    kataJoop = 0;
                                    tuuraJoop = 0;
                                    indexs = 0;
                                    setState(() {});
                                    Navigator.of(context).pop();
                                  },
                                ),
                              ],
                            );
                          },
                        );
                      } else {
                        if (capitalsList[indexs].joop[index].isTrue == true) {
                          tuuraJoop++;
                        } else {
                          kataJoop++;
                        }
                        indexs++;
                        setState(() {});
                      }
                    },
                    child: Card(
                      color: Colors.grey[500],
                      margin: const EdgeInsets.all(10),
                      child: Center(
                        child: Text(
                          capitalsList[indexs].joop[index].countriesName,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
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

  AppBar _detailAppBar({required int kata, required int tuura}) {
    return AppBar(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Ката жооп: $kata',
            style: AppTextStyles.numberFalseStyle,
          ),
          const Text('|'),
          Text(
            'Туура жооп: $tuura',
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
