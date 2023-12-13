import 'package:flutter/material.dart';
import 'package:sabak_21_capitals_of_the_world_2/features/data/model/continents.dart';
import 'package:sabak_21_capitals_of_the_world_2/features/presentation/pages/detail_page.dart';

class ContinentsWidget extends StatelessWidget {
  const ContinentsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 8.0,
        crossAxisSpacing: 8.0,
      ),
      itemCount: continentsList.length,
      padding: const EdgeInsets.all(8.0),
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: ((context) => DetailPage(
                      image: continentsList[index].continentImage,
                    )),
              ),
            );
          },
          child: Container(
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
          ),
        );
      },
    );
  }
}
