import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:weather_app_md/core/style/AppColors.dart';

class UiUtils {

  static void showErrorMessage({
    required String message,
    Duration duration = const Duration(seconds: 5),
  }) {
    BotToast.showCustomNotification(
        duration: duration,
        toastBuilder: (_) {
          return Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 3.0,
                    // has the effect of softening the shadow
                    spreadRadius: 2.0,
                    // has the effect of extending the shadow
                    offset: const Offset(
                      0.0, // horizontal, move right
                      4.0, // vertical, move down
                    ))
              ],
              color: AppColors.red,
              border: Border.all(color: Colors.transparent),
              borderRadius: const BorderRadius.all(
                Radius.circular(5),
              ),
            ),
            margin: const EdgeInsets.all(16),
            height: 56,
            child: Row(
              children: <Widget>[
                const SizedBox(
                  width: 16,
                ),
                const Icon(
                  Icons.error,
                  color: Colors.white,
                ),
                const SizedBox(
                  width: 16,
                ),
                Expanded(
                  child: Text(
                    message,
                    style: const TextStyle(fontSize: 12, color: Colors.white),
                  ),
                ),
                const SizedBox(
                  width: 16,
                ),
                _buildCloseButton(),
              ],
            ),
          );
        });
  }

  static void showSuccessMessage({
    required String message,
    Duration duration = const Duration(seconds: 5),
  }) {
    BotToast.showCustomNotification(
        duration: duration,
        toastBuilder: (_) {
          return Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 3.0,
                    // has the effect of softening the shadow
                    spreadRadius: 2.0,
                    // has the effect of extending the shadow
                    offset: const Offset(
                      0.0, // horizontal, move right
                      4.0, // vertical, move down
                    ))
              ],
              color: AppColors.green,
              border: Border.all(color: Colors.transparent),
              borderRadius: const BorderRadius.all(
                Radius.circular(5),
              ),
            ),
            margin: const EdgeInsets.all(16),
            height: 56,
            child: Row(
              children: <Widget>[
                const SizedBox(
                  width: 16,
                ),
                const Icon(
                  Icons.check_circle,
                  color: Colors.white,
                ),
                const SizedBox(
                  width: 16,
                ),
                Expanded(
                  child: Text(
                    message,
                    style: const TextStyle(fontSize: 12, color: Colors.white),
                  ),
                ),
                const SizedBox(
                  width: 16,
                ),
                _buildCloseButton(),
              ],
            ),
          );
        });
  }

  // ...

  static Widget _buildCloseButton() {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        hoverColor: Colors.transparent,
        onTap: () {
          BotToast.cleanAll();
        },
        child: Container(
          height: 56,
          width: 44,
          padding: const EdgeInsets.all(14),
          child: const Icon(Icons.clear),
        ),
      ),
    );
  }

}