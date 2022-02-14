import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:tuitenthinh/navbar/navbar.dart';

class SettingHome extends StatelessWidget {
  static const routeName = '/setting';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: NavBar(
        ),
        appBar: AppBar(
        title: Center(
          child: Text('Cài đặt'),
        ),
      ),
    );

  }
}
