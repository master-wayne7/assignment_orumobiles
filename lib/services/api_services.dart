import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiService {
  final String baseUrl =
      'https://dev2be.oruphones.com/api/v1/global/assignment';

  Future<List<dynamic>> getListings(int page, int limit) async {
    final url = '$baseUrl/getListings?page=$page&limit=$limit';

    final response = await http.get(Uri.parse(url), headers: {
      'Content-Type': 'application/json',
    });

    if (response.statusCode == 200) {
      // print(response.body);
      return jsonDecode(response.body)["listings"];
    } else {
      throw Exception('Failed to load listings');
    }
  }

  Future<Map<String, dynamic>> getFilters(bool isLimited) async {
    final url = '$baseUrl/getFilters?isLimited=$isLimited';

    final response = await http.get(Uri.parse(url), headers: {
      'Content-Type': 'application/json',
    });

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to load filters');
    }
  }

  Future<Map<String, dynamic>> searchModel(String model) async {
    final url = '$baseUrl/searchModel';

    final body = {'searchModel': model};

    final response = await http.post(Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode(body));

    if (response.statusCode == 200) {
      // print(response.body);
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to search model');
    }
  }
}
