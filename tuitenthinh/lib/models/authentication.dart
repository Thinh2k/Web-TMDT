import 'dart:convert';

import 'http_exception.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class Authentication with ChangeNotifier {
  Future<void> signUp(String email, String password) async {
    const url =
        'https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=AIzaSyCLCBP-FfXJmEtrhGRYRIzBkSCt4M_7flw';

    try{
      final response = await http.post(Uri.parse(url),
          body: json.encode({
            'email': email,
            'password': password,
            'returnSecureToken': true,
          }));
      final responseData = json.decode(response.body);
      if(responseData['error'] != null)
      {
        throw HttpException(responseData['error']['message']);
      }
      // print(responseData);
    }catch (error){
      throw error;
    }
  }
  Future<void> logIn(String email, String password) async {
    const url =
        'https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=AIzaSyCLCBP-FfXJmEtrhGRYRIzBkSCt4M_7flw';

    try{
      final response = await http.post(Uri.parse(url),
          body: json.encode({
            'email': email,
            'password': password,
            'returnSecureToken': true,
          }));
      final responseData = json.decode(response.body);
      if(responseData['error'] != null)
        {
          throw HttpException(responseData['error']['message']);
        }
      // print(responseData);
    }catch(error)
    {
      throw error;
    }
  }
}
