import 'package:flutter/cupertino.dart';

/// WidgetTestで使用するKey
final confirmDialogKey = UniqueKey();
final confirmCancelKey = UniqueKey();
final confirmOkKey = UniqueKey();

class ConfirmDialogView extends StatelessWidget {
  final String message;

  const ConfirmDialogView({
    super.key,
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    return CupertinoAlertDialog(
      key: confirmDialogKey,
      title: const Text("確認"),
      content: Text(message),
      actions: [
        CupertinoDialogAction(
          key: confirmCancelKey,
          isDestructiveAction: true, // true:ボタンを赤色にする
          onPressed: () => Navigator.pop(context, false),
          child: const Text('Cancel'),
        ),
        CupertinoDialogAction(
          key: confirmOkKey,
          child: const Text('OK'),
          onPressed: () => Navigator.pop(context, true),
        ),
      ],
    );
  }
}
