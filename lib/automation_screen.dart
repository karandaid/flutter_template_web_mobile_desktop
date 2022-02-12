import 'package:flutter/material.dart';

import 'ideas_screen.dart';
import 'utils.dart';

class AutomationScreen extends StatelessWidget {
  const AutomationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: fetchDoc('automation'),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final List list = snapshot.data as List;
            return Container(
              width: MediaQuery.of(context).size.width * .9,
              height: MediaQuery.of(context).size.height * .9,
              child: CustomScrollView(
                slivers: [
                  SliverGrid(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      childAspectRatio: 2 / 1.6,
                    ),
                    delegate: SliverChildBuilderDelegate(
                      (BuildContext context, int index) {
                        return DocCard(path: list[index]);
                      },
                      childCount: list.length,
                    ),
                  ),
                ],
              ),
            );
          }

          return Container();
        });
  }
}
