// Dart imports:
import 'dart:convert';

// Package imports:
import 'package:http/http.dart' as http;

class Data {
  // Singleton instance
  static final Data _instance = Data._internal();

  factory Data() => _instance;

  Data._internal();

  List<Map<String, String>>? _cachedData;

  Future<List<Map<String, String>>> get data async {
    _cachedData ??= await _fetchEventList();
    return _cachedData!;
  }

  Future<List<Map<String, String>>> _fetchEventList() async {
    final response = await http.get(
      Uri.parse('https://melancong-hosting.web.app/eventData.json'),
    );

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);

      if (jsonData is List) {
        return jsonData.cast<Map<String, dynamic>>().map((item) {
          return item.map<String, String>(
            (key, value) => MapEntry(key, value?.toString() ?? ''),
          );
        }).toList();
      } else {
        throw Exception('Expected a list but got ${jsonData.runtimeType}');
      }
    } else {
      return [];
    }
  }
}
