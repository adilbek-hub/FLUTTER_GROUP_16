class QuizeBrain {
  QuizeBrain({required this.suroo, required this.joop});
  final String suroo;
  final bool joop;
}

QuizeBrain q1 = QuizeBrain(suroo: 'Кыргызстанда 7 область барбы?', joop: true);
QuizeBrain q2 = QuizeBrain(suroo: 'Кыргызстан тоолу өлкөбү', joop: true);
QuizeBrain q3 = QuizeBrain(
    suroo: 'Кыргызстанда самалет чыгаруучу завод барбы?', joop: false);
QuizeBrain q4 = QuizeBrain(
    suroo: 'Flutter Майкрасофт корпорациясында иштелип чыкканбы?', joop: false);
QuizeBrain q5 = QuizeBrain(suroo: 'Кракодил бакка чыга алабы?', joop: false);
QuizeBrain q6 = QuizeBrain(suroo: 'Жер шаары тоголокпу?', joop: true);
QuizeBrain q7 =
    QuizeBrain(suroo: 'Телефондо программа жаза алабызбы?', joop: false);
QuizeBrain q8 = QuizeBrain(suroo: 'Адам сүйлөйбү?', joop: true);
QuizeBrain q9 = QuizeBrain(
    suroo: 'Америка Кошмо Штаты Африка континентинде жайгашканбы?',
    joop: false);
QuizeBrain q10 = QuizeBrain(suroo: 'Кыргыз эли баатыр элби?', joop: true);

final quizeList = [q1, q2, q3, q4, q5, q6, q7, q8, q9, q10];
