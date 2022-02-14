import 'package:flutter/material.dart';
import 'package:tuitenthinh/navbar/settinghome.dart';
import 'package:tuitenthinh/screens/home_screens.dart';
import 'package:tuitenthinh/screens/login_screens.dart';

class NavBar extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
              accountName: Text('Thinh'),
              accountEmail: Text('Thinh@gmail.com'),
              currentAccountPicture: CircleAvatar(
                child: ClipOval(
                  child: Image.network('https://oflutter.com/wp-content/uploads/2021/02/girl-profile.png',
                  width: 80,
                  height: 80,
                  fit: BoxFit.cover,
                  ),
                ),
              ),
            decoration: BoxDecoration(
              color: Colors.blue,
              image: DecorationImage(
                image: NetworkImage('https://oflutter.com/wp-content/uploads/2021/02/profile-bg3.jpg',
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.home),
            iconColor: Colors.pinkAccent,
            title: Text('Trang chủ',),
            textColor: Colors.pinkAccent,
            onTap: () {
              Navigator.of(context).pushReplacementNamed(HomeScreen.routeName);
            }
          ),
          ListTile(
            leading: Icon(Icons.shopping_cart),
            iconColor: Colors.blueAccent,
            title: Text('Giỏ hàng',),
            textColor: Colors.blueAccent,
            onTap: () => print('cart'),
          ),
          ListTile(
            leading: Icon(Icons.favorite),
            iconColor: Colors.red,
            title: Text('Yêu thích',),
            textColor: Colors.red,
            onTap: () => print('Fav'),
          ),
          ListTile(
            leading: Icon(Icons.settings),
            iconColor: Colors.black,
            title: Text('Cài đặt'),
            textColor: Colors.black,
            onTap: () {
              Navigator.of(context).pushReplacementNamed(SettingHome.routeName);
              }
          ),
          ListTile(
            leading: Icon(Icons.logout),
            iconColor: Colors.green,
            title: Text('Đăng xuất'),
            textColor: Colors.green,
            onTap: () {
              Navigator.of(context).pushReplacementNamed(LoginScreen.routeName);
              }
          ),
        ],
      ),
    );
  }
}