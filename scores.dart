void main() {
  //String input = "1 2 3 4 5"; // pretend this is user input

  List<int> scores = [43, 45, 21, 65, 83, 23, 95];
  print("the scores are : $scores");
  int sum = 0;

  for (var i in scores) {
    sum += i;
  }

  double avg = sum / scores.length;
  print("the average is $avg");

  String grade = "";
  if (avg >= 90) {
    grade += 'A';
  } else if (avg >= 80) {
    grade += 'B';
  } else {
    grade += 'C';
  }
  print("the grade is $grade");

  //   is the ist is empty
  if (scores.isEmpty) {
    print("the list is empty");
  } else {
    print("the list is not empty");
  }
}
