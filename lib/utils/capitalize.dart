import 'package:get/get.dart';

extension StringExtension on String {
  String toFirstCharacterCapitalize() {
     return 
       "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
  }
}