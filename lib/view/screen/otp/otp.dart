import 'package:doctor_app/component/custom_wiidget.dart';
import 'package:doctor_app/controller/otp/otp_controller.dart';
import 'package:doctor_app/export_app.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

class OTP extends StatefulWidget {
  final String mobile;
  const OTP({super.key,required this.mobile});



  @override
  State<OTP> createState() => _OTPState();
}

class _OTPState extends State<OTP> {

  // final OtpController otpController = Get.put(OtpController());
  int resendOn = 0;
  var code = "";
  int? _resendToken;

  int start = 59;
  bool wait = false;
  void startTimer() {
    const one = Duration(seconds: 1);
    Timer _timer = Timer.periodic(one, (timer) {
      if (start == 0) {
        setState(() {
          timer.cancel();
          resendOn = 1;
          wait = false;
        });
      } else {
        setState(() {
          start--;
        });
      }
    });
  }

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
                "Verification",
                black,
                14,
                FontWeight.w500,
            ),
          ),
      body: SingleChildScrollView(
        child: Padding(
            padding: EdgeInsets.all(12.sp),
          child: Column(
            children: [
              Image.asset(
                "assets/icon/otp.png",
              height: 100.h,
              ),
              SizedBox(height: 28.h,),
              customText(
                  "OTP Verification",
                  black,
                  15,
                  FontWeight.w400,
              ),
              SizedBox(
                height: 4.h,
              ),
              customText(
                "Enter the 6-digit number that we send ",
                Colors.grey,
                15,
                FontWeight.w400,
              ),
              SizedBox(
                height: 4.h,
              ),
              customText(
                  "to ${widget.mobile}",
                  Colors.grey,
                  15,
                  FontWeight.w400,
              ),
              SizedBox(height: 42.h,),
              Container(
                padding: EdgeInsets.all(15.sp),
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(
                    12.r,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: const Color.fromARGB(255, 89, 89, 89),
                        blurRadius: 3.sp,
                        spreadRadius: 2.sp,
                        blurStyle: BlurStyle.outer
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    OtpTextField(
                      numberOfFields: 6,
                      textStyle: const TextStyle(color: black),
                      borderColor: const Color(0xFF512DA8),
                      showFieldAsBox: true,
                      onCodeChanged: (String otp) {

                      },
                      onSubmit: (String verificationCode) {
                        code = verificationCode;
                      },
                    ),
                    SizedBox(
                      height: 40.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Didn't get the code ?",
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                            color: black
                          ),
                        ),
                        InkWell(
                          onTap: resendOn == 1
                              ? () async {
                            setState(() {
                              start = 59;
                              resendOn = 0;
                            });
                            CustomWidget().showProgress(context: context);
                            await FirebaseAuth.instance.verifyPhoneNumber(
                              timeout: const Duration(seconds: 60),
                                verificationCompleted: (
                                    PhoneAuthCredential phoneAuthCredential)
                                async {
                                Navigator.pop(context);
                                print("inside verification");
                                },
                                verificationFailed: (FirebaseAuthException e) {
                                Navigator.pop(context);
                                },
                                codeSent: (String verificationId, int? resendToken) {
                                Navigator.pop(context);
                                showToast("Code Sent Successfully");
                                startTimer();
                                LoginPage.verify = verificationId;
                                _resendToken = resendToken;
                                // print(object)
                                },
                                forceResendingToken: _resendToken,
                                codeAutoRetrievalTimeout: (String verificationId) {
                                print(verificationId);
                                }
                            );
                          } : () {},
                          child: Text(
                            'Resend'
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    ),
    );
  }
}
