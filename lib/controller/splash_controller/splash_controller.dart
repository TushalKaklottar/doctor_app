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

      if(isLogin) {
        if(user == "patient") {
          Get.offAll(HomePage(number: number));
        } else {
          Get.offAll(DoctorHome(number: number));
        }
      } else {
        Get.offAll(IntroScreen());
      }
    });
  }
}