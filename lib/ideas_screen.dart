import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'utils.dart';
import 'utils/front_matter.dart';

class IdeasScreen extends StatelessWidget {
  const IdeasScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: fetchDoc('ideas'),
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
                      childAspectRatio: 4 / 1.6,
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

class DocCard extends StatelessWidget {
  final String path;
  const DocCard({Key? key, required this.path}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var fileName = path.replaceAll('karandeep/', '');
    return FutureBuilder(
      future: fetchDoc(fileName),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final frontMatter = FrontMatter(document: snapshot.data);
          final map = frontMatter.toJSON();
          print(map['content']);
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              elevation: 2,
              child: ListTile(
                onTap: () {
                  Navigator.of(context).pushNamed(
                    'ideas/${map['title'].replaceAll(" ", "_").toString().toLowerCase()}',
                    arguments: map,
                  );
                },
                leading: const FlutterLogo(),
                title: Text(map['title'].trim()),
                subtitle: Text(
                  map['description'] ?? '',
                  overflow: TextOverflow.visible,
                ),
              ),
            ),
          );
        }
        return Container();
      },
    );
  }
}

class DocRead extends StatelessWidget {
  final Map<String, dynamic> map;
  const DocRead({Key? key, required this.map}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        elevation: 10,
        title: Text(
          map['title'],
          style: const TextStyle(
            color: Colors.black,
          ),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 20.w,
              child: Container(
                color: Colors.grey[200],
              ),
            ),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.all(20),
                children: [
                  Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: MarkdownBody(
                      data: map['content']
                          .replaceAll("\\n", "\n")
                          .toString()
                          .trim(),
                      softLineBreak: true,
                      onTapLink: (a, b, c) {
                        print('a: $a');
                        print('b: $b');
                        print('c: $c');
                        // Navigator.of(context).push(
                        //   MaterialPageRoute<void>(
                        //     fullscreenDialog: true,
                        //     builder: (BuildContext context) => _MyWebView(url: '$b'),
                        //   ),
                        // );
                      },
                      imageBuilder: (uri, a, b) {
                        print(uri);
                        print(a);
                        print(b);
                        return Image.network(
                          uri.toString(),
                          width: 50.w,
                          height: 50.h,
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 20.w,
              child: Container(
                color: Colors.grey[200],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
