import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rootally/SessionDataModel.dart';

class SessionController extends GetxController{
  late List names = [].obs;

  late List dates = [].obs;

  late List times = [].obs;

  percentage(){
    if(names.isEmpty) {
      return 0;
    } else {
      return ((2 / names.length) * 100).toInt();
    }
  }

  completed(){
    if(names.isEmpty) {
      return 0;
    } else {
      return 2;
    }
  }

  pending(){
    if(names.isEmpty) {
      return 0;
    } else {
      return names.length - 2;
    }
  }

  addSession(var name,var date,var time) {
    names.add(name);


    dates.add(date);
    times.add(time);
  }
}