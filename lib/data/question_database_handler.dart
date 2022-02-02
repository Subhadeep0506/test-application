import 'dart:async';
import 'dart:io';

import 'package:flutter/widgets.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:test_application_v1/data/question_fields.dart';
import 'package:test_application_v1/data/question_model.dart';
import 'package:test_application_v1/data/questions.dart';

class QuestionDatabaseHelper {
  static final QuestionDatabaseHelper _instance =
      QuestionDatabaseHelper.internal();

  factory QuestionDatabaseHelper() => _instance;

  final tableName = QuestionFields.tableName;
  final questionId = QuestionFields.id;
  final questionBody = QuestionFields.question;
  final correct = QuestionFields.correctOption;
  final selected = QuestionFields.selectedOption;

  QuestionDatabaseHelper.internal();

  initializeDb() async {
    WidgetsFlutterBinding.ensureInitialized();
    Directory documentDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentDirectory.path, 'questionsDb.db');
    // debugPrint(path);
    var questionDb = await openDatabase(path, version: 1, onCreate: _onCreate);

    return questionDb;
  }

  void _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE $tableName (
        $questionId INTEGER PRIMARY KEY,
        $questionBody TEXT,
        ${QuestionFields.option1} TEXT,
        ${QuestionFields.option2} TEXT,
        ${QuestionFields.option3} TEXT,
        ${QuestionFields.option4} TEXT,
        $correct NUMBER,
        $selected NUMBER
      )
    ''');
  }

  Future<int> insertQuestion(QuestionModel question) async {
    Database dbClient = await initializeDb();

    int result = await dbClient.insert(
      tableName,
      question.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    debugPrint(result.toString());
    dbClient.close();
    return result;
  }

  // this method will be called on app startup.
  Future<void> insertDataOnStart() async {
    Questions questions = Questions();

    QuestionDatabaseHelper _questionDatabaseHelper = QuestionDatabaseHelper();
    for (int i = 0; i < questions.questions.length; i++) {
      final question1 = QuestionModel(
        id: questions.questions[i]['id'],
        question: questions.questions[i]['question'],
        option1: questions.questions[i]['option1'],
        option2: questions.questions[i]['option2'],
        option3: questions.questions[i]['option3'],
        option4: questions.questions[i]['option4'],
        correct: questions.questions[i]['correct'],
        selected: questions.questions[i]['selected'],
      );
      await _questionDatabaseHelper.insertQuestion(question1);
    }

    // debugPrint(question1.toString());
    getAllTables();
  }

  Future<List<Map>> getAllTables() async {
    Database dbClient = await initializeDb();

    List<Map> list = await dbClient.rawQuery('SELECT * FROM $tableName');
    // debugPrint(list.toString());
    return list;
  }

  Future<Map> getQuestionById(int id) async {
    Database dbClient = await initializeDb();

    List<Map> question =
        await dbClient.rawQuery('SELECT * FROM $tableName WHERE id=$id');

    return question[0];
  }
}
