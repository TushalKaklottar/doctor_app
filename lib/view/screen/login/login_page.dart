import 'package:doctor_app/component/custom_wiidget.dart';
import 'package:doctor_app/component/widget_component.dart';
import 'package:doctor_app/controller/login_controller/login_controller.dart';
import 'package:doctor_app/export_app.dart';
import 'package:doctor_app/view/screen/otp/otp.dart';

class LoginPage extends StatefulWidget {
    LoginPage({Key? key}) : super(key: key);

    static String verify = "";

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  FirebaseAuth auth = FirebaseAuth.instance;
  final TextEditingController _controller = TextEditingController();


  @override
  void initState() {
    _controller.text = "+91";
    super.initState();
  }

  int? _reasonToken;
  String mobile = "";

    // final LoginController _loginController = Get.put(LoginController());


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
                        controller: _controller,
                        onChanged: (value) {
                          setState(() {
                            mobile = value;
                          });
                        },
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
                        child: GestureDetector(
                          onTap: () async {

                            CustomWidget().showProgress(context: context);
                            print(mobile);
                            await FirebaseAuth.instance.verifyPhoneNumber(
                              timeout: const Duration(seconds: 60),
                                phoneNumber: mobile,
                                verificationCompleted: (
                                    PhoneAuthCredential phoneAuthCredential
                                ) async {
                                print("inside verification");
                                },
                                verificationFailed: (FirebaseAuthException e) {
                                print(e);
                                if(e.code == 'invalid-phone-number') {
                                  print('');
                                }
                                },
                                codeSent: (String verification, int? resendToken) {
                                LoginPage.verify = verification;
                                _reasonToken = resendToken;
                                print('Login verification===${LoginPage.verify}');
                                Navigator.pop(context);
                                showToast("OTP Sent");
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => OTP(mobile: mobile),
                                    )
                                );
                                },
                                forceResendingToken: _reasonToken,
                                codeAutoRetrievalTimeout: (String verificationId) {
                                print(verificationId);
                                }
                            );
                          },
                          child: Container(
                            margin: EdgeInsets.only(bottom: 15.h),
                            height: 45.h,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: primary,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Center(
                              child: Text(
                                "Send OTP",
                                style: GoogleFonts.poppins(
                                    color: white,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16,
                                    letterSpacing: 0.6
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 11.h,
                      ),
                      Center(
                        child: customText(
                            "By clicking proceed, you agree to our",
                            primary,
                            13,
                            FontWeight.w500,
                        ),
                      ),
                      SizedBox(
                        height: 8.h,
                      ),
                      Center(
                        child: customText(
                          "Terms & Conditions",
                          primary,
                          13,
                          FontWeight.w500,
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

bool isMobileNumber(String phoneNumber) {
  String regXPattern = r'^(?:[+0][1-9])?[0-9]{10,12}$';
  var refExp = RegExp(regXPattern);

  if(phoneNumber.isEmpty) {
    return false;
  } else if(refExp.hasMatch(phoneNumber)) {
    return true;
  }
  return false;
}


