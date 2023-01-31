import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';
import 'package:webpatente/Widgets/common_appbar.dart';
import 'package:webpatente/Widgets/common_button.dart';
import 'package:webpatente/resources/color_resources.dart';
import '../../Providers/quiz_provider.dart';
import '../../Widgets/chapterCard_widget.dart';
import '../../base/base_stateful_widget.dart';
import '../../resources/image_resources.dart';
import 'QuizScreen.dart';

class SelectChapterScreen extends StatefulWidget {
  const SelectChapterScreen({Key? key}) : super(key: key);

  @override
  State<SelectChapterScreen> createState() => _SelectChapterScreenState();
}

class _SelectChapterScreenState extends BaseStatefulWidgetState<SelectChapterScreen> {
  late QuizProvider quizProviderRef;

  @override
  void initState() {
    // TODO: implement initState
    quizProviderRef = Provider.of(context, listen: false);
    Future.delayed(const Duration(seconds: 0), () {
      quizProviderRef.callApiChapterList();
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
    return Consumer<QuizProvider>(builder: (_, quizProviderRef, __) {
      return quizProviderRef.quizLoader
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
              itemCount: quizProviderRef.chapterList.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                for (int i = 0; i < quizProviderRef.chapterList.length; i++) {
                  quizProviderRef.selectChapter.add(false);
                }
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Column(
                    children: [
                      heightBox(10),
                      ChapterCard(
                        image: quizProviderRef.chapterList[index].image,
                        text: quizProviderRef.chapterList[index].chapter,
                        borderColor: quizProviderRef.selectChapter[index] == true ? colorPrimary : colorWhite,
                        onTap: () {
                          setState(() {
                            quizProviderRef.selectChapter[index] = quizProviderRef.selectChapter[index] == true ? false : true;
                            onSelect(quizProviderRef.selectChapter[index], quizProviderRef.chapterList[index].id);
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
      quizProviderRef.selectChapterId.add(chapterId);
      if (kDebugMode) {
        print("ID ${quizProviderRef.selectChapterId}");
      }
    } else {
      quizProviderRef.selectChapterId.remove(chapterId);
      if (kDebugMode) {
        print("ID ${quizProviderRef.selectChapterId}");
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
            builder: (context) => QuizScreen(
              where: "selected",
              selectChapterId: quizProviderRef.selectChapterId,
            ),
          ),
        ),
      ),
    );
  }
}
