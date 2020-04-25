import 'package:flutter/material.dart';

class GetAboutAppBar extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery. of(context).size.width; //to get screen width of mobile
     
    return AppBar(
        flexibleSpace: Stack(
          children: <Widget>[
            Image(image: AssetImage("assets/images/developers.jpg"),
            width: screenWidth,
            fit: BoxFit.cover, ),
            Container( 
              width: screenWidth,
              alignment: Alignment.bottomLeft,
              decoration: BoxDecoration(
                color: Colors.black54,
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
                        Padding(
                          padding: const EdgeInsets.only(left:8.0),
                          child: Text("About the Developers",
                              style: TextStyle(
                                fontFamily:"Roboto",
                                color: Colors.white,
                                fontSize: 18.0,
                                letterSpacing: 4.0
                              )),
                        ),
                      ],
                    ),
                  ),
                ),
          ],
        ),
                  );
  }
}
