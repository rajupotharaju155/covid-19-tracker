import 'package:covid_19/screens/about_page/aboutus.dart';
import 'package:flutter/material.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter_page_transition/flutter_page_transition.dart';
import 'package:flag/flag.dart';


class Footer extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return  Column(
      children: <Widget>[
        Container(
   //    padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.black87,
              ),
             
                child: FlatButton(
                  splashColor: Colors.black45,
                  onPressed: () {
                    print("footer");
                     Navigator.of(context).push(PageTransition(type: PageTransitionType.slideInLeft, child: AboutUs() ));   
                      
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Expanded(
                        
                          child: Container(
                            margin: EdgeInsets.only(left:20),
                          decoration: BoxDecoration(
                         //   border: Border.all(color: Colors.white)
                          ),
                          child: Column(
                           
                            children: <Widget>[
                              Row( 
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                Text("Made with ", style: TextStyle(color: Colors.white, fontSize: 11 ),),
                                Icon(EvaIcons.heart, color: Colors.red, size: 13,),
                                Text(" in  ", style: TextStyle(color: Colors.white, fontSize: 11)),
                                 Flags.getMiniFlag('IN', 11, 9),
                              //  Text(" by", style: TextStyle(color: Colors.white, fontSize: 9)),
                               
                              ]),
                           //    Text("Raju Potharaju", style: TextStyle(color: Colors.white, fontSize: 9),),
                            ],
                          ),
                        ),
                      ),
                     
                  Container(
                  decoration: BoxDecoration(
                      //  border: Border.all(color: Colors.white)
                      ),
                  alignment: Alignment.centerRight,
                    child: Icon(Icons.keyboard_arrow_right, color: Colors.white,),
                    )
                                ],
                              ),
                )
                  
            ),
      ],
    );
  }
}