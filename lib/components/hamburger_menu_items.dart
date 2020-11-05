import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:leo/views/dummy.dart';
import 'package:leo/views/options.dart';

class HamMenuElements {
  String title;
  IconData icon;
  Widget pushTo;

  HamMenuElements({this.title, this.icon, this.pushTo});
}

List<HamMenuElements> list = [
  HamMenuElements(title: 'Options', icon: Icons.menu, pushTo: Options()),
  HamMenuElements(title: 'Others', icon: Icons.map, pushTo: DummyScreen()),
];