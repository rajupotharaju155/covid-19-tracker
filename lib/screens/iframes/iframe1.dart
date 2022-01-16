import 'package:covid_19/utilities/loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

class Iframe extends StatefulWidget {
  @override
  _IframeState createState() => _IframeState();
}

class _IframeState extends State<Iframe> {
  @override
  Widget build(BuildContext context) {
     double screenWidth = MediaQuery. of(context).size.width; 

const kHtml = """

<iframe   style="margin-top: 200px; border: 1px solid black"    src="https://maps.mapmyindia.com/corona"></iframe>

""";


    return SafeArea(
          child: Scaffold(
        body: Stack(
                children :  [
              
              Container(
                margin: EdgeInsets.only(top: 30),
                height: 800,
                child: Loading()
              ),
              Container(
                margin: EdgeInsets.only(top: 30),
            height: 800,
            child: HtmlWidget(
              kHtml,
              webView: true,
              webViewJs: true,
            ),
          ),
            Container(
              height: 120,
                  decoration: BoxDecoration(
                    color: Colors.white,
         //       border: Border.all(color: Colors.black, width: 1)
                ),

              child: Stack(
                children: [  
                  Image(image: AssetImage("assets/images/map1.jpg"),
                    width: screenWidth, 
                    fit: BoxFit.fitHeight, 
                    ),
                    AppBar(
                      elevation: 0,
                      backgroundColor: Colors.black38,
                        bottom: PreferredSize(
                                    child: Container(
                                      padding: EdgeInsets.only(left: 10),
                                      width: screenWidth,
                                      color: Colors.black54,
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          Column(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: <Widget>[
                                              Text("Map visualization", style: TextStyle(color: Colors.white, fontSize: 20  ), ),
                                              Text("source: mapmyindia.com", style: TextStyle(color: Colors.white, fontSize: 10  )  )
                                            ],
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(right:8.0),
                                            child: Column(
                                              mainAxisAlignment: MainAxisAlignment.end,
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: <Widget>[
                                                Text("Tap on Map layers", style: TextStyle(color: Colors.white, fontSize: 10  ), ),
                                                Row(
                                                  children: <Widget>[
                                                    Text("for more info", style: TextStyle(color: Colors.white, fontSize: 10  )  ),
                                                    Icon(Icons.arrow_downward, size: 15, color: Colors.white,)
                                                  ],
                                                )
                                              ],
                                            ),
                                          )
                                        ],
                                      )),
                                    preferredSize: Size(200,40),
                                    ),
                    )
        
                  ]
              ),
            ), 
                ]
        ),
      ),
    );
  }
}