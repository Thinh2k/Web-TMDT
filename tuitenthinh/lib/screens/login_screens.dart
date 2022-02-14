import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tuitenthinh/screens/signup_screen.dart';
import 'package:provider/provider.dart';
import 'package:tuitenthinh/models/http_exception.dart';
import '../models/authentication.dart';
import 'home_screens.dart';

class LoginScreen extends StatefulWidget {
  static const routeName = '/login';

  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formkey = GlobalKey();

  Map<String, String> _authData = {
    'email': '',
    'password': ''
  };

  void _showErrorDialog(String msg) {
    showDialog
      (
        context: context, builder: (ctx) =>
        AlertDialog(
          title: Center(
            child: Text('Lỗi đăng nhập'),
          ),
          content: Text(msg),
          actions: <Widget>[
            FlatButton(
              child: Text('Okay'),
              textColor: Colors.blue,
              onPressed: () {
                Navigator.of(ctx).pop();
              },
            )
          ],
        )
    );
  }

  Future<void> _submit() async {
    if (!_formkey.currentState!.validate()) {
      return;
    }
    _formkey.currentState!.save();

    try {
      await Provider.of<Authentication>(context, listen: false).logIn(
          _authData['email']!,
          _authData['password']!
      );
      Navigator.of(context).pushReplacementNamed(HomeScreen.routeName);
    } catch (error) {
      var errorMessage = 'Sai tài khoản hoặc mật khẩu!!! Vui lòng nhập lại!!!';
      _showErrorDialog(errorMessage);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Login App'),
          actions: <Widget>[
            FlatButton(
              child: Row(
                children: <Widget>[Text('Sign  '), Icon(Icons.person_add)],
              ),
              textColor: Colors.white,
              onPressed: () {
                Navigator.of(context)
                    .pushReplacementNamed(SignUpScreen.routeName);
              },
            )
          ],
        ),
        body: Stack(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                    Colors.lightGreenAccent,
                    Colors.blue,
                  ])),
            ),
            Center(
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)
                ),
                child: Container(
                  height: 600,
                  width: 360,
                  padding: EdgeInsets.all(16),
                  child: Form(
                    key: _formkey,
                    child: SingleChildScrollView(
                      child: Column(
                        children: <Widget>[
                          SizedBox(
                            height: 10,
                          ),
                          Image.asset('eat_food.jpg'),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                            child: Text("Xin chào! Đăng nhập để vào App",
                            style: TextStyle(fontSize: 14, color: Colors.redAccent),),
                          ),
                          TextFormField(
                            decoration: InputDecoration(labelText: 'Email'),
                            keyboardType: TextInputType.emailAddress,
                            validator: (value) {
                              if (value!.isEmpty || !value.contains('@')) {
                                return 'Nhập tài khoản để đăng nhập';
                              }
                              return null;
                            },
                            onSaved: (value) {
                              _authData['email'] = value!;
                            },
                          ),
                          TextFormField(
                            decoration: InputDecoration(
                                labelText: 'Mật khẩu'),
                            obscureText: true,
                            validator: (value) {
                              if (value!.isEmpty || value.length <= 5) {
                                return 'Nhập mật khẩu để đăng nhập';
                              }
                              return null;
                            },
                            onSaved: (value) {
                              _authData['password'] = value!;
                            },
                          ),
                          SizedBox(
                            height: 40,
                          ),
                          Padding(
                              padding: EdgeInsets.fromLTRB(20, 0, 20, 30),
                            child: Text('Sign Up  Account!!!',
                            style: TextStyle(fontSize: 12, color: Colors.blue),
                            ),

                          ),
                          RaisedButton(
                            child: Text('Đăng nhập'),
                            onPressed: () {
                              _submit();
                            },
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            color: Colors.blue,
                            textColor: Colors.white,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
    );
  }
}
