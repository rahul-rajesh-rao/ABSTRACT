import 'package:abstract_mp/packages/Create.dart';
import 'package:flutter/material.dart';

// Import the firebase_core and cloud_firestore plugin
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

// class addQuiz extends StatelessWidget {
//   final String quizTitle;
//   final String quizDifficulty;

//   addQuiz(
//     this.quizTitle,
//     this.quizDifficulty,
//   );

//   @override
//   Widget build(BuildContext context) {
//     // Create a CollectionReference called users that references the firestore collection
//     CollectionReference quiz = FirebaseFirestore.instance.collection('users');

//     Future<void> addQuiz() {
//       // Call the user's CollectionReference to add a new user
//       return quiz
//           .doc(quiz.id)
//           .set({
//             'Title': quizTitle, // John Doe
//             'quiz_Difficulty': quizDifficulty, // Stokes and Sons
//             // 42
//           })
//           .then((value) => print("Quiz Added"))
//           .catchError((error) => print("Failed to add Quiz: $error"));
//     }

//     return Create();
//   }
// }

class DatabaseService {
  Future<void> addQuizData(Map<String, dynamic> quizData, String quizId) async {
    await FirebaseFirestore.instance
        .collection("Quiz")
        .doc(quizId)
        .set(quizData)
        .catchError((e) {
      print(e);
    });
  }

  Future<void> addQuestionData(quizData, String quizId) async {
    await FirebaseFirestore.instance
        .collection("Quiz")
        .doc(quizId)
        .collection("QNA")
        .add(quizData)
        .catchError((e) {
      print(e);
    });
  }

  getQuestionData(String quizId) async {
    return await FirebaseFirestore.instance
        .collection("Quiz")
        .doc(quizId)
        .collection("QNA")
        .get();
  }
  // getQuizData() async {
  //   return await FirebaseFirestore.instance.collection("Quiz").snapshots();
  // }
}
