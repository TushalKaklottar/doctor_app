import 'dart:async';
import 'package:doctor_app/export_app.dart';

class IntroController extends GetxController {

  late PageController  pageController;
  RxInt pageIndex = 0.obs;
  late Timer timer;

@override
  void onInit() {
    super.onInit();
    pageController = PageController(initialPage: 0);

    timer = Timer.periodic(5.seconds, (timer) {
      if (pageIndex.value < 3) {
        pageIndex.value++;
      } else {
        pageIndex.value = 0;
      }

      pageController.animateToPage(
          pageIndex.value,
          duration: 350.milliseconds,
          curve: Curves.easeIn,
      );
    });
  }
  @override
  void onClose() {
    super.onClose();
    pageController.dispose();
    timer.cancel();
    super.dispose();
  }
}
