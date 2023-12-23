import 'package:doctor_app/export_app.dart';

class OnBoardingScreen  extends StatelessWidget {
  const OnBoardingScreen ({super.key});

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
            // Expanded(
                // child: PageView.builder(
                //
                //   },
                //     itemBuilder: (context,index) => OnBoardContent(
                //
                //     )
                // ),
            // )
          ],
        ),
      ),
    );
  }
}
class OnBoardContent extends StatelessWidget {
  const OnBoardContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(

    );
  }
}
