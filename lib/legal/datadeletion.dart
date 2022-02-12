import 'package:flutter/material.dart';
import 'legal.dart';

class DataDeletionScreen extends StatefulWidget {
  static const String routeName = '/datadeletion';
  const DataDeletionScreen({Key? key}) : super(key: key);

  @override
  _DataDeletionScreenState createState() => _DataDeletionScreenState();
}

class _DataDeletionScreenState extends State<DataDeletionScreen> {
  @override
  Widget build(BuildContext context) {
    return const LegalScreen(
      keyName: 'datadeletion.md',
      title: 'Data Deletion Policy',
    );
  }
}
