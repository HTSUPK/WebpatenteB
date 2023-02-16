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

  /// Question Call Function ///

  questionFunction(chapterId, pageNo) {
    // currentChapterId = chapterId;
    // currentPageNo = pageNo;
    Map<String, dynamic> body = {
      "chapter_id": chapterId,
      "page": pageNo,
    };
    print("BODY $body");
    callApiQuestion(body);
  }

  /// Question ///

  List<QuestionData> questionList = [];
  List<String> dropDownValue = [];
  var items = [
    'English',
    'Hindi',
    'Urdu',
  ];
  List<String> selectLanguageCode = [];

  Future<BaseModel<QuestionModel>> callApiQuestion(body) async {
    QuestionModel response;
    questionLoader = true;
    notifyListeners();
    try {
      response = await RestClient(RetroApi().dioData()).questionRequest(body);
      if (response.status == 200) {
        questionLoader = false;
        questionList.clear();
        selectLanguageCode.clear();
        questionList.addAll(response.data!);
        currentChapterId = body['chapter_id'];
        currentPageNo = body['page'];
        for (int i = 0; i < questionList.length; i++) {
          dropDownValue.add('English');
          selectLanguageCode.add(questionList[i].languageTexts!.en!);
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

  /// show Translate ///
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
  List<Page> pageList = [];
  String selectChapter = "";
  int _currentChapterId = 0;
  int _currentPageNo = 1;
  int _currentSequence = 1;

  int get currentSequence => _currentSequence;

  set currentSequence(int value) {
    _currentSequence = value;
  }

  int get currentChapterId => _currentChapterId;

  set currentChapterId(int value) {
    _currentChapterId = value;
  }

  int get currentPageNo => _currentPageNo;

  set currentPageNo(int value) {
    _currentPageNo = value;
  }

  Future<BaseModel<ChapterListModel>> callApiChapterList() async {
    ChapterListModel response;
    questionLoader = true;
    notifyListeners();
    try {
      response = await RestClient(RetroApi().dioData()).chapterListRequest();
      if (response.status == 200) {
        questionLoader = false;
        chapterList.clear();
        pageList.clear();
        chapterList.addAll(response.data!.chapter!);
        pageList.addAll(response.data!.page!);
        print("Page ${pageList.length}");
        selectChapter = chapterList[0].chapter!;
        currentChapterId = response.data!.chapter![0].id!;
        currentSequence = response.data!.page![0].sequence!;
        currentPageNo = response.data!.page![0].sequence!;
        print("CId $currentChapterId");
        Map<String, dynamic> body = {
          "chapter_id": currentChapterId,
          // "page": currentPageNo,
          "page": currentSequence,
        };
        callApiQuestion(body);
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

  @override
  notifyListeners();
}
