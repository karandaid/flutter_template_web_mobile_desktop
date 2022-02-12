import 'package:flutter/material.dart';
import 'legal.dart';

class CookieScreen extends StatefulWidget {
  static const String routeName = '/cookies';
  const CookieScreen({Key? key}) : super(key: key);

  @override
  _CookieScreenState createState() => _CookieScreenState();
}

class _CookieScreenState extends State<CookieScreen> {
  @override
  Widget build(BuildContext context) {
    return const LegalScreen(
      keyName: 'cookies.md',
      title: 'Cookies Policy',
    );
  }
}
