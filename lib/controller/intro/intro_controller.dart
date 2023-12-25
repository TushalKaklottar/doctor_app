import 'dart:async';

import 'package:doctor_app/export_app.dart';

class IntroController extends GetxController {

  late PageController pageController;
  RxInt pageIndex = 0.obs;
  late Timer timer;


  @override
  void onInit() {
    super.onInit();
    pageController = PageController(initialPage: 0);
    timer = Timer.periodic(Duration(seconds: 5), _updatedPage);
  }

  _updatedPage(Timer timer) {
    if (pageIndex < 3) {
      pageIndex ++;
    } else {
      pageIndex = 0.obs;
    }
    pageController.animateToPage(
        pageIndex.value,
        duration: const Duration(milliseconds: 350),
        curve: Curves.easeInSine,
    );
  }

  @override
  void onClose() {
    pageController.dispose();
    timer.cancel();
    super.onClose();
  }

}



// d initState() {
//   super.initState();
//   // Initialize page controller
//   _pageController = PageController(initialPage: 0);
//   // Automatic scroll behaviour
//   _timer = Timer.periodic(const Duration(seconds: 5), (Timer timer) {
//     if (_pageIndex < 3) {
//       _pageIndex++;
//     } else {
//       _pageIndex = 0;
//     }
//
//     _pageController.animateToPage(
//       _pageIndex,
//       duration: const Duration(milliseconds: 350),
//       curve: Curves.easeIn,
//     );
//   });
// }
//
// @override
// void dispose() {
//   // Dispose everything
//   _pageController.dispose();
//   _timer!.cancel();
//   super.dispose();
// }