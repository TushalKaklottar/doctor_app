// import 'package:doctor_app/export_app.dart';
//
// class OtpController extends GetxController {
//   RxInt start = 59.obs;
//   RxBool wait = false.obs;
//
//   void startTimer() {
//     const ones = Duration(seconds: 1);
//     Timer _timer = Timer.periodic(ones, (timer) {
//       if(start.value == 0) {
//         timer.cancel();
//         resendOn();
//       } else {
//         start --;
//       }
//     });
//   }
//   void resendOn() {
//     wait.value = false;
//     start.value = 59;
//   }
// }