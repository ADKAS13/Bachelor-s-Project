import 'package:bachelors_project/main.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class FinalPage extends StatelessWidget {
  const FinalPage({super.key});

  @override
  Widget build(BuildContext context) {
    final db = FirebaseFirestore.instance;
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Padding(
            padding: EdgeInsets.all(0),
            child: Text("This is the end of the quiz",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 50)),
          ),
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Thank you for your participation',
              style: TextStyle(fontSize: 30),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text("Back")),
              ElevatedButton(
                  onPressed: () {
                    final answer = <String, dynamic>{};
                    for (int i = 1; i <= controllers.length; i++) {
                      answer["Questions $i"] = questions[i - 1].questionText;
                      answer["Answer $i"] = controllers[i - 1].text;
                    }
                    db.collection("answers").add(answer).then(
                        (DocumentReference doc) =>
                            print('DocumentSnapshot added with ID: ${doc.id}'));
                    // TODO: Navigator.pushNamed(context, ThankYouPage());
                  },
                  child: const Text("Submit")),
            ],
          )
        ],
      ),
    );
  }
}
