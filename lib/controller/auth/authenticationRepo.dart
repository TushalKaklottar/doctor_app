import 'package:doctor_app/export_app.dart';

class AuthRepo extends GetxController {

  final _auth = FirebaseAuth.instance;
  late final Rx<User?> firebaseUser;


  @override
  void onReady() {
    super.onReady();
  }
}