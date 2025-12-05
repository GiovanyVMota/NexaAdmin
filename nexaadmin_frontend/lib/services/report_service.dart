import 'dart:convert';
import 'package:http/http.dart' as http;
import 'api_service.dart';

class ReportService {
  Future<List<dynamic>> getReports() async {
    final response = await http.get(
      Uri.parse("${Api.baseUrl}/reports"),
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception("Erro ao carregar relatórios");
    }
  }
}
