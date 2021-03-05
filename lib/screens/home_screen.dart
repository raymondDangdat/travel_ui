import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:travel_ui/colors/colors.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;


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
      body: SafeArea(child: ListView(
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
        ],
      )),
    );
  }
}
