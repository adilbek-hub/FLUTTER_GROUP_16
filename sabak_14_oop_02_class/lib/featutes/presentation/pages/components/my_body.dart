import 'package:flutter/material.dart';
import 'package:sabak_14_oop_02_class/featutes/data/model.dart';

class MyBody extends StatelessWidget {
  const MyBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(
                'https://data.vb.kg/image/big/2022-11-18_22-26-02_531251.jpg'),
            const Text('Кыргызстан'),
            const SizedBox(height: 10),
            Text('Борбору: ${country.borbor}'),
            Text('Канча облус бар:${country.borbor}'),
            Text('Канча көлү бар:${country.lake}'),
            Text('Канча району бар:${country.region}'),
            Text('Кандай атрибуту бар:${country.atribut}'),
            Text('Эң бийик тоо:${country.mountain}'),
          ],
        ),
      ),
    );
  }
}
