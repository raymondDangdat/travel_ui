import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:travel_ui/colors/colors.dart';
import '../models/models.dart';

class DestinationWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Top Destination", style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold, letterSpacing: 1.5),),
              InkWell(
                onTap: (){print("See All Destinations");},
                  child: Text("See All",style: TextStyle(color: primaryColor, fontSize: 16.0, fontWeight: FontWeight.w600, letterSpacing: 1.0),)),
            ],),
        ),
        Container(
          height: 300.0,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: destinations.length,
              itemBuilder: (BuildContext context, int index){
              Destination destination = destinations[index];
              return Container(
                margin: EdgeInsets.all(10.0),
                width: 210.0,
                child: Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    Positioned(
                      bottom: 15.0,
                      child: Container(
                        height: 120.0,
                        width: 200.0, 
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: Colors.white
                        ),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text('${destination.activities.length} activities', style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.w600, letterSpacing: 1.2),),
                            Text(destination.description, style: TextStyle(color: Colors.grey),),

                          ],
                        ),
                      ),
                      ),
                    ),
                    
                    Container(decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20.0),
                      boxShadow: [BoxShadow(color: Colors.black26, offset: Offset(0.0, 2.0), blurRadius: 6.0)]
                    ),
                    child: Stack(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20.0),
                          child: Image(
                            height: 180.0,
                              width: 180.0,
                              image: AssetImage(destination.imageUrl,),
                          fit: BoxFit.cover,),
                        ),
                        Positioned(
                          left: 10.0,
                          bottom: 10.0,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(destination.city,style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 24.0, letterSpacing: 1.2),),
                              Row(
                                children: [
                                  Icon(FontAwesomeIcons.locationArrow, size: 10.0, color: Colors.white,),
                                  SizedBox(width: 5.0,),
                                  Text(destination.country, style: TextStyle(color: Colors.white),),
                                ],
                              ),
                            ],
                          ),
                        )
                      ],
                    ),)
                  ],
                ),
              );
              return Text(destinations[index].city);
              }),
        )

      ],
    );
  }
}
