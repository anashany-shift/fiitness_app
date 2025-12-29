import 'package:firebase_ai/firebase_ai.dart';
import 'package:flutter/foundation.dart';

class GeminiFirebaseService {
  Future<String> getAiResponse(String prompt) async {
    try {
      final model = FirebaseAI.googleAI().generativeModel(
        model: 'gemini-2.5-flash',
        systemInstruction: Content.text(
          'You are a professional fitness coach. '
          'Answer only fitness, workout, nutrition, and healthy lifestyle questions. '
          'Give practical and safe advice.',
        ),
      );

      final response = await model.generateContent([Content.text(prompt)]);
      debugPrint(response.text);

      return response.text ?? 'No response from Gemini';
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
