// Класс шаблон
class Kyrgyzstan {
  Kyrgyzstan({
    required this.borbor,
    required this.oblus,
    required this.lake,
    required this.mountain,
    required this.atribut,
    required this.region,
  });
  final String borbor;
  final int oblus;
  final int lake;
  final String mountain;
  final String atribut;
  final int region;
}

//Класстын объектиси (object)
final country = Kyrgyzstan(
  borbor: 'Бишкек',
  oblus: 7,
  lake: 4,
  mountain: 'Жеңиш чокусу',
  atribut: 'Кызыл желек',
  region: 42,
);
