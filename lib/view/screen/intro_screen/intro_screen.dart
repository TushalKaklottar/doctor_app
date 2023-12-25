
import 'package:doctor_app/controller/intro/intro_controller.dart';
import 'package:doctor_app/export_app.dart';
import 'package:doctor_app/model/intro_model.dart';

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
              colors: <Color>[
                Color.fromARGB(255, 30, 99, 246),
                Color.fromARGB(230, 41, 101, 231),
                Color.fromARGB(255, 66, 129, 223),
                Color.fromARGB(199, 60, 125, 215),
                Color.fromARGB(197, 55, 112, 202),
                Color.fromARGB(232, 95, 145, 216),
                Color.fromARGB(255, 102, 158, 223),
                Color.fromARGB(240, 128, 171, 232),
              ],
            tileMode: TileMode.mirror,
          ),
        ),
        child: Column(
          children: [
            Expanded(
                child: PageView.builder(
                  onPageChanged: (index) {
                    print("Page :$index");
                    _introController.pageIndex.value  = index;
                  },
                    itemCount: demoData.length,
                  controller: _introController.pageController,
                    itemBuilder: (context,index) => OnBoardContent(
                      images: demoData[index].tittle,
                      tittle: demoData[index].description,
                      description: demoData[index].images,
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
              )
            )
          ],
        ),
      ),
    );
  }
}

class OnBoardContent extends StatelessWidget {
   OnBoardContent({
    Key? key,
    required this.images,
    required this.tittle,
    required this.description
  }) : super(key: key);

  String images;
  String tittle;
  String description;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Spacer(),
        Text(
          tittle,
          style: GoogleFonts.arima(
            color: white,
            fontSize: 17,
            fontWeight: FontWeight.bold,
            letterSpacing: 1,
            height: 1.5,

          ),
        )
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


