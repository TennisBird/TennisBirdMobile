import 'package:core/exceptions/url_launcher.dart';
import 'package:dio/dio.dart';

class UrlLaunch {
  final Dio _dio = Dio();

  Future<void> launch(String url) async {
    try {
      final response = await _dio.get(url);

      if (response.statusCode != 200) {
        throw UrlLauncherException(
          'Error: $url',
        );
      }
    } catch (_) {}
  }
}
