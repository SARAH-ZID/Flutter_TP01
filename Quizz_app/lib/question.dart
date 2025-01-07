class Question {
  String? questionText; // la val de questionText peux etre null ou String
  String? questionImage;
  bool? questionAnswer;

  Question({String? q, String? i, bool? a}) {
    questionText = q;
    questionImage = i;
    questionAnswer = a;
  }
}
