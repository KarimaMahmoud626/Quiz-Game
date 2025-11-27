import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_game/models/question_model.dart';
import 'package:quiz_game/services/firestore_service.dart';

part 'quiz_state.dart';

class QuizCubit extends Cubit<QuizState> {
  final FirestoreService firestoreService;
  Timer? _timer;
  QuizCubit(this.firestoreService) : super(QuizInit());

  void fetchQuestions(String quizType) async {
    try {
      emit(QuizLoading());
      final result = await firestoreService.fetchQuestions(quizType);
      result.fold((e) => emit(QuizFailed(errorMessage: e.toString())), (
        questions,
      ) {
        questions.shuffle();
        emit(
          QuizLoaded(
            questions: questions,
            currentIndex: 0,
            score: 0,
            selectedIndex: null,
            timerSeconds: 10,
            progress: 1.0,
          ),
        );
        startTimer();
      });
    } catch (e) {
      emit(QuizFailed(errorMessage: e.toString()));
    }
  }

  void startTimer() {
    stopTimer();

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (state is QuizLoaded) {
        final s = state as QuizLoaded;
        if (s.timerSeconds == 0) {
          _handleTimeout();
        } else {
          emit(
            s.copyWith(
              timerSeconds: s.timerSeconds - 1,
              progress: (s.timerSeconds - 1) / 10,
            ),
          );
        }
      }
    });
  }

  void stopTimer() {
    _timer?.cancel();
  }

  void _handleTimeout() {
    if (state is! QuizLoaded) return;

    final s = state as QuizLoaded;

    emit(s.copyWith(selectedIndex: -1, isCorrect: false));

    stopTimer();

    Future.delayed(const Duration(seconds: 1), () => moveToNextQuestion());
  }

  void selectAnswer(int selectedIndex) {
    if (state is! QuizLoaded) return;
    final s = state as QuizLoaded;

    stopTimer();

    final correctIndex = s.questions[s.currentIndex].correctAnswerIndex;
    final bool isCorrect = selectedIndex == correctIndex;

    emit(
      s.copyWith(
        selectedIndex: selectedIndex,
        isCorrect: isCorrect,
        score: isCorrect ? s.score + 1 : s.score,
      ),
    );

    Future.delayed(const Duration(milliseconds: 1000), () {
      moveToNextQuestion();
    });
  }

  void moveToNextQuestion() {
    if (state is! QuizLoaded) return;
    final s = state as QuizLoaded;

    final isLast = s.currentIndex + 1 >= s.questions.length;

    if (isLast) {
      stopTimer();
      emit(QuizFinished(score: s.score, total: s.currentIndex));
      return;
    }

    emit(
      QuizLoaded(
        questions: s.questions,
        currentIndex: s.currentIndex + 1,
        score: s.score,
        timerSeconds: 10,
        selectedIndex: null,
        isCorrect: null,
        progress: 1.0,
      ),
    );

    startTimer();
  }

  void restartQuiz() {
    stopTimer();
    if (state is! QuizLoaded) return;

    final s = state as QuizLoaded;

    s.questions.shuffle();

    emit(
      QuizLoaded(
        questions: s.questions,
        currentIndex: 0,
        score: 0,
        selectedIndex: null,
        isCorrect: null,
        timerSeconds: 10,
        progress: 1.0,
      ),
    );
    startTimer();
  }
}
