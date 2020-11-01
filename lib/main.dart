import 'package:flutter/material.dart';
import 'package:leo/views/firstView.dart';
import 'package:leo/views/main_layout.dart';


void main() => runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: '/firstview',
    routes: {
     // '/': (context) => Loading(),
      '/firstview': (context) => FirstView(),
    }
));