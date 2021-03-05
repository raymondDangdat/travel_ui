import 'package:flutter/material.dart';
import 'package:travel_ui/colors/colors.dart';
import 'package:travel_ui/models/models.dart';

class HotelWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Exclusive Destinations", style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold, letterSpacing: 1.5),),
              InkWell(
                  onTap: (){print("See All Destinations");},
                  child: Text("See All",style: TextStyle(color: primaryColor, fontSize: 16.0, fontWeight: FontWeight.w600, letterSpacing: 1.0),)),
            ],),
        ),
        Container(
          height: 300.0,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: hotels.length,
              itemBuilder: (BuildContext context, int index){
                Hotel hotel = hotels[index];
                return Container(
                  margin: EdgeInsets.all(10.0),
                  width: 240.0,
                  child: Stack(
                    alignment: Alignment.topCenter,
                    children: [
                      Positioned(
                        bottom: 15.0,
                        child: Container(
                          height: 120.0,
                          width: 240.0,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              color: Colors.white
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(hotel.name, style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.w600, letterSpacing: 1.2),),
                                SizedBox(height: 2.0,),
                                Text(hotel.address, style: TextStyle(color: Colors.grey),),
                                SizedBox(height: 2.0,),
                                Text('₦${hotel.price}/Night', style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w600),),
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
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20.0),
                          child: Image(
                            height: 180.0,
                            width: 220.0,
                            image: AssetImage(hotel.imageUrl,),
                            fit: BoxFit.cover,),
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
