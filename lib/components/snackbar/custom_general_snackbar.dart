import 'package:flutter/material.dart';

void customGeneralSnackbar(
    {required String message,
    Color color = Colors.red,
    required BuildContext context,
    Function()? onActionSnackBar,
    Duration? duration,
    String position = 'BOTTOM'}) {
  final snackBar = SnackBar(
    duration: duration ?? const Duration(seconds: 4),
    content: Text(message),
    behavior: SnackBarBehavior.floating,
    backgroundColor: color,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10.0),
    ),
    margin: position == 'TOP'
        ? EdgeInsets.only(
            left: 10,
            right: 10,
            bottom: MediaQuery.of(context).size.height - 250,
          )
        : null,
    action: SnackBarAction(
      label: 'X',
      textColor: Colors.white,
      onPressed: onActionSnackBar ??
          () {
            // Acción al tocar el botón de cierre
          },
    ),
  );
  ScaffoldMessenger.of(context).showSnackBar(
    snackBar,
  );
}
