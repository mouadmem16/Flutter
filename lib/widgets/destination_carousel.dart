import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:second_app/models/destination_model.dart';
import 'package:second_app/screens/destination_screen.dart';

class DestinationCarousel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                "Top Destinations",
                style: TextStyle(
                    fontSize: 22.0,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.5),
              ),
              GestureDetector(
                onTap: () {
                  print("see all");
                },
                child: Text(
                  "See All",
                  style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontSize: 16.0,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 1.0),
                ),
              ),
            ],
          ),
        ),
        Container(
          height: 290.0,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: destinations.length,
              itemBuilder: (context, index) {
                Destination dest = destinations[index];
                return GestureDetector(
                  child: Container(
                    margin: EdgeInsets.all(10.0),
                    width: 210.0,
                    child: Stack(
                      alignment: Alignment.topCenter,
                      children: <Widget>[
                        Positioned(
                          child: Container(
                              height: 130,
                              width: 200.0,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(10.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      "${dest.activities.length} Activities",
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w600,
                                          letterSpacing: 1.2),
                                    ),
                                    Text(
                                      dest.description,
                                      style: TextStyle(color: Colors.grey),
                                    )
                                  ],
                                ),
                              )),
                          bottom: 15.0,
                        ),
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20.0),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black26,
                                    offset: Offset(0.0, 2.0),
                                    blurRadius: 6.0)
                              ]),
                          child: Stack(
                            children: <Widget>[
                              Hero(
                                child: ClipRRect(
                                  child: Image(
                                      height: 180.0,
                                      width: 190.0,
                                      image: AssetImage(dest.imageUrl),
                                      fit: BoxFit.fill),
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                                tag: dest.imageUrl,
                              ),
                              Positioned(
                                child: Column(
                                  children: <Widget>[
                                    Text(
                                      dest.city,
                                      style: TextStyle(
                                          color: Colors.white,
                                          letterSpacing: 1.2,
                                          fontSize: 26.0,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Row(
                                      children: <Widget>[
                                        Icon(
                                          FontAwesomeIcons.locationArrow,
                                          size: 10.0,
                                          color: Colors.white,
                                        ),
                                        SizedBox(width: 5.0,),
                                        Text(
                                          dest.country,
                                          style: TextStyle(
                                              color: Colors.white),
                                        ),
                                      ],
                                    )
                                  ],
                                  crossAxisAlignment: CrossAxisAlignment.start
                                ),
                                bottom: 10,
                                left: 10,
                              )
                            ]
                          ),
                        ),
                      ],
                    ),
                  ),
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => DestinationScreen(destination: dest)));
                  },
                );
              }),
        )
      ],
    );
  }
}
