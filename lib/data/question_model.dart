class QuestionModel {
  int? id;
  String? question;
  String? option1;
  String? option2;
  String? option3;
  String? option4;
  int? correct;
  int? selected;

  QuestionModel({
    required this.id,
    required this.question,
    required this.option1,
    required this.option2,
    required this.option3,
    required this.option4,
    required this.correct,
    required this.selected,
  });

  QuestionModel.map(dynamic obj) {
    id = obj['id'];
    question = obj['question'];
    option1 = obj['option1'];
    option2 = obj['option2'];
    option3 = obj['option3'];
    option4 = obj['option4'];
    correct = obj['correct'];
    selected = obj['selected'];
  }

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{};
    map['id'] = id;
    map['question'] = question;
    map['option1'] = option1;
    map['option2'] = option2;
    map['option3'] = option3;
    map['option4'] = option4;
    map['correct'] = correct;
    map['selected'] = selected;

    return map;
  }

  QuestionModel.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    question = map['question'];
    option1 = map['option1'];
    option2 = map['option2'];
    option3 = map['option3'];
    option4 = map['option4'];
    correct = map['correct'];
    selected = map['selected'];
  }

  @override
  String toString() {
    return '''Question{
      id: $id,
      question: $question,
      correct: $correct,
      selected: $selected
      }
    ''';
  }
}
