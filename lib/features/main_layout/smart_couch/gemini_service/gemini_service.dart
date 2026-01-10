// import 'package:google_generative_ai/google_generative_ai.dart';

// class GeminiService {
//   late GenerativeModel generativeModel;
//   late final ChatSession _chat;

//   GeminiService() {
//     generativeModel = GenerativeModel(
//       model: "gemini-2.5-flash",
//       apiKey: "AIzaSyCIU_-dRtkGli6gz1Ya29PltZpV0-sfhJs",
//       systemInstruction: Content.system("You are a professional fitness coach for the 'Fitness App'. "
//     "Keep answers motivating, concise, and focused on health and workouts.",
//     )
//     );
//     _chat = generativeModel.startChat();
//   }

//   Future<String?> getGeminiResponse(String prompt) async {
//     try {
//       final content = Content.text(prompt);
//       final response = await _chat.sendMessage(content);
//       return response.text;
//     } on Exception catch (e) {
//       return "Sorry, I'm having trouble connecting right now.";
//     }
//   }
// }
