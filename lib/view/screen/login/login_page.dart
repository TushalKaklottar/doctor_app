import 'package:doctor_app/component/custom_wiidget.dart';
import 'package:doctor_app/component/widget_component.dart';
import 'package:doctor_app/controller/login_controller/login_controller.dart';
import 'package:doctor_app/export_app.dart';

class LoginPage extends StatelessWidget {
    LoginPage({Key? key}) : super(key: key);

    final LoginController _loginController = Get.put(LoginController());
    static String verify = "";
    int? _reasonToken;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(
            color: black,
          ),
          elevation: 0,
          backgroundColor: Colors.transparent,
          centerTitle: true,
          title: customText(
              "Login",
              black,
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
                    black,
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
                        style: const TextStyle(color: black),
                        decoration: InputDecoration(
                          label:  Text('Mobile No.',style: GoogleFonts.poppins(),),
                          hintText: 'Enter Mobile No.',
                          helperStyle: GoogleFonts.poppins(),
                          focusColor: black,
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.grey),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: black,
                              width: 2.w,
                            ),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: red,
                              width: 2.w,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          )
                        ),
                      ),
                      SizedBox(height: 20.h,),
                      Padding(padding: EdgeInsets.all(10.sp),
                        child: customButton(
                        45,
                        double.infinity,
                        10,
                        primary,
                        white,
                        "Send OTP",
                        15,
                        FontWeight.w500,
                        0,
                        0,
                          () async {
                          CustomWidget().showProgress(context: context);
                          print(_loginController.mobile);
                          await FirebaseAuth.instance.verifyPhoneNumber(
                            timeout: const Duration(seconds: 60),
                              phoneNumber: _loginController.mobile,
                              verificationCompleted: (PhoneAuthCredential phoneAuthCredential) async {
                              print('inside verification');
                              },
                              verificationFailed: (FirebaseAuthException e) {
                              print(e);
                              if(e.code == 'invalid-phone-number') {
                                print("The provided phone number is not valid");
                              }
                               print("inside verification failed");
                              Navigator.pop(context);
                              },
                              codeSent: (String verificationId,int? resendToken) {
                              LoginPage.verify = verificationId;
                              _reasonToken = resendToken;
                              print('Login verification ====${LoginPage.verify}');
                              Navigator.pop(context);
                              show
                              Navigator.push(context, route)
                              },
                              codeAutoRetrievalTimeout: codeAutoRetrievalTimeout
                          );
                          }
                      )
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


