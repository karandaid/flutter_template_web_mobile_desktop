import 'package:flutter/material.dart';
import 'legal.dart';

class PrivacyScreen extends StatefulWidget {
  static const String routeName = '/privacy';
  const PrivacyScreen({Key? key}) : super(key: key);

  @override
  _PrivacyScreenState createState() => _PrivacyScreenState();
}

class _PrivacyScreenState extends State<PrivacyScreen> {
  @override
  Widget build(BuildContext context) {
    return const LegalScreen(
      keyName: 'privacypolicy.md',
      title: 'Privacy Policy',
    );
  }
}
