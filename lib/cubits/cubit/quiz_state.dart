part of 'quiz_cubit.dart';

sealed class QuizState extends Equatable {
  @override
  List<Object?> get props => [];
}

class QuizInit extends QuizState {}

class QuizLoading extends QuizState {}

class QuizLoaded extends QuizState {
  final List<QuestionModel> questions;
  final int currentIndex;
  final int score;
  final int? selectedIndex;
  final bool? isCorrect;
  final int timerSeconds;
  final double progress;

  QuizLoaded({
    required this.questions,
    required this.currentIndex,
    required this.score,
    required this.selectedIndex,
    this.isCorrect,
    required this.timerSeconds,
    required this.progress,
  });

  QuizLoaded copyWith({
    List<QuestionModel>? questions,
    int? currentIndex,
    int? score,
    bool? optionLocked,
    int? selectedIndex,
    bool? isCorrect,
    int? timerSeconds,
    double? progress,
  }) {
    return QuizLoaded(
      questions: questions ?? this.questions,
      currentIndex: currentIndex ?? this.currentIndex,
      score: score ?? this.score,
      selectedIndex: selectedIndex,
      timerSeconds: timerSeconds ?? this.timerSeconds,
      progress: progress ?? this.progress,
    );
  }

  @override
  List<Object?> get props => [
    questions,
    currentIndex,
    score,
    selectedIndex,
    isCorrect,
    timerSeconds,
    progress,
  ];
}

class QuizFinished extends QuizState {
  final int score;
  final int total;

  QuizFinished({required this.score, required this.total});

  @override
  List<Object?> get props => [score, total];
}

class QuizFailed extends QuizState {
  final String errorMessage;

  QuizFailed({required this.errorMessage});
  @override
  List<Object?> get props => [errorMessage];
}
