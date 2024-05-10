// import 'dart:convert';
//
// import 'package:firebase_remote_config/firebase_remote_config.dart';
//
// class RemoteConfigs {
//
//   static String getEnPointFromRemoteConfigs(String ai) {
//     if (ai.isEmpty)
//       return "";
//
//     final FirebaseRemoteConfig remoteConfig = FirebaseRemoteConfig.instance;
//     final openAIConfig = remoteConfig.getString("bookAiConfig");
//     final openAIConfigJson = jsonDecode(openAIConfig);
//
//     if (ai.toLowerCase() == 'openai') {
//       return openAIConfigJson['endPoint']['openAI'];
//     } else {
//       return openAIConfigJson['endPoint']['geminiAI'];
//     }
//   }
//
//   static String getPrivacyPolicyUrlFromRemoteConfigs() {
//     final FirebaseRemoteConfig remoteConfig = FirebaseRemoteConfig.instance;
//     final openAIConfig = remoteConfig.getString("bookAiConfig");
//     final openAIConfigJson = jsonDecode(openAIConfig);
//
//     return openAIConfigJson['extra']['privacyPolicy'] ?? "";
//   }
//
//   static String getBuyGemsUpdateFromRemoteConfigs() {
//     final FirebaseRemoteConfig remoteConfig = FirebaseRemoteConfig.instance;
//     final openAIConfig = remoteConfig.getString("bookAiConfig");
//     final openAIConfigJson = jsonDecode(openAIConfig);
//     return openAIConfigJson['endPoint']['buyGemsUpdate'] ?? "";
//   }
// }