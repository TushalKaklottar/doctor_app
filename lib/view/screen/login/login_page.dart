import 'package:doctor_app/controller/login_controller/login_controller.dart';
import 'package:doctor_app/export_app.dart';

class LoginPage extends StatelessWidget {
    LoginPage({Key? key}) : super(key: key);

    final LoginController _loginController = Get.put(LoginController());

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
              padding: EdgeInsets.all(16.sp),
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
                    20,
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
                    ),
                    boxShadow: [
                          BoxShadow(
                              color: const Color.fromARGB(255, 89, 89, 89),
                              spreadRadius: 3.sp,
                              blurRadius: 2.sp,
                              blurStyle: BlurStyle.outer,
                              offset: const Offset(0,0)
                          ),
                    ]
                  ),
                  child: Column(
                    children: [
                      TextFormField(
                        controller: _loginController.textEditingController,
                        onChanged: _loginController.onMobileChanged,
                        keyboardType: TextInputType.phone,
                        style: const TextStyle(color: textColor),
                        decoration: InputDecoration(
                          label: Text('Mobile No.'),
                          hintText: 'Enter Mobile No.',
                          focusColor: textColor,
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.grey),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ],
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


