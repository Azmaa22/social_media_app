import 'dart:typed_data';

import 'package:http/http.dart' as http;

class ImageHelper {
  static Future<Uint8List> getNetworkImage(String url) async {
    var imageUrl = Uri.parse(url);
    http.Response response = await http.get(
      imageUrl,
    );
    return response.bodyBytes;
  }
}
