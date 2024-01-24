import 'package:doctor_app/export_app.dart';


class LoginController extends GetxController {
  final TextEditingController textEditingController = TextEditingController();
  FirebaseAuth auth = FirebaseAuth.instance;

  String mobile = "";
  static String verify = "";
  int? _reasonToken;


  @override
  void onInit() {
    textEditingController.text = "+91";
    super.onInit();
  }
  void onMobileChanged(String value) {
    mobile =  value;
    update();
  }
}