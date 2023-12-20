class Test {
  Test(
      {required this.capitalName,
      required this.capitalImage,
      required this.joop});
  final String capitalName;
  final String capitalImage;
  final List<Joop> joop;
}

class Joop {
  Joop({required this.countriesName, required this.isTrue});
  final String countriesName;
  bool isTrue;
}

Test bishkek = Test(
  capitalName: 'Бишкек',
  capitalImage: 'http://st-1.akipress.org/st_limon/1/1523419800_0.jpg',
  joop: [
    Joop(countriesName: 'Кыргызстан', isTrue: true),
    Joop(countriesName: 'Казакстан', isTrue: false),
    Joop(countriesName: 'Өзбекстан', isTrue: false),
    Joop(countriesName: 'Тажикстан', isTrue: false),
  ],
);

Test beijin = Test(
  capitalName: 'Бээжин',
  capitalImage:
      'https://ic.pics.livejournal.com/dergachev_va/58474394/2270770/2270770_original.jpg',
  joop: [
    Joop(countriesName: 'Индия', isTrue: false),
    Joop(countriesName: 'Кыргызстан', isTrue: false),
    Joop(countriesName: 'Пакистан', isTrue: false),
    Joop(countriesName: 'Кытай', isTrue: true),
  ],
);

Test astana = Test(
  capitalName: 'Астана',
  capitalImage:
      'http://e-cis.info/upload/iblock/7c1/xbygn5zho43sr6lpun2ql7qsx44nbbxr.jpg',
  joop: [
    Joop(countriesName: 'Индия', isTrue: false),
    Joop(countriesName: 'Кыргызстан', isTrue: false),
    Joop(countriesName: 'Казакстан', isTrue: true),
    Joop(countriesName: 'Кытай', isTrue: false),
  ],
);

Test deli = Test(
  capitalName: 'Дели',
  capitalImage:
      'https://www.uatraveller.com/wp-content/uploads/2018/10/delhi-35-tmb-1200x628xfill-1140x628.jpg',
  joop: [
    Joop(countriesName: 'Индия', isTrue: true),
    Joop(countriesName: 'Кыргызстан', isTrue: false),
    Joop(countriesName: 'Пакистан', isTrue: false),
    Joop(countriesName: 'Кытай', isTrue: false),
  ],
);

List<Test> capitalsList = [
  bishkek,
  beijin,
  astana,
  deli,
];
