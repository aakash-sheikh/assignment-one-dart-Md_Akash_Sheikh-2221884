// Question 2: Collections & Control Flow (Difficulty: 2/5) ⭐⭐
/// EXPECTED OUTPUT:
/// Student Scores: {Alice: <random>, Bob: <random>, ...}
/// Highest Score: <Name> with <Score>
/// Lowest Score: <Name> with <Score>
/// Average Score: <Value>
/// Alice: <Score> (Category)
/// ...

import 'dart:math';

void main() {
  // 1. Create a List<String> of student names: ["Alice", "Bob", "Charlie", "Diana", "Eve"]
  var studentNames = <String>['Alice', 'Bob', 'Charlie', 'Diana', 'Eve'];

  // 2. Create a Map<String, int> to store student scores
  var studentScores = <String, int>{};

  // 3. Use a for loop to assign random scores (60-100) to each student
  var random = Random();
  for (var student in studentNames) {
    // random.nextInt(41) gives a number from 0 to 40. Adding 60 makes it 60 to 100.
    studentScores[student] = 60 + random.nextInt(41);
  }

  // 4. Find and display: highest, lowest, and average scores
  var highestStudent = '';
  var highestScore = 0;
  var lowestStudent = '';
  var lowestScore = 100;
  var totalScore = 0;

  // Logic to find highest, lowest, and total score
  for (var entry in studentScores.entries) {
    var student = entry.key;
    var score = entry.value;

    totalScore += score; // Add to total for average calculation

    if (score > highestScore) {
      highestScore = score;
      highestStudent = student;
    }

    if (score < lowestScore) {
      lowestScore = score;
      lowestStudent = student;
    }
  }

  // Calculate average
  var averageScore = totalScore / studentScores.length;

  print('Student Scores: $studentScores');
  print('Highest Score: $highestStudent with $highestScore');
  print('Lowest Score: $lowestStudent with $lowestScore');
  print('Average Score: $averageScore');

  // 5. Use a switch statement to categorize students
  for (var student in studentNames) {
    var score = studentScores[student] ?? 0;
    var category = '';

    // Using Dart 3 pattern matching switch statement
    switch (score) {
      case >= 90 && <= 100:
        category = 'Excellent';
      case >= 80 && <= 89:
        category = 'Good';
      case >= 70 && <= 79:
        category = 'Average';
      default:
        category = 'Needs Improvement';
    }

    print('$student: $score ($category)');
  }
}