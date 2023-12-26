import 'package:doctor_app/export_app.dart';
import '../login/login_page.dart';
import 'component/option_card.dart';

class UserPage extends StatelessWidget {
  const UserPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
            height: double.infinity,
            width: double.infinity,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: ColorConstants.customColors,
                tileMode: TileMode.mirror,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children:  [
                  const Spacer(),
                  Column(
                    children: [
                      SizedBox(
                        height: 150.h,
                        width: 140.h,
                        child: Image.asset("assets/icon/online.png"),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          customText(
                              "Doctor",
                              white,
                              30,
                              FontWeight.w700,
                          ),
                          const SizedBox(width: 3,),
                          customText(
                              "+",
                              red,
                              35,
                              FontWeight.w800,
                          ),
                        ],
                      ),
                    ],
                  ),
                  const Spacer(),
                  Padding(
                      padding: EdgeInsets.symmetric(horizontal: 12.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        customText(
                            "Please register yourself",
                            white,
                            15,
                            FontWeight.w600
                        ),
                        SizedBox(height: 4.h,),
                        customText(
                            "Select the appropriate choice below",
                            white,
                            12,
                            FontWeight.w400,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 25.h),
                  OptionCard(
                      title: "I am a Patient",
                      content: "Seeking skilled,\nexperienced medical\ncare options.",
                      image: "assets/icon/examination1.png",
                    onTap: () {
                        setUserMode("patient");
                        Get.to(() => LoginPage());
                    },
                  ),
                  OptionCard(
                      title: "I am a doctor",
                      content: "Able to treat the\npatients anywhere.",
                      image: "assets/icon/doctor.png",
                    onTap: () {
                        setUserMode("doctor");
                        Get.to(() => LoginPage());
                    },
                  ),
                ],
              ),
            ),
          )
      ),
    );
  }
}
Future<void> setUserMode(String user) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setString("user", user);
}
