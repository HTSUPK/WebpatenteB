import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';
import 'package:webpatente/Widgets/common_appbar.dart';
import 'package:webpatente/Widgets/common_button.dart';
import 'package:webpatente/resources/color_resources.dart';
import '../../Providers/quiz_provider.dart';
import '../../Widgets/chapterCard_widget.dart';
import '../../Widgets/text_widget.dart';
import '../../base/base_stateful_widget.dart';
import '../../resources/image_resources.dart';
import 'QuizScreen.dart';
import '../Question/QuestionScreen.dart';

class SelectChapterScreen extends StatefulWidget {
  const SelectChapterScreen({Key? key}) : super(key: key);

  @override
  State<SelectChapterScreen> createState() => _SelectChapterScreenState();
}

class _SelectChapterScreenState extends BaseStatefulWidgetState<SelectChapterScreen> {
  late QuizProvider quizProvider;

  @override
  void initState() {
    // TODO: implement initState
    quizProvider = Provider.of(context, listen: false);
    Future.delayed(const Duration(seconds: 0), () {
      quizProvider.callApiChapterList();
    });
    super.initState();
  }

  @override
  // TODO: implement scaffoldBgColor
  Color? get scaffoldBgColor => colorBackground;

  @override
  PreferredSizeWidget? buildAppBar(BuildContext context) {
    // TODO: implement buildAppBar
    return const CommonAppBar(
      title: "Quiz",
      backIcon: icArrowLeft,
    );
  }

  @override
  Widget buildBody(BuildContext context) {
    return Consumer<QuizProvider>(builder: (_, quizProvider, __) {
      return quizProvider.quizLoader
          ? Shimmer.fromColors(
              baseColor: Colors.grey[300]!,
              highlightColor: Colors.grey[100]!,
              child: ListView.builder(
                  // itemCount: 10,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: Column(
                        children: [
                          heightBox(10),
                          const ChapterCard(
                            // image: "",
                            text: "",
                            borderColor: colorWhite,
                          ),
                        ],
                      ),
                    );
                  }),
            )
          : ListView.builder(
              itemCount: quizProvider.chapterList.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                for (int i = 0; i < quizProvider.chapterList.length; i++) {
                  quizProvider.selectChapter.add(false);
                }
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Column(
                    children: [
                      heightBox(10),
                      ChapterCard(
                        // image: "https://hexeros.com/dev/superapp/uploads/user/user.png",
                        text: quizProvider.chapterList[index].chapter,
                        borderColor: quizProvider.selectChapter[index] == true ? colorPrimary : colorWhite,
                        onTap: () {
                          setState(() {
                            quizProvider.selectChapter[index] = quizProvider.selectChapter[index] == true ? false : true;
                            onSelect(quizProvider.selectChapter[index], quizProvider.chapterList[index].id);
                            setState(() {});
                          });
                        },
                      ),
                    ],
                  ),
                );
              });
    });
  }

  onSelect(bool selected, chapterId) {
    if (selected == true) {
      quizProvider.selectChapterId.add(chapterId);
      if (kDebugMode) {
        print("ID ${quizProvider.selectChapterId}");
      }
    } else {
      quizProvider.selectChapterId.remove(chapterId);
      if (kDebugMode) {
        print("ID ${quizProvider.selectChapterId}");
      }
    }
  }

  @override
  Widget? buildBottomNavigationBar(BuildContext context) {
    // TODO: implement buildBottomNavigationBar
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
      child: CommonButton(
        text: "Let’s Start",
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const QuizScreen(),
          ),
        ),
      ),
    );
  }
}
