import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class RecomendationService {
  final Dio _dio = Dio();
  final String _apiUrl = 'https://api.openai.com/v1/chat/completions';
  final String _apiKey = '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';

  Future<String> getRecommendation(TextEditingController harga,
      TextEditingController kamera, TextEditingController penyimpanan) async {
    try {
      final response = await _dio.post(
        _apiUrl,
        data: {
          'model': 'gpt-3.5-turbo',
          'messages': [
            {
              'role': 'system',
              'content':
                  'Anda adalah seorang ahli dalam memberikan rekomendasi smartphone berdasarkan harga, kamera, dan penyimpanan.'
            },
            {
              'role': 'user',
              'content':
                  'Berikan saya rekomendasi smartphone dengan kebutuhan harga smartphone ${harga.text}, spesifikasi kamera sekitar ${kamera.text}, dan penyimpanannya sebanyak ${penyimpanan.text}.'
            },
          ],
        },
        options: Options(
          headers: {
            'Authorization': 'Bearer $_apiKey',
            'Content-Type': 'application/json',
          },
        ),
      );

      if (response.statusCode == 200) {
        return response.data['choices'][0]['message']['content'];
      } else {
        throw Exception('Failed to load response');
      }
    } catch (e) {
      print('Error $e');
      throw Exception('Error: $e');
    }
  }
}
