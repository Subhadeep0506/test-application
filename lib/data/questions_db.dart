import 'dart:convert';

import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

// database handling for questions and results
class QuestionsDatabase {
  QuestionFields q = QuestionFields();
  // column names for question table
  String tableName = 'questions';
  String idField = QuestionFields.id;
  String questionField = QuestionFields.question;
  String optionField = QuestionFields.correctOption;
  String selectedField = QuestionFields.selectedOption;

  static final QuestionsDatabase instance = QuestionsDatabase._init();

  static Database? _database;

  QuestionsDatabase._init();

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initializeDB('questions.db');

    return _database!;
  }

  Future<Database> _initializeDB(String filePath) async {
    final dbPath = await getDatabasesPath();

    final path = join(dbPath, filePath);

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    await db.execute('''
    CREATE TABLE IF NOT EXISTS $tableName 
    ($idField INTEGER PRIMARY KEY NOT NULL, 
     $questionField VARCHAR (50) NOT NULL,
     $selectedField INTEGER
    )
    ''');
  }

  Future close() async {
    final db = await instance.database;

    db.close();
  }

  Map<String, dynamic> toMap() {
    return {
      'id': idField,
      'question': questionField,
      'selected': selectedField,
    };
  }

  // Below functions are to perform CRUD operations on the database
  // to insert question into table
  Future<Question> insertDataToDB(Question question) async {
    final db = await instance.database;

    final id = await db.insert(tableName, question.toJson());

    return question.copy(id: id);
  }

  // to read question from table using question id
  Future<Question> readQuestionWithId(int id) async {
    final db = await instance.database;

    final maps = await db.query(
      tableName,
      columns: QuestionFields.values,
      where: '${QuestionFields.id} = ?',
      whereArgs: [id],
    );

    if (maps.isNotEmpty) {
      return Question.fromJson(maps.first);
    } else {
      throw Exception('ID $id not found');
    }
  }

  // To read entire table
  Future<List<Question>> readAllQuestions() async {
    final db = await instance.database;

    final result = await db.query(tableName);
    // returning the table as a list
    return result.map((json) => Question.fromJson(json)).toList();
  }
}

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

class QuestionFields {
  static String id = '_id';
  static String question = 'question';
  static String correctOption = 'option';
  static String selectedOption = 'selected';

  static final List<String> values = [
    id,
    question,
    correctOption,
    selectedOption,
  ];
}
