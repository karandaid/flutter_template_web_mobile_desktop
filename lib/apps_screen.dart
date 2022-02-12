import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'ideas_screen.dart';
import 'utils.dart';
import 'utils/front_matter.dart';

class AppsScreen extends StatelessWidget {
  const AppsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: fetchDoc('apps'),
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
