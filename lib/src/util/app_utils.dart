import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AppUtils {
  static void showSuccessSnackBar(String message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.green,
      textColor: Colors.white,
      fontSize: 16,
    );
  }

  static void showErrorSnackBar(String message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      fontSize: 16,
    );
  }

  List<Widget> getRatingStars(
      {required double? rating,
      required double starSize,
      Color iconColor = Colors.amber}) {
    List<Icon> temp = [];
    if (rating != null) {
      for (var i = 0; i < rating ~/ 2; i++) {
        //(rating/2).toInt() == rating ~/ 2
        temp.add(Icon(
          Icons.star,
          size: starSize,
          color: iconColor,
        ));
      }
      if (rating > 0 && rating % 2 != 0) {
        temp.add(Icon(
          Icons.star_half,
          size: starSize,
          color: iconColor,
        ));
      }
      while (temp.length < 5) {
        temp.add(Icon(
          Icons.star_border,
          size: starSize,
          color: iconColor,
        ));
      }
    }
    return temp;
  }

  bool isLoaderVisible = false;
  void showLoader(BuildContext context) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return WillPopScope(
          onWillPop: () async {
            return isLoaderVisible;
          },
          child: Scaffold(
            backgroundColor: Colors.black26,
            body: Center(
              child: Container(
                height: 100,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Theme(
                      data: Theme.of(context).copyWith(
                        colorScheme: ColorScheme.fromSwatch()
                            .copyWith(secondary: Colors.red),
                      ),
                      child: Container(
                        padding: const EdgeInsets.only(top: 10),
                        child: const CircularProgressIndicator(
                          color: Colors.red,
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(10),
                      child: const Text(
                        'Loading..',
                        style: TextStyle(fontSize: 15, color: Colors.red),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  void hideLoader(BuildContext context, bool hide) {
    
      isLoaderVisible = hide;
      Navigator.of(context).pop();
    
  }
}
