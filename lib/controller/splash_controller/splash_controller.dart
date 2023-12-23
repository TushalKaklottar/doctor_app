import 'package:doctor_app/export_app.dart';

class SplashController extends GetxController {

  @override
  void onInit() {
    super.onInit();
    _navigatedToLogin();
  }

  _navigatedToLogin() async {
    Future.delayed(const Duration(seconds: 3),() async {

      SharedPreferences pref = await SharedPreferences.getInstance();

      String number = pref.getString("phone") ?? "+911111111111";
      bool isLogin = pref.getBool("isLogin") ?? false;
      String user = pref.getString("user") ?? "patient";
      String savedName = pref.getString("name") ?? "";
      //
      // isLogin
      //     ? user == "patient"
      //     ? Get.off(HomePage(number: number,))
      //     : Get.off(DoctorHome(number: number))
      //     : Get.off(const OnBoardingScreen());


      if(isLogin) {
        if(user == "patient") {
          Get.to(HomePage(number: number));
        } else {
          Get.to(DoctorHome(number: number));
        }
      } else {
        Get.to(const OnBoardingScreen());
      }
    });
  }
}