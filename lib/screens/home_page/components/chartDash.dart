
import 'package:covid_19/screens/home_page/components/chart.dart';
import 'package:covid_19/utilities/loading.dart';
import 'package:flutter/material.dart';
class ChartDash extends StatefulWidget {
ChartDash({this.fatalityRate, this.recoveryRate, this.loading});
final double fatalityRate;
final double recoveryRate;
final bool loading;
  @override
  _ChartDashState createState() => _ChartDashState();
}

class _ChartDashState extends State<ChartDash> {
String rateName;
double rateCount;
Color rateColor;

  @override
  Widget build(BuildContext context) {
    return Container(
          padding: EdgeInsets.all(0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children : <Widget> [
              getBox( "Fatality Rate" , widget.fatalityRate, Colors.pink[400]),
              getBox( "Recovery Rate" , widget.recoveryRate, Colors.green[300])
        ]
      ),
    );
  }


//returning the getBox container Widget
Widget getBox(rateName, rateCount, rateColor) {
    return Container(
          padding: EdgeInsets.symmetric(horizontal: 18),
              decoration: BoxDecoration(
              //  border: Border.all(color: Colors.red, width: 1),
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
              child:   Column(
                children: <Widget>[
               widget.loading? Loading() : GetChart(rate: rateCount, mycolor: rateColor),
                  SizedBox(height: 5),
          Text(rateName, 
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16 )
          ),
          SizedBox(height: 5)
                ],
              )
          );
  }







}

