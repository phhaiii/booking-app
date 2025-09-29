import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class WHelpers{
  static Color? getColor(String value){

    if (value == 'red') {
      return Colors.red;
    } else if (value == 'blue') {
      return Colors.blue;
    } else if (value == 'green') {
      return Colors.green;
    } else if (value == 'yellow') {
      return Colors.yellow;
    } else if (value == 'orange') {
      return Colors.orange;
    } else if (value == 'purple') {
      return Colors.purple;
    } else if (value == 'pink') {
      return Colors.pink;
    } else if (value == 'brown') {
      return Colors.brown;
    } else if (value == 'grey' || value == 'gray') {
      return Colors.grey;
    } else if (value == 'black') {
      return Colors.black;
    } else if (value == 'white') {
      return Colors.white;
    }
  }
  static void showSnackBar(String message){
    ScaffoldMessenger.of(Get.context!).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }
  static void showArlert(String title, String message){
    showDialog(
      context: Get.context!,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: ()=> Navigator.of(context).pop(),
                child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }
  static void navigateToScreen(BuildContext context, Widget screen){
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => screen),
    );
  }
  static String truncateText(String text, int maxlength) {
    if (text.length <= maxlength) {
      return text;
    } else {
      return '${text.substring(0, maxlength)}...';
    }
  }
  static bool isDarkMode(BuildContext context){
    return Theme.of(context).brightness == Brightness.dark;
  }
  static Size screenSize(){
    return MediaQuery.of(Get.context!).size;
  }
  static double screenWidth(){
    return MediaQuery.of(Get.context!).size.width;
  }
  static double screenHeight(){
    return MediaQuery.of(Get.context!).size.height;
  }
  static String getFormatterDate(DateTime date){
    final DateFormat formatter = DateFormat('yyyy-MM-dd');
    return formatter.format(date);
  }
}