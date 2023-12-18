//class

class Continents {
  Continents({
    required this.continentName,
    required this.continentImage,
    this.asiaContinentTest,
    this.continentsAfrica,
  });
  final String continentName;
  final String continentImage;
  AsiaContinentTest? asiaContinentTest;
  ContinentsAfrica? continentsAfrica;
}

class AsiaContinentTest {
  final String surooText;
  final String image;
  AsiaContinentTest({
    required this.surooText,
    required this.image,
  });
}

class ContinentsAfrica extends AsiaContinentTest {
  ContinentsAfrica()
      : super(
          surooText: 'Tanzania',
          image: 'http://st-1.akipress.org/st_limon/1/1523419800_0.jpg',
        );
}

//object
Continents asia = Continents(
  continentName: 'Азия',
  continentImage:
      'https://cdn1.iconfinder.com/data/icons/continents-icons/512/asia-512.png',
  asiaContinentTest: AsiaContinentTest(
      surooText: 'Астана',
      image: 'http://st-1.akipress.org/st_limon/1/1523419800_0.jpg'),
);

Continents europe = Continents(
    continentName: 'Европа',
    continentImage:
        'http://www.atlas-monde.net/wp-content/uploads/2016/02/europe-vierge.png');

Continents northAmerica = Continents(
    continentName: 'Түндүк Америка',
    continentImage:
        'https://cdn1.iconfinder.com/data/icons/world-maps-1/512/north_america-512.png');
Continents southAmerica = Continents(
    continentName: 'Түштүк Америка',
    continentImage:
        'https://cdn3.iconfinder.com/data/icons/countries-and-continents/512/South_America-512.png');

Continents africa = Continents(
  continentName: 'Африка',
  continentImage:
      'https://www.prescribetravel.com.au/wp-content/uploads/2021/06/Map-of-Africa.png',
  continentsAfrica: ContinentsAfrica(),
);

Continents australia = Continents(
    continentName: 'Австралия',
    continentImage:
        'https://www.clker.com/cliparts/H/8/Q/i/6/b/australia-brown-hi.png');

List<Continents> continentsList = [
  europe,
  asia,
  northAmerica,
  southAmerica,
  africa,
  australia,
];
