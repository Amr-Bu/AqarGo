import 'package:flutter/material.dart';
import 'package:manzel/core/constant/color.dart';

class AlertToDelete {
  static Future<void> show({
    required BuildContext context,
    required VoidCallback onConfirm,
    String title = "تأكيد الحذف",
    String content = "هل أنت متأكد أنك تريد حذف هذا العنصر؟",
    String cancelText = "رجوع",
    String confirmText = "تأكيد",
  }) {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(title, textAlign: TextAlign.center,style: TextStyle(color: blackColor),),
          content: Text(content, textAlign: TextAlign.start,style: TextStyle(color: mainColor2)),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          actionsAlignment: MainAxisAlignment.spaceEvenly,
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text(cancelText,style: TextStyle(color: mainColor2)),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // أغلق الـ Dialog
                onConfirm(); // نفّذ الإجراء
              },
              child: Text(confirmText,style: TextStyle(color:mainColor1 )),
            ),
          ],
        );
      },
    );
  }
}
