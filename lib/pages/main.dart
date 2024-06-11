import 'dart:math';

import 'package:bachelors_project/firebase_options.dart';
import 'package:bachelors_project/pages/final_page.dart';
import 'package:bachelors_project/pages/question1.dart';
import 'package:bachelors_project/pages/question2.dart';
import 'package:bachelors_project/questions.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

// var ID = Random().nextInt(2147483647);
List<TextEditingController> controllers = [
  TextEditingController(),
  TextEditingController(),
  // TextEditingController(),
  // TextEditingController(),
  // TextEditingController(),
];

final questions = <String>[];

void main() async {
  setQuestions(false);
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

// Add a new document with a generated ID
  // db.collection("users").add(user).then((DocumentReference doc) =>
  //     print('DocumentSnapshot added with ID: ${doc.id}'));

  runApp(const MyApp());
}

void setQuestions(bool isDynamic) {
  String newQuestion;
  if (isDynamic) {
    for (var i = 0; i < 6; i++) {
      newQuestion =
          dynamicQuestions.elementAt(Random().nextInt(dynamicQuestions.length));
      if (!questions.contains(newQuestion)) {
        questions.add(newQuestion);
      }
    }

    for (var i = 0; i < 4; i++) {
      newQuestion =
          staticQuestions.elementAt(Random().nextInt(staticQuestions.length));
      if (!questions.contains(newQuestion)) {
        questions.add(newQuestion);
      }
    }
  } else {
    for (var i = 0; i < 6; i++) {
      newQuestion =
          staticQuestions.elementAt(Random().nextInt(staticQuestions.length));
      if (!questions.contains(newQuestion)) {
        questions.add(newQuestion);
      }
    }

    for (var i = 0; i < 4; i++) {
      newQuestion =
          dynamicQuestions.elementAt(Random().nextInt(dynamicQuestions.length));
      if (!questions.contains(newQuestion)) {
        questions.add(newQuestion);
      }
    }
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: './',
      title: "Bachelor's Project Quiz",
      routes: {
        '/': (context) => const MainPage(),
        '/1': (context) => const Question1(),
        '/2': (context) => const Question2(),
        '/final': (context) => const FinalPage(),
      },
    );
  }
}

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text("Coding Quiz Natural Language",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 100,
                  fontWeight: FontWeight.bold)),
          Padding(
            padding: const EdgeInsets.only(top: 100.0),
            child: ButtonTheme(
              minWidth: 200,
              height: 100,
              child: ElevatedButton(
                  child: const Text("Start Quiz"),
                  onPressed: () {
                    Navigator.pushNamed(context, '/1');
                  }),
            ),
          ),
        ],
      ),
    ));
  }
}
