//class

class Continents {
  const Continents({
    required this.continentName,
    required this.continentImage,
  });
  final String continentName;
  final String continentImage;
}

//object
Continents europe = const Continents(
    continentName: 'Европа',
    continentImage:
        'https://wheremaps.com/wp-content/uploads/2023/02/Europe-Map.webp');
Continents asia = const Continents(
    continentName: 'Азия',
    continentImage:
        'https://cdn1.iconfinder.com/data/icons/continents-icons/512/asia-512.png');
Continents northAmerica = const Continents(
    continentName: 'Түндүк Америка',
    continentImage:
        'https://cdn1.iconfinder.com/data/icons/world-maps-1/512/north_america-512.png');
Continents southAmerica = const Continents(
    continentName: 'Түштүк Америка',
    continentImage:
        'https://cdn3.iconfinder.com/data/icons/countries-and-continents/512/South_America-512.png');

Continents africa = const Continents(
    continentName: 'Африка',
    continentImage:
        'https://www.prescribetravel.com.au/wp-content/uploads/2021/06/Map-of-Africa.png');

Continents australia = const Continents(
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
