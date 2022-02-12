import 'package:dio/dio.dart';

Future<dynamic> fetchDoc(name) async {
  try {
    var response = await Dio().get(
      'https://f1w1cxron7.execute-api.us-east-2.amazonaws.com/mydocs/$name',
    );
    return response.data;
  } catch (e) {
    print('error: $e');
  }
  return "";
}
