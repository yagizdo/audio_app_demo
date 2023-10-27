import 'package:audio_app_demo/utils/extensions/context_extension.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AlertHelper {
  AlertHelper._();

  static final shared = AlertHelper._();

  void showCupertinoChooseDialog(
      {required BuildContext context,
      required String title,
      required List<CupertinoActionSheetAction> actions}) {
    showCupertinoModalPopup(
        context: context,
        builder: (context) {
          return CupertinoActionSheet(
            title: Text(title),
            cancelButton: CupertinoActionSheetAction(
              isDestructiveAction: true,
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("Cancel"),
            ),
            actions: actions,
          );
        });
  }

  Future<void> showCupertinoAlertDialog(
      {required BuildContext context,
      required String title,
      String? message}) async {
    await showCupertinoDialog(
        context: context,
        builder: (context) {
          return CupertinoAlertDialog(
            title: Text(title),
            content: message != null ? Text(message) : null,
            actions: [
              CupertinoDialogAction(
                isDefaultAction: true,
                child: const Text("OK"),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          );
        });
  }

  void showCupertinoConfirmDialog(
      {required BuildContext context,
      required String title,
      required VoidCallback onConfirm,
      String? message}) {
    showCupertinoDialog(
        context: context,
        builder: (context) {
          return CupertinoAlertDialog(
            title: Text(title),
            content: message != null ? Text(message) : null,
            actions: [
              CupertinoDialogAction(
                child: const Text("Cancel"),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              CupertinoDialogAction(
                isDefaultAction: true,
                onPressed: () {
                  onConfirm();
                },
                child: const Text("OK"),
              ),
            ],
          );
        });
  }

  void showCustomizableCupertinoAlertDialog(
      {required BuildContext context,
      required String title,
      String? message,
      required List<Widget> actions}) {
    showCupertinoDialog(
        context: context,
        builder: (context) {
          return CupertinoAlertDialog(
            title: Text(title),
            content: message != null ? Text(message) : null,
            actions: actions,
          );
        });
  }

  void showSnackBar(String message, BuildContext context,
      [bool isPositive = true]) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            isPositive
                ? Icons.check_circle_outline_outlined
                : Icons.highlight_off,
            color: Colors.white,
            size: context.getHeight(0.02),
          ),
          SizedBox(
            width: context.getWidth(0.01),
          ),
          /* AutoSizeText(
            message,
            style: TextStyle(
                fontSize: context.getWidth(0.035), color: Colors.white),
            maxLines: 1,
          ),*/
        ],
      ),
      behavior: SnackBarBehavior.floating,
      margin: EdgeInsets.only(bottom: context.getHeight(0.065)),
      backgroundColor: Colors.blue,
      duration: const Duration(seconds: 1),
      elevation: 4,
    ));
  }
}
