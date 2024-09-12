import 'package:flutter/material.dart';
import 'package:route_ecommerce/core/resources/ColorManager.dart';
import 'package:route_ecommerce/core/resources/styles_manager.dart';

class DialogUtils {
  static void showLoadingDialog(BuildContext context, String msg) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: ColorManager.primary,
          alignment: Alignment.center,
          // contentPadding: EdgeInsets.all(15),
          content: Padding(
            padding: const EdgeInsets.all(15),
            child: Text(
              msg,
              style: getRegularStyle(
                fontSize: 16,
                color: ColorManager.white,
              ),
            ),
          ),
        );
      },
    );
  }

  static void hideLoading(BuildContext context) {
    Navigator.pop(context);
  }

  static void showMessage({
    required BuildContext context,
    String title = '',
    required String content,
    String? postActionNamed,
    Function()? posaction,
    String? negActionNamed,
    Function()? negaction,
  }) {
    List<Widget> actions = [];
    if (postActionNamed != null) {
      actions.add(
        ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
            posaction?.call();
          },
          child: Text(
            postActionNamed,
            style: getRegularStyle(color: ColorManager.primary,fontSize: 16),
          ),
        ),
      );
    }
    if (negActionNamed != null) {
      actions.add(
        ElevatedButton(
          style: const ButtonStyle(
            backgroundColor: WidgetStatePropertyAll(ColorManager.white),
          ),
          onPressed: () {
            Navigator.pop(context);
            negaction?.call();
          },
          child: Text(negActionNamed),
        ),
      );
    }
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: ColorManager.primary,
          alignment: Alignment.center,
          title: Text(
            title,
            style: getRegularStyle(color: ColorManager.white,fontSize: 16),
          ),
          content: Text(
            content,
            style: Theme.of(context)
                .textTheme
                .titleSmall
                ?.copyWith(color: ColorManager.white),
          ),
          actions: actions,
        );
      },
    );
  }
}
