import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:second_app/models/activity_model.dart';
import 'package:second_app/models/destination_model.dart';

class DestinationScreen extends StatefulWidget {
  final Destination destination;

  DestinationScreen({this.destination});

  @override
  _DestinationScreenState createState() => _DestinationScreenState();
}

class _DestinationScreenState extends State<DestinationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30.0),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black26,
                          offset: Offset(0.0, 2.0),
                          blurRadius: 6.0)
                    ]),
                child: Hero(
                  child: ClipRRect(
                    child: Image(
                        image: AssetImage(widget.destination.imageUrl),
                        fit: BoxFit.cover),
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(40.0),
                        bottomRight: Radius.circular(40.0)),
                  ),
                  tag: widget.destination.imageUrl,
                ),
              ),
              Positioned(
                child: Row(
                  children: <Widget>[
                    IconButton(
                      icon: Icon(FontAwesomeIcons.arrowLeft),
                      iconSize: 25.0,
                      color: Colors.black54,
                      onPressed: () => Navigator.pop(context),
                    ),
                    Container(
                      child: Row(
                        children: <Widget>[
                          Icon(
                            FontAwesomeIcons.search,
                            size: 25.0,
                            color: Colors.black54,
                          ),
                          Icon(
                            FontAwesomeIcons.sortAmountDown,
                            size: 25.0,
                            color: Colors.black54,
                          ),
                        ],
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      ),
                      width: 70,
                    )
                  ],
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                ),
                width: MediaQuery.of(context).size.width - 30,
                top: 40,
                left: 15,
              ),
              Positioned(
                child: Row(
                  children: <Widget>[
                    Column(children: <Widget>[
                      Text(
                        widget.destination.city,
                        style: TextStyle(
                            color: Colors.white,
                            letterSpacing: 1.2,
                            fontSize: 35.0,
                            fontWeight: FontWeight.bold),
                      ),
                      Row(
                        children: <Widget>[
                          SizedBox(
                            width: 6,
                          ),
                          Icon(
                            FontAwesomeIcons.locationArrow,
                            size: 14.0,
                            color: Colors.white70,
                          ),
                          SizedBox(
                            width: 5.0,
                          ),
                          Text(
                            widget.destination.country,
                            style: TextStyle(
                                color: Colors.white70,
                                fontWeight: FontWeight.w400,
                                fontSize: 20),
                          ),
                        ],
                      )
                    ], crossAxisAlignment: CrossAxisAlignment.start),
                    Icon(
                      FontAwesomeIcons.mapMarkerAlt,
                      size: 25.0,
                      color: Colors.white,
                    )
                  ],
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                ),
                width: MediaQuery.of(context).size.width - 60,
                bottom: 30.0,
                left: 30.0,
              )
            ],
          ),
          Expanded(
            child: ListActivities(),
          ),
        ],
      ),
    );
  }

  Widget ListActivities() {
    return ListView.builder(
        padding: EdgeInsets.only(top: 10.0),
        itemCount: widget.destination.activities.length,
        itemBuilder: (context, index) {
          Activity activity = widget.destination.activities[index];
          return Stack(
            children: <Widget>[
              Container(
                width: double.infinity,
                margin: EdgeInsets.fromLTRB(40, 5, 20, 5),
                height: 170,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20)),
                child: Padding(
                  padding: EdgeInsets.fromLTRB(90, 20, 20, 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            child: Text(
                              '${activity.name}',
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: 18.0,
                              ),
                            ),
                            width: 120.0,
                          ),
                          Column(
                            children: <Widget>[
                              Text(
                                '${activity.price} \$',
                                style: TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                'per pax',
                                style: TextStyle(
                                    fontSize: 13.0, color: Colors.grey),
                              )
                            ],
                          )
                        ],
                      ),
                      Container(
                        child: Text('${activity.type}',
                            style: TextStyle(color: Colors.grey)),
                        alignment: Alignment.centerLeft,
                      ),
                    _builtRating(activity.rating),
                      SizedBox(
                        height: 10.0,
                      ),
                      Row(
                        children: <Widget>[
                          Container(
                            width: 70,
                            height: 25,
                            decoration: BoxDecoration(
                                color: Theme.of(context).accentColor,
                                borderRadius: BorderRadius.circular(10.0)),
                            child: Text(activity.startTimes[0]),
                            alignment: Alignment.center,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Container(
                            width: 70,
                            height: 25,
                            decoration: BoxDecoration(
                                color: Theme.of(context).accentColor,
                                borderRadius: BorderRadius.circular(10.0)),
                            child: Text(activity.startTimes[1]),
                            alignment: Alignment.center,
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
              Positioned(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20.0),
                  child: Image(
                    image: AssetImage(activity.imageUrl),
                    width: 110,
                    fit: BoxFit.cover,
                  ),
                ),
                left: 10.0,
                top: 15.0,
                bottom: 15.0,

              )
            ],
          );
        });
  }

  _builtRating(int rating) {
    String str = '';
    for(int i=1; i<rating; i++) str += "⭐";
    return Container(child: Text(str), alignment: Alignment.centerLeft,);
  }
}
