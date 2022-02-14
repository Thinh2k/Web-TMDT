import 'dart:io';

import 'package:flutter/material.dart';
import 'package:tuitenthinh/models/authentication.dart';
import 'package:tuitenthinh/screens/login_screens.dart';
import 'package:provider/provider.dart';

import 'home_screens.dart';

class SignUpScreen extends StatefulWidget {
  static const routeName = '/signup';

  const SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final GlobalKey<FormState> _formkey = GlobalKey();
  TextEditingController _passwordController = new TextEditingController();

  Map<String, String> _authData = {'email': '', 'password': ''};

  void _showErrorDialog(String msg)
  {
    showDialog
      (
        context: context, builder: (ctx) => AlertDialog(
          title: Center(
            child: Text('Lỗi đăng nhập'),
          ),
          content: Text(msg),
          actions: <Widget>[
            FlatButton(
              child: Text('Okay'),
              textColor: Colors.blue,
              onPressed: ()
              {
                Navigator.of(ctx).pop();
              },
            ),
        ],
      )
    );
  }

  Future<void> _submit() async {
    if (!_formkey.currentState!.validate()) {
      return;
    }
    _formkey.currentState!.save();

    try{
      await Provider.of<Authentication>(context, listen: false)
          .signUp(_authData['email']!, _authData['password']!);
      Navigator.of(context).pushReplacementNamed(HomeScreen.routeName);

    }catch(error)
    {
      var errorMessage = 'Tài khoản đã tồn tại!!! Vui lòng nhập tài khoản mới!!!';
      _showErrorDialog(errorMessage);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SignUp App'),
        actions: <Widget>[
          FlatButton(
            child: Row(
              children: <Widget>[Text('Login '), Icon(Icons.person)],
            ),
            textColor: Colors.white,
            onPressed: () {
              Navigator.of(context).pushReplacementNamed(LoginScreen.routeName);
            },
          )
        ],
      ),
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
              Colors.limeAccent,
              Colors.redAccent,
            ])),
          ),
          Center(
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Container(
                height: 600,
                width: 360,
                padding: EdgeInsets.all(20),
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
                          child: Text("Xin chào! Đăng ký để vào App",
                            style: TextStyle(fontSize: 14, color: Colors.redAccent),),
                        ),
                        TextFormField(
                          decoration: InputDecoration(labelText: 'Email'),
                          keyboardType: TextInputType.emailAddress,
                          validator: (value) {
                            if (value!.isEmpty || !value.contains('@')) {
                              return 'Vui lòng nhập đúng email!';
                            }
                            return null;
                          },
                          onSaved: (value) {
                            _authData['email'] = value!;
                          },
                        ),
                        TextFormField(
                          decoration: InputDecoration(labelText: 'Mật khẩu'),
                          obscureText: true,
                          validator: (value) {
                            if (value!.isEmpty || value.length <= 5) {
                              return 'Password phải trên 5 ký tự!';
                            }
                            return null;
                          },
                          onSaved: (value) {
                            _authData['password'] = value!;
                          },
                        ),
                        TextFormField(
                          decoration:
                              InputDecoration(labelText: 'Confirm Password'),
                          obscureText: true,
                          controller: _passwordController,
                          validator: (value) {
                            if (value!.isEmpty ||
                                value != _passwordController.text) {
                              return 'Password không giống nhau';
                            }
                            return null;
                          },
                          onSaved: (value) {},
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        RaisedButton(
                          child: Text('Đăng ký'),
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
          )
        ],
      ),
    );
  }
}
