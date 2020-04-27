import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:second_app/widgets/destination_carousel.dart';
import 'package:second_app/widgets/hotel_carousel.dart';

class HomeScreen extends StatefulWidget {
  State<StatefulWidget> createState() => _HomeScreen();
}

class _HomeScreen extends State<HomeScreen> {
  int _currentTab = 0;
  int _selectedIndex = 0;
  List<IconData> _icons = [
    FontAwesomeIcons.plane,
    FontAwesomeIcons.bed,
    FontAwesomeIcons.walking,
    FontAwesomeIcons.biking
  ];

  Widget _buildIcon(int index) {
    return GestureDetector(
      onTap: () => setState(() => _selectedIndex = index),
      child: Container(
        height: 60.0,
        width: 60.0,
        decoration: BoxDecoration(
            color: _selectedIndex == index
                ? Theme.of(context).accentColor
                : Color(0xFFE7EBEE),
            borderRadius: BorderRadius.circular(30.0)),
        child: Icon(
          _icons[index],
          size: 25.0,
          color: _selectedIndex == index
              ? Theme.of(context).primaryColor
              : Color(0xFFB4C1C4),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(vertical: 30.0),
          children: <Widget>[
            Padding(
              child: Text("What would you like to find?",
                  style:
                      TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold)),
              padding: EdgeInsets.only(left: 20.0, right: 80.0),
            ),
            SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: _icons
                  .asMap()
                  .entries
                  .map((MapEntry icon) => _buildIcon(icon.key))
                  .toList(),
            ),
            SizedBox(
              height: 20.0,
            ),
            DestinationCarousel(),
            HotelCarousel(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (int index) {
          setState(() {
            this._currentTab = index;
          });
        },
        currentIndex: this._currentTab,
        items: [
          BottomNavigationBarItem(icon: Icon(FontAwesomeIcons.search, size: 30),title: SizedBox.shrink()),
          BottomNavigationBarItem(icon: Icon(FontAwesomeIcons.home, size: 30),title: SizedBox.shrink()),
          BottomNavigationBarItem(icon: CircleAvatar(backgroundImage: AssetImage("assets/images/profil.png"),radius: 20,),
              title: SizedBox.shrink()),
        ],
      ),
    );
  }
}
