import 'package:fluttertoast/fluttertoast.dart';

mixin MixinFunctions {
  void showToastMessages(String message) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        webPosition: "center",
        webBgColor: "linear-gradient(to right, #7E191B, #FC8900)",
        webShowClose: true,
        timeInSecForIosWeb: 2,
        fontSize: 22.0
    );
  }


}