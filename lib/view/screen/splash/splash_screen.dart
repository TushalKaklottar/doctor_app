import 'package:doctor_app/export_app.dart';
import '';

class Splash extends StatelessWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: GetBuilder<SplashController>(
          init: SplashController(),
          builder: (controller) {
            return Column(
              children: [
                const Spacer(),
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 122.h,
                        width: 122.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.sp),
                          color: Colors.transparent,
                        ),
                        child: Container(
                          height: 89.h,
                          width: 89.w,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage("assets/icon/doctor.png"),
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 7.64.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          customText(
                            "Doctor",
                            primary,
                            26,
                            FontWeight.w700,
                          ),
                          customText(
                            "+",
                            red,
                            35,
                            FontWeight.w700,
                          ),
                        ],
                      ),
                      Text(
                        "Always there for YOU",
                        style: GoogleFonts.arima(
                          color: textColor,
                          letterSpacing: 1.2.sp,
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                        ),
                      )
                    ],
                  ),
                ),
                const Spacer(),
              ],
            );
          },
        ),
      ),
    );
  }
}
