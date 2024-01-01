import '../../../../export_app.dart';

class OptionCard extends StatelessWidget {
  final String title;
  final String content;
  final String image;
  final Function()? onTap;

  const OptionCard({Key? key,
    required this.title,
    required this.content,
    required this.image,
    this.onTap
  })  :super (key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.all(12.sp),
        padding: EdgeInsets.all(12.sp),
        height: 120.h,
        width: double.infinity,
        decoration: BoxDecoration(
          color: blue2,
          boxShadow: const [
            BoxShadow(
                color: white,
                spreadRadius: 3,
                blurRadius: 2,
                blurStyle: BlurStyle.outer,
                offset: Offset(0,0)
            )
          ],
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Row(
          children: [
            Container(
              height: double.maxFinite,
              width: 100.h,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(image),
                  fit: BoxFit.contain,
                ),
              ),
            ),
            SizedBox(width: 20.w),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 5.h,),
                customText(
                    title,
                    white,
                    16,
                    FontWeight.w600
                ),
                SizedBox(height: 4.h,),
                customText(
                    content,
                    white,
                    12,
                    FontWeight.w400
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}