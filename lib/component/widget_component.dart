import 'package:doctor_app/export_app.dart';

Widget customButton(
  double height,
  double width,
  double radius,
  Color color,
  Color textColor,
  String text,
  double fontSize,
  FontWeight fontWeight,
  int shadow,
  int border,
  Function()? onTap,
) {
  return InkWell(
    onTap: onTap,
    child: Container(
      alignment: Alignment.center,
      height: height.h,
      width: width.w,
      decoration: BoxDecoration(
        border: border == 1
            ? Border.all(color: Colors.grey)
            : const Border(),
        boxShadow: [
          shadow == 1
          ? const BoxShadow(
            blurRadius: 1,
            offset: Offset(-1, 2),
          ) : const BoxShadow(blurRadius: 0),
        ],
        color: color,
        borderRadius: BorderRadius.circular(
          radius.sp,
        ),
      ),
      child: customText(
          text,
          color,
          fontSize,
          fontWeight,
      ),
    ),
  );
}