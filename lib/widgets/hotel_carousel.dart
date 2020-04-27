import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:second_app/models/hotel_model.dart';

class HotelCarousel extends StatelessWidget {
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
                "Exclusive Hotels",
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
          height: 277.0,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: hotels.length,
              itemBuilder: (context, index) {
                Hotel hotel = hotels[index];
                return Container(
                  margin: EdgeInsets.all(10.0),
                  width: 230.0,
                  child: Stack(
                    alignment: Alignment.topCenter,
                    children: <Widget>[
                      Positioned(
                        child: Container(
                            height: 130,
                            width: 220.0,
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
                                  Row(
                                    children: <Widget>[
                                      Text(
                                        "${hotel.name}",
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w600,
                                            letterSpacing: 1.2),
                                      ),
                                      Text(
                                        "${hotel.price} \$",
                                        style: TextStyle(
                                            fontSize: 20,
                                            color: Colors.black87,
                                            fontWeight: FontWeight.bold
                                        ),
                                      ),
                                    ],
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  ),
                                  Text(
                                    "${hotel.address}",
                                    style: TextStyle(
                                        color: Colors.blueGrey
                                    ),
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
                        child: ClipRRect(
                          child: Image(
                              height: 180.0,
                              width: 200.0,
                              image: AssetImage(hotel.imageUrl),
                              fit: BoxFit.fill),
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                    ],
                  ),
                );
              }),
        )
      ],
    );
  }
}
