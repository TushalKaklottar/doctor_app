import 'package:doctor_app/export_app.dart';

Widget customText(String text,Color color, double size, FontWeight weight) {
  return Text(
    text,
    style: GoogleFonts.poppins(
      letterSpacing: 0.2,
      color: color,
      fontWeight: weight,
      fontSize: size.sp,
    ),
  );
}