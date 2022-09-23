
import 'package:api_integration/view/catagory/model/jsonurl.dart';
import 'package:http/http.dart' as http;

class JsonurlServices {
  static const String url = "https://jsonplaceholder.typicode.com/photos";

  static Future<List<Jsonurl>> geturl() async {
    try {
      final response = await http.get(Uri.parse(url));
      if (200 == response.statusCode) {
        final List<Jsonurl> image = jsonurlFromJson(response.body);
        return image;
      } else {
        return <Jsonurl>[];
      }
    } catch (e) {
      return <Jsonurl>[];
    }
  }
}
