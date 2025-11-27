import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:quiz_game/models/question_model.dart';

class FirestoreService {
  final _db = FirebaseFirestore.instance;

  Future<Either<Exception, List<QuestionModel>>> fetchQuestions(
    String quizType,
  ) async {
    try {
      final snapshot =
          await _db
              .collection('quizzes')
              .doc(quizType)
              .collection('questions')
              .get();
      final questions =
          snapshot.docs
              .map((question) => QuestionModel.fromFirestore(question))
              .toList();
      return Right(questions);
    } on FirebaseException catch (ex) {
      return Left(Exception('Firebase Exception $ex'));
    } catch (e) {
      return Left(Exception(e));
    }
  }
}
