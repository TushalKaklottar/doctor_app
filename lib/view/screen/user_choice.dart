import 'package:doctor_app/export_app.dart';

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
                SizedBox(height: 25.h,),
                OptionCard(
                    title: "I am",
                    content: "Seeking skilled, experienced\nmedical care options.",

                )
              ],
            ),
          )
      ),
    );
  }
}

class OptionCard extends StatelessWidget {
  const OptionCard({Key? key,
    required this.title,
    required this.content,
    this.onTap
  })
   :super(key: key);

  final String title;
  final String content;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.all(12.sp),
        padding: EdgeInsets.all(12.sp),
        height: 100.h,
        width: double.infinity,
      ),
    );
  }
}
