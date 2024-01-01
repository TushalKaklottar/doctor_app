import 'package:doctor_app/export_app.dart';

class IntroScreen  extends StatelessWidget {
    IntroScreen ({super.key});

  final IntroController _introController = Get.put(IntroController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
       padding: EdgeInsets.symmetric(horizontal: 16.h),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: ColorConstants.customColors,
            tileMode: TileMode.mirror,
          ),
        ),
        child: Column(
          children: [
            Expanded(
                child: PageView.builder(
                  onPageChanged: (index) {
                    _introController.pageIndex.value  = index;
                  },
                    itemCount: demoData.length,
                  controller: _introController.pageController,
                    itemBuilder: (context,index) => OnBoardContent(
                      title: demoData[index].title,
                      description: demoData[index].description,
                      image: demoData[index].image,
                    ),
                ),
            ),
            Padding(
                padding: EdgeInsets.only(bottom: 16.h),
              child: Obx(
                  () => Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ...List.generate(
                          demoData.length,
                              (index) => Padding(
                                  padding: EdgeInsets.only(right: 4.sp),
                                child: DotIndicator(
                                  isActive: index == _introController.pageIndex.value,
                                ),
                              ),
                      ),
                    ],
                  ),
              ),
            ),
            Text(
                "By proceeding you agree to our Privacy Policy.",
               textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                color: white,
                fontSize: 14,
                fontWeight: FontWeight.w500,
                letterSpacing: 1,
                height: 1.5,
              ),
            ),
            SizedBox(height: 16.h,),
            GestureDetector(
              onTap: () {
                Get.to(() => const UserPage());
              },
              child: Container(
                margin: EdgeInsets.only(bottom: 15.h),
                height: 45.h,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: white,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Center(
                  child: Text(
                    "Login",
                    style: GoogleFonts.poppins(
                      color: blue1,
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      letterSpacing: 0.6
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class OnBoardContent extends StatelessWidget {
   OnBoardContent({
    super.key,
    required this.image,
    required this.title,
    required this.description
  });

  String image;
  String title;
  String description;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Spacer(),
        Text(
          title,
          style: GoogleFonts.poppins(
            color: white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
            letterSpacing: 1,
            height: 1.5,
          ),
        ),
        SizedBox(height: 16.h),
        Text(
          description,
          textAlign: TextAlign.start,
          style: GoogleFonts.poppins(
            color: white,
            fontSize: 16,
            fontWeight: FontWeight.w500,
            letterSpacing: 1,
            height: 1.5,
          ),
        ),
        const Spacer(),
        Image.asset(image,height: 250),
        const Spacer(),
      ],
    );
  }
}

class DotIndicator extends StatelessWidget {
  const DotIndicator({Key? key,  this.isActive = false}) :super(key: key);

  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
        duration: const Duration(milliseconds: 300),
      height: 8.h,
      width: isActive ? 24.w : 8.w,
      decoration: BoxDecoration(
        color: isActive ? primary : white,
        border: isActive ? null : Border.all(color: primary),
        borderRadius: BorderRadius.all(
          Radius.circular(12.r),
        )
      ),
    );
  }
}
