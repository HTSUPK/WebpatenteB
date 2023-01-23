import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:webpatente/Widgets/common_appbar.dart';
import 'package:webpatente/Widgets/common_button.dart';
import 'package:webpatente/resources/color_resources.dart';
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
    return ListView.builder(
        itemCount: 10,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Column(
              children: [
                heightBox(10),
                const ChapterCard(
                  image: "https://hexeros.com/dev/superapp/uploads/user/user.png",
                  text: "Lorem Ipsum is simply dummy text of the printing and type setting industry.",
                ),
              ],
            ),
          );
        });
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
