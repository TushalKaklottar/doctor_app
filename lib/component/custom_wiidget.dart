import 'package:doctor_app/export_app.dart';
import 'package:fluttertoast/fluttertoast.dart';

class CustomWidget{

  void hidProgress({required BuildContext context}) {
    return Navigator.pop(context);
  }
  Future showProgress(
  {
    required BuildContext context,
}) {
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return WillPopScope(
              child: SizedBox(
                width: 100,
                height: 100,
                child: CircleAvatar(
                  radius: 100.r,
                  backgroundColor: Colors.transparent,
                  child: CircleAvatar(
                    backgroundColor: white,
                    radius: 30.r,
                    child: const CircularProgressIndicator(
                      color: primary,
                    ),
                  ),
                ),
              ),
              onWillPop: () async => false,
          );
        }
    );
  }
}

String savedName = "";

dynamic showToast(String tittle) =>
    Fluttertoast.showToast(
        msg: tittle,
      toastLength: Toast.LENGTH_SHORT,
      timeInSecForIosWeb: 1,
      backgroundColor: primary,
      textColor: white,
      fontSize: 16.0,
    );