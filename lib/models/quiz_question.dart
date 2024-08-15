class QuizQuestion {
  const QuizQuestion(
      {
      required this.text,
      required this.answers});
  final String text;
  final List<String> answers;
  List<String> getShuffledAnswers() {
    final shuffledList =
        List.of(answers); //Obtaining the copy of list before shuffling
    shuffledList.shuffle(); //shuffling the copy of the list
    return shuffledList; //returning the shuffled copy
  }
}
