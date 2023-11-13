// Китептер үчүн шаблон
class Book {
  //поля
  final String bookName;
  final int pageNumber;
// китептер үчүн конструктор
  const Book({required this.bookName, required this.pageNumber});
}

// Китептердин аталышы үчүн объект
Book synganKylych = const Book(bookName: 'Сынган Кылыч', pageNumber: 450);

Book birinchMugalim = const Book(bookName: 'Биринчи Мугалим', pageNumber: 560);

Book brilliantJylaan = const Book(bookName: 'Бриллиант Жылан', pageNumber: 440);
Book gylSarat = const Book(bookName: 'Гүлсарат', pageNumber: 1000);
Book chyngyzHan = const Book(bookName: 'Чынгыз Хан', pageNumber: 800);
Book betmeBet = const Book(bookName: 'Бетме Бет', pageNumber: 1000);
Book akkeme = const Book(bookName: 'Ак Кеме', pageNumber: 850);
Book jamiyla = const Book(bookName: 'Жамиля', pageNumber: 1500);
Book kylymKaarytkanBirByn =
    const Book(bookName: 'Кылым Каарыткан Бир Күн', pageNumber: 4522);
Book algebra = const Book(bookName: 'Алгебра', pageNumber: 350);
Book informatica = const Book(bookName: 'Информатика', pageNumber: 350);
Book erteKelgenTurnalar =
    const Book(bookName: 'Эртен келген турналар', pageNumber: 580);

// Китептердин аталышы үчүн лист
List<Book> booksList = [
  synganKylych,
  birinchMugalim,
  brilliantJylaan,
  gylSarat,
  chyngyzHan,
  betmeBet,
  akkeme,
  jamiyla,
  kylymKaarytkanBirByn,
  algebra,
  informatica,
  erteKelgenTurnalar,
];
