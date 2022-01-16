
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
class FaqDash extends StatelessWidget {



_launchURL() async {
  const url = 'https://www.who.int/csr/disease/coronavirus_infections/faq_dec12/en/';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}


  @override
  Widget build(BuildContext context) {
    return Container(
    height: 35,
    margin: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
      decoration: BoxDecoration(
              //   border: Border.all(color: Colors.red, width: 1),
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(10)),
                boxShadow: [
                      BoxShadow(
                        color: Colors.grey[400],
                        offset: Offset(
                          1.0, // Move to right 10  horizontally
                          1.0, // Move to bottom 10 Vertically
                        ),
                      )
                    ],
                  ), 
    child:   FlatButton(
      highlightColor: Colors.grey,
      onPressed: () {
        print("pressed");
         // Navigator.of(context).push(PageTransition(type: PageTransitionType.slideInLeft, child: CustomDropdown(text: "text",)));   
           _launchURL();       
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget> [
                  Text("FAQ", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18 , color: Colors.green[700]  )),
                  Icon(Icons.keyboard_arrow_right, color: Colors.green[700], size: 25, )
            ],
       
          ),
          ),
    );
      
  }
}