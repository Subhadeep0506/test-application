import 'question_fields.dart';

class Question {
  int? id;
  String? question;
  int? option;
  int? selected;

  Question({this.id, this.option, this.question});
  Map<String, Object?> toJson() => {
        QuestionFields.id: id,
        QuestionFields.question: question,
        QuestionFields.selectedOption: selected,
      };

  Question copy({
    int? id,
    String? question,
    int? option,
    int? selected,
  }) =>
      Question(
        id: id ?? this.id,
        option: option ?? this.option,
        question: question ?? this.question,
      );

  static Question fromJson(Map<String, Object?> first) => Question(
        id: first[QuestionFields.id] as int?,
        question: first[QuestionFields.question] as String?,
        option: first[QuestionFields.selectedOption] as int?,
      );
}
