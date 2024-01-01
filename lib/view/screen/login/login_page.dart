import 'package:doctor_app/export_app.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(
            color: textColor,
          ),
          elevation: 0,
          backgroundColor: Colors.transparent,
          centerTitle: true,
          title: customText(
              "Login",
              textColor,
              16,
              FontWeight.w500,
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
              padding: EdgeInsets.all(12.sp),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 10.h,
                ),
                Image.asset("assets/icon/login.png"),
                SizedBox(
                  height: 25.h,
                ),
                customText(
                    "User Login",
                    textColor,
                    24,
                    FontWeight.w500
                ),
                SizedBox(height: 25.h,),
                Container(
                  padding: EdgeInsets.symmetric(
                    vertical: 25.h,
                    horizontal: 15.w,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                        12.r,
                    )
                  ),
                )
              ],

            ),
          ),
        ),
      ),
    );
  }
}
