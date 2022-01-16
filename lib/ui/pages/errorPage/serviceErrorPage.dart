
import 'package:flutter/material.dart';

import '../../constants.dart';

class ServiceErrorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  Container(
               color: Color(0xff212121),
               child: Column(
                 mainAxisAlignment: MainAxisAlignment.start,
                 children: [
                   Container(
                     padding: EdgeInsets.only(top: MediaQuery.of(context).size.width/5),
                          alignment: Alignment.center,
                       child: Container(
                       width: MediaQuery.of(context).size.width,
                       height: 150,
                       decoration: BoxDecoration(
                       image: DecorationImage(
                         fit: BoxFit.fill,
                         image: AssetImage("assets/error/404.jpg"),
                       ),
                       ),
                     ),
                   ),
                   Container(
                     alignment: Alignment.topCenter ,
                     child: Text("Ooops!",
                      style: TextStyle(
                        fontSize: 20,
                        color: kPrimaryColor
                      ),
                      ),
                   ),
                   Container(
                     padding: EdgeInsets.symmetric(horizontal: 10),
                     alignment: Alignment.topCenter ,
                     child: Text("Something went wrong please try again later",
                     textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.grey[300]
                      ),
                      ),
                   ),
                 ],
               ),
             );
  }
}