import 'package:doctor_app/export_app.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

class OTP extends StatefulWidget {
  final String mobile;
  const OTP({super.key,required this.mobile});

  @override
  State<OTP> createState() => _OTPState();
}

class _OTPState extends State<OTP> {


  int resendOn = 0;
  var code = "";
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

                          }
                        ),
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
