import 'package:flutter/material.dart';


class PageLayout extends StatelessWidget {

  final String nextPage;
  final String pageTitle;
  const PageLayout({
    super.key,
    required this.pageTitle,
    required this.nextPage
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(pageTitle, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 50)),
        // Image()
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
                onPressed: (){
                  Navigator.pop(context);
                }, child: const Text("Back")
            ),
            ElevatedButton(
              onPressed: (){
                Navigator.pushNamed(context, nextPage);
              },
              child: const Text("Next Question"),),
          ],
        )
      ],
    );
  }
}
