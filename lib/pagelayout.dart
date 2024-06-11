import 'package:flutter/material.dart';
import 'package:flutter_code_editor/flutter_code_editor.dart';
import 'package:flutter_highlight/themes/monokai-sublime.dart';
import 'package:highlight/languages/cpp.dart';
// import 'package:flutter_code_editor/flutter_code_editor.dart';

class PageLayout extends StatelessWidget {
  final String nextPage;
  final String pageTitle;
  final String question;
  final TextEditingController controller;
  // final CodeController question;
  const PageLayout(
      {super.key,
      required this.question,
      required this.pageTitle,
      required this.nextPage,
      required this.controller
      // required this.question
      });

  @override
  Widget build(BuildContext context) {
    final myController = controller;
    final codeController = CodeController(
      text: question,
      language: cpp,
      readOnly: true,
    );

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(pageTitle,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 50)),
        const Text(
          'What is the output of the following code? ',
          style: TextStyle(fontSize: 30),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: CodeTheme(
            data: CodeThemeData(styles: monokaiSublimeTheme),
            child: CodeField(
              controller: codeController,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: TextField(
            maxLines: null,
            controller: myController,
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
                // if (nextPage == 'final') {
                //   for (var i = 0; i < controllers.length; i++) {

                //   }
                // }
                Navigator.pushNamed(context, nextPage);
              },
              child: nextPage == '/final'
                  ? const Text("Go to submit")
                  : const Text("Next Question"),
            ),
          ],
        )
      ],
    );
  }
}
