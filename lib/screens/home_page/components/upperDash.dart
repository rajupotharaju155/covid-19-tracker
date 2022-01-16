import 'package:covid_19/utilities/loading.dart';
import 'package:flutter/material.dart';

class UpperDash extends StatefulWidget {
  UpperDash({this.myCountryData, this.loading, this.lastUpdated});
 final Map myCountryData;
final bool loading;
final String lastUpdated;

  @override
  _UpperDashState createState() => _UpperDashState();
}

class _UpperDashState extends State<UpperDash> {
  Color upperColor;
  Color lowerColor;
  Color textColor;
  String countText;
  String tagText;
  Widget toShow;


@override
Widget build(BuildContext context) {
return Container(
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.all(10),
       
      decoration: BoxDecoration(
      //  border: Border.all(color: Colors.green, width: 3),
        color: Colors.white,
        borderRadius : BorderRadius.all(Radius.circular(5 )),
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

  child: Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                child: PulseLoading()
              ),
             
              Text("LIVE",  style:  TextStyle( color: Colors.red, fontWeight: FontWeight.bold, fontSize: 15 ),),
              Padding(padding: EdgeInsets.only(left: 100, right: 50)   ),
              
            ],
          ),
          Row(
              children: <Widget>[ 
                SizedBox(width: 15),
                Text("All India Status",
                style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold )
                )
              ]
          ),
         
          Row(children: [
            SizedBox(width: 15,),
            widget.loading? Container() : Text( "Last Updated: ${widget.lastUpdated}", 
            style: TextStyle(
              fontStyle: FontStyle.italic,
              color: Colors.grey[600],
              fontSize: 13
            ), 
            )
          ],),
  
     Container(
            height: 100,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: <Widget> [
                //CHILD ONE
                getContainer(Colors.red[50],Colors.red[100],Colors.red,  
           widget.loading? RingLoading(size: 35,) :     Text(widget.myCountryData['Confirmed'],
                style: TextStyle(
                  color: Colors.red, 
                  fontWeight: FontWeight.bold, 
                  fontSize: 20),
                  ), "Confirmed"  ),
                //CHILD TWO
                getContainer(Colors.blue[50],Colors.blue[200],Colors.blue[600], 
           widget.loading? RingLoading(size: 35,) :      Text(widget.myCountryData['Active'],
                style: TextStyle(
                  color: Colors.blue[600], 
                  fontWeight: FontWeight.bold, 
                  fontSize: 20),
                  ), "Active"),
                //CHILD THREE
                getContainer(Colors.green[50],Colors.green[100],Colors.green[600],
           widget.loading? RingLoading(size: 35,) :      Text(widget.myCountryData['Recovered'],
                style: TextStyle(
                  color: Colors.green[600], 
                  fontWeight: FontWeight.bold, 
                  fontSize: 20),
                  ), "Recovered"),
                //CHILD FOUR
                getContainer(Colors.grey[100],Colors.grey[300],Colors.grey[600],
         widget.loading? RingLoading(size: 35,) :        Text(widget.myCountryData['Deceased'],
                style: TextStyle(
                  color: Colors.grey[600], 
                  fontWeight: FontWeight.bold, 
                  fontSize: 20),
                  ), "Deceased"), 
            ]
        ),
          ),

    //GetChart()
    ],
  ),
)
  );
  }

Widget getContainer(upperColor,lowerColor,textColor, toShow, tagText ) {

    return  Container (
      margin: EdgeInsets.only(top: 10,),

      padding: EdgeInsets.only(left: 5, right: 5),
            decoration: BoxDecoration(

           //   border: Border.all(color: Colors.red, width: 1),
                borderRadius : BorderRadius.all(Radius.circular(5)),
                
              ),    
        child: Container(
        decoration: BoxDecoration(
     //   border: Border.all(color: Colors.green, width: 3),
        borderRadius : BorderRadius.all(Radius.circular(7 )),

      ),

          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget> [ 
              Container(
                decoration: BoxDecoration(
                  color: upperColor,
              borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(5.0),
                    topRight: Radius.circular(5.0)
                  ), 
          ), 
                child: Center( 
                  child: toShow
                  ),
            width: 120, height: 39,
          ),
          Container(
              child: Center(child: Text(tagText, style: TextStyle(color: textColor, fontWeight: FontWeight.bold, fontSize: 16),)),
            decoration: BoxDecoration(
              color: lowerColor,
          borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(5.0),
                bottomRight: Radius.circular(5.0)
              ), 
    ), 
            width: 120, height: 39,  
          )
      ]
    ),
        ),
      );
  }



}//end of class
