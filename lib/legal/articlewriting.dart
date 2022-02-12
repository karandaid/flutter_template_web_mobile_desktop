import 'package:flutter/material.dart';
import 'legal.dart';

class ArticleWriting extends StatefulWidget {
  static const String routeName = '/articlewriting';
  const ArticleWriting({Key? key}) : super(key: key);

  @override
  _ArticleWritingState createState() => _ArticleWritingState();
}

class _ArticleWritingState extends State<ArticleWriting> {
  @override
  Widget build(BuildContext context) {
    return const LegalScreen(
      keyName: 'articlewriting.md',
      title: 'Article Writing Guidelines',
    );
  }
}
