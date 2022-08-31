import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NavController extends GetxController{
  var index = 0.obs;
  changeIndex(var i) => index.value = i;
}