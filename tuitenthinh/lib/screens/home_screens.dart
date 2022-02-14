import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tuitenthinh/food_page/food_page_body.dart';
import 'package:tuitenthinh/navbar/navbar.dart';
import 'package:tuitenthinh/widgets/big_text.dart';
import 'package:tuitenthinh/widgets/small_text.dart';

class HomeScreen extends StatelessWidget {

  static const routeName = '/home';

  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white70,
      drawer: NavBar(
      ),
      appBar: AppBar(
        title: Text('Dashboard'),
        centerTitle: false,
        actions: <Widget>[
          IconButton(
            padding: EdgeInsets.only(right: 10),
              onPressed: () {},
            icon: Icon(Icons.shopping_cart),
            ),
                  ],
      ),
      body: Column(
        children: [
          Container(
            child: Container(
              margin: EdgeInsets.only(top: 25, bottom: 10),
              padding: EdgeInsets.only(left: 20, right: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children:  [
                      BigText(text: "Eat Clean Food", color: Colors.cyan),
                      Row(
                        children: [
                          SmallText(text: "Món ăn ưa chuộng!!!", color: Colors.deepOrangeAccent,),
                          Icon(Icons.arrow_drop_down_rounded,
                          color: Colors.blue,),
                        ],
                      ),
                    ],
                  ),
                  IconButton(
                      padding: EdgeInsets.only(right: 20),
                      onPressed: (){},
                      icon: Icon(Icons.search,
                      color: Colors.blue,)
                    ,),
                ],
              ),
            ),
          ),
          FoodPageBody(),
        ],
      ),
      );
    }
}

