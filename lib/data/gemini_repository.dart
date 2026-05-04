import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:smart_text_tool/core/constants.dart';

class GeminiRepository {
  late final GenerativeModel _model;

  GeminiRepository() {
    _model = GenerativeModel(
      model: 'gemini-2.5-flash', 
      apiKey: dotenv.env['GEMINI_API_KEY']!,
    );
  }

  Future<String> processText(String text, TextAction action) async {
    try {
      final prompt = action.buildPrompt(text);
      final response = await _model.generateContent([Content.text(prompt)]);
      final result = response.text;
      
      if (result == null || result.isEmpty) {
        throw Exception('Empty response from Gemini');
      }
      return result;
    } on GenerativeAIException catch (e) {
      // This will now catch and show descriptive errors if the key/model mismatch
      throw Exception('Gemini error: ${e.message}');
    } catch (e) {
      throw Exception('Unexpected error: $e');
    }
  }
}