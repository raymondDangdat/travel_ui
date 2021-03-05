import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../colors/colors.dart';
import '../widgets/widgets.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  int _currentTab = 0;


  List<IconData> _icons = [
    FontAwesomeIcons.plane,
    FontAwesomeIcons.bed,
    FontAwesomeIcons.walking,
    FontAwesomeIcons.biking,
  ];

  Widget _buildIcons(int index){
    return GestureDetector(
      onTap: (){
        setState(() {
          _selectedIndex = index;
        });
      },
      child: Container(
        height: 60.0,
        width: 60.0,
        decoration: BoxDecoration(
          color: _selectedIndex == index ? accentColor : unselectedIndexColor,
          borderRadius: BorderRadius.circular(30.0),
        ),
        child: Icon(_icons[index], size: 25.0, color: _selectedIndex == index ? primaryColor : unselectedIconColor,),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: ListView(
        padding: EdgeInsets.symmetric(vertical: 30.0),
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 120.0),
            child: Text("What would you like to find?", style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),),
          ),
          SizedBox(height: 20.0,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: _icons.asMap().entries.map((MapEntry map) => _buildIcons(map.key)).toList(),
          ),


          SizedBox(height: 20.0,),
          DestinationWidget(),
          SizedBox(height: 20.0,),
          HotelWidget(),
        ],
      )
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentTab,
        onTap: (int value){
          setState(() {
            _currentTab = value;
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.search, size: 30.0,), title: SizedBox.shrink()),
          BottomNavigationBarItem(icon: Icon(Icons.local_pizza, size: 30.0,), title: SizedBox.shrink()),
          BottomNavigationBarItem(icon: CircleAvatar(radius: 15.0, backgroundColor: primaryColor,), title: SizedBox.shrink()),
        ],
      ),
    );
  }
}
