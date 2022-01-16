import 'package:flutter/material.dart';

class GetAppBar extends StatelessWidget {
  GetAppBar({this.screenWidth, this.stateName});
  final double screenWidth;
  final String stateName;
  @override
  Widget build(BuildContext context) {
    return AppBar(
                    flexibleSpace: Stack(
                      children: <Widget>[
                        Image(image: AssetImage("assets/images/covid.jpeg"),
                        width: screenWidth,
                        fit: BoxFit.cover, ),
                        Container( 
                          width: screenWidth,
                          alignment: Alignment.bottomLeft,
                          decoration: BoxDecoration(
                            color: Colors.black45,
                            ),
                            
                              child: Container(
                                padding: EdgeInsets.symmetric(vertical: 5),
                                height: 35,
                                alignment: Alignment.bottomLeft,
                                decoration: BoxDecoration(
                                  color: Colors.black45
                              //   border: Border.all(color: Colors.blue, width:3)
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text("Situation in ${stateName[0].toUpperCase()}${stateName.substring(1)}",
                                        style: TextStyle(
                                          fontFamily:"Roboto",
                                          color: Colors.white,
                                          fontSize: stateName.length>20 ? 12: 18.0,
                                          letterSpacing: 4.0
                                        )),
                                  ],
                                ),
                              ),
                            ),
                      ],
                    ),
                  );
  }
}
