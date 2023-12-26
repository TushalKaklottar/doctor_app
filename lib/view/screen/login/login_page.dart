import 'package:doctor_app/export_app.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});



  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(
            color: textColor,
          ),
          elevation: 0,
          backgroundColor: Colors.transparent,
          centerTitle: true,
          title: customText(
              "Login",
              textColor,
              16,
              FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
