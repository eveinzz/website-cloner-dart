import 'package:flutter_updated_boilerplate/data/network/dio/dio_resolver.dart';

class DioHandler {
  DioHandler._();

  static dynamic headers = {};

  static Future getWebsiteContent(String url) async {
    return resolveResponse(
      await getRequest(url, headers),
    );
  }

  static Future downloadFile(String url, String path) async {
    return resolveResponse(
      await download(url, path, headers),
    );
  }
}
