import 'package:get/get.dart';

checkVaild(String val, int min, int max, String type) {
  if (type == 'email') {
    if (!GetUtils.isEmail(val)) {
      return ' not vaild Email ';
    }
  }
  if (type == 'username') {
    if (!GetUtils.isUsername(val)) {
      return ' not vaild username ';
    }
  }
  if (type == 'phone') {
    if (!GetUtils.isPhoneNumber(val)) {
      return ' not vaild phone ';
    }
  }
  if (type == 'password') {
    if (val.isEmpty) {
      return 'cant empty';
    }
    if (val.length < min) {
      return ' to short have to bger than $min';
    }
    if (val.length > max) {
      return ' too long have to shorter than $max';
    }
  }

}
