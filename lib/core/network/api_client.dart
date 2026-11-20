import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:tanampedia/core/constants/api_constants.dart';
import 'package:tanampedia/core/network/api_exception.dart';

class ApiClient {
  ApiClient({http.Client? client}) : _client = client ?? http.Client();

  final http.Client _client;

  Future<Map<String, dynamic>> getJson(
    String path, {
    Map<String, String>? queryParameters,
  }) async {
    final parameters = <String, String>{};
    if (queryParameters != null) {
      parameters.addAll(queryParameters);
    }
    final uri = Uri.parse('${ApiConstants.baseUrl}$path').replace(queryParameters: parameters);

    try {
      final response = await _client
          .get(uri, headers: _headers)
          .timeout(const Duration(seconds: 8));

      if (response.statusCode < 200 || response.statusCode >= 300) {
        throw _mapHttpError(response.statusCode);
      }

      final decoded = jsonDecode(response.body);
      if (decoded is! Map<String, dynamic>) {
        throw const ApiException(message: 'Format data dari server tidak valid.');
      }

      return decoded;
    } on ApiException {
      rethrow;
    } on FormatException {
      throw const ApiException(message: 'Format data dari server tidak valid.');
    } on Exception {
      throw const ApiException(
        message: 'Tidak dapat terhubung ke server. Periksa koneksi internet.',
      );
    }
  }

  Map<String, String> get _headers {
    return <String, String>{
      'Accept': 'application/json',
      'Content-Type': 'application/json',
    };
  }

  ApiException _mapHttpError(int statusCode) {
    if (statusCode == 401 || statusCode == 403) {
      return ApiException(
        message: 'Akses ke katalog ditolak oleh server.',
        statusCode: statusCode,
      );
    }
    if (statusCode == 404) {
      return ApiException(
        message: 'Data katalog tidak ditemukan.',
        statusCode: statusCode,
      );
    }
    if (statusCode == 429) {
      return ApiException(
        message: 'Batas permintaan tercapai. Coba lagi beberapa saat lagi.',
        statusCode: statusCode,
      );
    }
    return ApiException(
      message: 'Server katalog sedang mengalami kendala.',
      statusCode: statusCode,
    );
  }
}
