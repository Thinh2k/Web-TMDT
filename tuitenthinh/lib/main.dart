import 'package:flutter/material.dart';
import 'package:tuitenthinh/screens/home_screens.dart';
import 'package:tuitenthinh/screens/login_screens.dart';
import 'package:tuitenthinh/screens/signup_screen.dart';
import 'package:provider/provider.dart';
import 'models/authentication.dart';
import 'package:flutter/cupertino.dart';
import 'package:tuitenthinh/navbar/settinghome.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
           value: Authentication()),
      ],
      child: MaterialApp(
        title: 'Login App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Colors.blue,
        ),
        home: LoginScreen(),
        routes: {
          SignUpScreen.routeName: (ctx) => SignUpScreen(),
          LoginScreen.routeName: (ctx) => LoginScreen(),
          HomeScreen.routeName: (ctx) => HomeScreen(),
          SettingHome.routeName: (ctx) => SettingHome(),
        },
      ),
    );
  }
}

