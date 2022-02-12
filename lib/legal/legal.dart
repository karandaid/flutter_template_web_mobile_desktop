import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

import '../utils.dart';

class LegalScreen extends StatefulWidget {
  final String title;
  final String keyName;
  const LegalScreen({Key? key, required this.title, required this.keyName})
      : super(key: key);

  @override
  _LegalScreenState createState() => _LegalScreenState();
}

class _LegalScreenState extends State<LegalScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title,
        ),
      ),
      body: FutureBuilder(
        future: fetchDoc(widget.keyName),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Padding(
              padding: const EdgeInsets.all(20.0),
              child: MarkdownBody(
                data: '${snapshot.data}',
              ),
            );
          }
          return Container();
        },
      ),
    );
  }
}
