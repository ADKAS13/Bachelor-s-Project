import 'dart:math';

import 'package:bachelors_project/firebase_options.dart';
import 'package:bachelors_project/questions.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'pages.dart';

// var ID = Random().nextInt(2147483647);
List<TextEditingController> controllers = [
  TextEditingController(),
  TextEditingController(),
  TextEditingController(),
  TextEditingController(),
  TextEditingController(),
  TextEditingController(),
];

final questions = <Question>[];
bool isDynamic = true;

void main() async {
  setQuestions();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

// Add a new document with a generated ID
  // db.collection("users").add(user).then((DocumentReference doc) =>
  //     print('DocumentSnapshot added with ID: ${doc.id}'));

  runApp(const MyApp());
}

void setQuestions() {
  Question newQuestion;
  if (isDynamic) {
    // for (var i = 0; i < 4; i++) {
    var i = 2;
    questions.add(staticQuestions.last);
    questions.add(dynamicQuestions.last);
    while (i < 6) {
      if (i < 4) {
        newQuestion = dynamicQuestions
            .elementAt(Random().nextInt(dynamicQuestions.length));
        if (!questions.contains(newQuestion)) {
          questions.add(newQuestion);
          i++;
        }
      } else if (i < 6) {
        newQuestion =
            staticQuestions.elementAt(Random().nextInt(staticQuestions.length));
        if (!questions.contains(newQuestion)) {
          questions.add(newQuestion);
          i++;
        }
      }
    }
  } else {
    var i = 0;
    while (i < 6) {
      if (i < 4) {
        newQuestion =
            staticQuestions.elementAt(Random().nextInt(staticQuestions.length));
        if (!questions.contains(newQuestion)) {
          questions.add(newQuestion);
          i++;
        }
      } else if (i < 6) {
        newQuestion = dynamicQuestions
            .elementAt(Random().nextInt(dynamicQuestions.length));
        if (!questions.contains(newQuestion)) {
          questions.add(newQuestion);
          i++;
        }
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
        '/3': (context) => const Question3(),
        '/4': (context) => const Question4(),
        '/5': (context) => const Question5(),
        '/6': (context) => const Question6(),
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
