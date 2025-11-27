import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:quiz_game/core/constants.dart';

class QuestionModel extends Equatable {
  final String questionBody;
  final List<String> answers;
  final num correctAnswerIndex;

  const QuestionModel({
    required this.questionBody,
    required this.answers,
    required this.correctAnswerIndex,
  });

  factory QuestionModel.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return QuestionModel(
      questionBody: data[kQuestionBody] ?? '',
      answers: List<String>.from(data[kQuestionAnswers] ?? []),
      correctAnswerIndex: data[kCorrectAnswerIndex] ?? 0,
    );
  }

  @override
  List<Object?> get props => [questionBody, answers, correctAnswerIndex];
}
