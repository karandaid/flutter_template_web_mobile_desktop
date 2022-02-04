import 'package:flutter/material.dart';

class AutomationScreen extends StatelessWidget {
  const AutomationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * .9,
      height: MediaQuery.of(context).size.height * .9,
      child: CustomScrollView(
        slivers: [
          SliverList(
            delegate: SliverChildListDelegate(
              [Text('Automation Screen')],
            ),
          ),
        ],
      ),
    );
  }
}
