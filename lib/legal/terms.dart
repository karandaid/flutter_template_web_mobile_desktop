import 'package:flutter/material.dart';
import 'legal.dart';

class TermsScreen extends StatefulWidget {
  static const String routeName = '/terms';
  const TermsScreen({Key? key}) : super(key: key);

  @override
  _TermsScreenState createState() => _TermsScreenState();
}

class _TermsScreenState extends State<TermsScreen> {
  @override
  Widget build(BuildContext context) {
    return const LegalScreen(
      keyName: 'terms.md',
      title: 'Terms and Conditions',
    );
  }
}
