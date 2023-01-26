import 'package:flutter/foundation.dart';
import 'package:text_to_speech/text_to_speech.dart';
import '../Apis/Retrofit_Api.dart';
import '../Apis/base_model.dart';
import '../Apis/network_api.dart';
import '../Apis/server_error.dart';
import '../Models/Question_Model.dart';

class QuestionProvider extends ChangeNotifier {
  bool questionLoader = false;

  /// Question ///

  List<Data> questionList = [];

  Future<BaseModel<QuestionModel>> callApiQuestion() async {
    QuestionModel response;
    questionLoader = true;
    notifyListeners();
    try {
      response = await RestClient(RetroApi().dioData()).questionRequest();
      if (response.status == 200) {
        questionLoader = false;
        questionList.clear();
        questionList.addAll(response.data!);
        notifyListeners();
      }
    } catch (error, stacktrace) {
      questionLoader = false;
      if (kDebugMode) {
        print("Exception occur: $error stackTrace: $stacktrace");
      }
      notifyListeners();
      return BaseModel()..setException(ServerError.withError(error: error));
    }
    return BaseModel()..data = response;
  }

  /// Text To Spech ///
  TextToSpeech tts = TextToSpeech();

  // final String defaultLanguage = 'en-US';
  final String defaultLanguage = 'it';

  String text = '';
  double volume = 1; // Range: 0-1
  double rate = 1.0; // Range: 0-2
  double pitch = 1.0; // Range: 0-2

  String? language;
  String? languageCode;
  List<String> languages = <String>[];
  List<String> languageCodes = <String>[];
  String? voice;

  Future<void> initLanguages() async {
    /// populate lang code (i.e. en-US)
    languageCodes = await tts.getLanguages();

    /// populate displayed language (i.e. English)
    final List<String>? displayLanguages = await tts.getDisplayLanguages();
    if (displayLanguages == null) {
      return;
    }

    languages.clear();
    for (final dynamic lang in displayLanguages) {
      languages.add(lang as String);
    }

    final String? defaultLangCode = await tts.getDefaultLanguage();
    if (defaultLangCode != null && languageCodes.contains(defaultLangCode)) {
      languageCode = defaultLangCode;
    } else {
      languageCode = defaultLanguage;
    }
    language = await tts.getDisplayLanguageByCode(languageCode!);

    /// get voice
    voice = await getVoiceByLang(languageCode!);

    notifyListeners();
    // if (mounted) {
    //   setState(() {});
    // }
  }

  Future<String?> getVoiceByLang(String lang) async {
    final List<String>? voices = await tts.getVoiceByLang(languageCode!);
    if (voices != null && voices.isNotEmpty) {
      return voices.first;
    }
    return null;
  }

  void speak() {
    tts.setVolume(volume);
    tts.setRate(rate);
    if (languageCode != null) {
      tts.setLanguage(languageCode!);
    }
    tts.setPitch(pitch);
    tts.speak(text);
    notifyListeners();
  }

  @override
  notifyListeners();
}
