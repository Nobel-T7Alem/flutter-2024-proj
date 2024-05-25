import '../models/posts.dart';
import 'package:http/http.dart' as http;
class RemoteService
{

  Future<List<Post>?> getPosts() async {
    var client = http.Client();
    var uri = Uri.parse('http://localhost:3000/posts');
    final response = await client.get(uri);
    if (response.statusCode == 200) {
      var jsonString = response.body;
      return postFromJson(jsonString);
    } else {
      return (null
      );

    }
  }
}