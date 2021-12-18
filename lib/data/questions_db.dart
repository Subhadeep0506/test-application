import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

// database handling for questions and results
class QuestionsDatabase {
  QuestionFields q = QuestionFields();
  // column names for question table
  String idField = QuestionFields.id;
  String questionField = QuestionFields.question;
  String optionField = QuestionFields.correctOption;
  String selectedField = QuestionFields.selectedOptionField;

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
    CREATE TABLE IF NOT EXISTS questions 
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
}

class Question {
  int? id;
  String? question;
  int? option;
  int? selected;

  Question(this.id, this.option, this.question);
}

class QuestionFields {
  static String id = '_id';
  static String question = 'question';
  static String correctOption = 'option';
  static String selectedOptionField = 'selected';
}
