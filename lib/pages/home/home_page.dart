import 'package:flutter/material.dart';
import 'package:food_delivery/constants/color_constants.dart';
import 'package:food_delivery/pages/home/main_food_page.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex=0;
  List pages= [
    MainFoodPage(),
    Container(child: Center(child: Text('Next page')),),
    Container(child: Center(child: Text('Next page page')),),
    Container(child: Center(child: Text('Next page page page')),),
  ];
  void onTapNav(int index){
    setState((){
      _selectedIndex=index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: ConstantColor.mainColor,
        unselectedItemColor: Colors.amberAccent,
        // showSelectedLabels: false,
        // showUnselectedLabels: false,
        onTap: onTapNav,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined,),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined,),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined,),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined,),
            label: 'Home',
          ),
        ],
      ),
    );
  }
}
