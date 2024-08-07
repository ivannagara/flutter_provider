import 'package:http/http.dart' as http;

class NewsApi {
  String baseUrl = 'https://jsonplaceholder.typicode.com';
  Future<dynamic> getPosts() async {
    final res = await http.get(Uri.parse('$baseUrl/posts'));
    print(res);
  }
}
