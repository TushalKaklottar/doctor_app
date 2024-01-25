import 'package:doctor_app/export_app.dart';

class OTP extends StatelessWidget {
  final String mobile;
  const OTP({Key? key,required this.mobile}) :super(key: key);

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
                  "to ${widget}",
                  color,
                  size,
                  weight
              )
            ],
          ),

        ),
      ),
    ),
    );
  }
}
