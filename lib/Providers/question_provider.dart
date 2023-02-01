import 'package:flutter/foundation.dart';
import 'package:text_to_speech/text_to_speech.dart';
import '../Apis/Retrofit_Api.dart';
import '../Apis/base_model.dart';
import '../Apis/network_api.dart';
import '../Apis/server_error.dart';
import '../Models/ChapterList_Model.dart';
import '../Models/Question_Model.dart';

class QuestionProvider extends ChangeNotifier {
  bool questionLoader = false;

  /// Question ///

  List<QuestionData> questionList = [];
  List<String> dropDownValue = [];
  var items = [
    'Hindi',
    'English',
  ];

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
        for (int i = 0; i < questionList.length; i++) {
          dropDownValue.add('Hindi');
        }
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

  // show Translate //
  int? _selectTranslateIndex = 0;

  int? get selectTranslateIndex => _selectTranslateIndex;

  set selectTranslateIndex(int? value) {
    _selectTranslateIndex = value;
  }

  selectIndex(int? index) {
    selectTranslateIndex = index;
    notifyListeners();
  }

  /// Text To Spech ///
  TextToSpeech tts = TextToSpeech();

  final String defaultLanguage = 'it-IT';

  String text = '';
  double volume = 1; // Range: 0-1
  double rate = 1.0; // Range: 0-2
  double pitch = 0.5; // Range: 0-2

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

    const String defaultLangCode = 'it-IT';
    if (languageCodes.contains(defaultLangCode)) {
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

  /// Chapter List ///

  List<ChapterList> chapterList = [];
  String selectChapter = "";// show chapter

  Future<BaseModel<ChapterListModel>> callApiChapterList() async {
    ChapterListModel response;

    notifyListeners();
    try {
      response = await RestClient(RetroApi().dioData()).chapterListRequest();
      if (response.status == 200) {
        chapterList.clear();
        chapterList.addAll(response.data!.chapter!);
        selectChapter = chapterList[0].chapter!;
        notifyListeners();
      }
    } catch (error, stacktrace) {
      if (kDebugMode) {
        print("Exception occur: $error stackTrace: $stacktrace");
      }
      notifyListeners();
      return BaseModel()..setException(ServerError.withError(error: error));
    }
    return BaseModel()..data = response;
  }

  @override
  notifyListeners();
}
