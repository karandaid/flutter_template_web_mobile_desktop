import 'dart:convert';

import 'package:yaml/yaml.dart';

class FrontMatter {
  final dynamic document;
  const FrontMatter({required this.document});

  Map<String, dynamic> toJSON() {
    final content = document.split('--- content ---')[1];

    final frontMatterYaml = loadYaml(
      json.decode(document).split('--- content ---')[0],
    );
    final Map<String, dynamic> map = {...frontMatterYaml, 'content': content};
    return map;
  }
}
