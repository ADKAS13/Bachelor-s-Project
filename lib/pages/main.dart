import 'package:bachelors_project/firebase_options.dart';
import 'package:bachelors_project/pages/question1.dart';
import 'package:bachelors_project/pages/question2.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

// var ID = Random().nextInt(2147483647);
List<TextEditingController> controllers = [
  TextEditingController(),
  TextEditingController(),
  TextEditingController(),
  TextEditingController(),
  TextEditingController(),
];
void main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // final db = FirebaseFirestore.instance;
  // final user = <String, dynamic>{
  //   "first": "Ada",
  //   "last": "Lovelace",
  //   "born": 1815
  // };

// Add a new document with a generated ID
  // db.collection("users").add(user).then((DocumentReference doc) =>
  //     print('DocumentSnapshot added with ID: ${doc.id}'));

  runApp(const MyApp());
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
