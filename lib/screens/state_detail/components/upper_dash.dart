
import 'package:covid_19/utilities/loading.dart';
import 'package:flutter/material.dart';


class GetUpperDash extends StatefulWidget {
  GetUpperDash({this.loading, this.lastUpdated, this.total, this.deaths, this.recovered});
  final bool loading;
  final String lastUpdated;
  final String total;
  final String deaths;
  final String recovered;
  
  
  @override
  _GetUpperDashState createState() => _GetUpperDashState();
}

class _GetUpperDashState extends State<GetUpperDash> {



  Widget getContainer(String tag, String count, Color countColor, String img) {
  return Flexible(
    flex: 1,
    fit: FlexFit.tight,
      child: Container(
        margin: EdgeInsets.all(5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(5)),
                color: Colors.white,
              ),
              padding: EdgeInsets.symmetric(vertical:15, horizontal: 10),
              
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                Image(
                  image: AssetImage("assets/images/$img"),
                  width: 30,
                  height: 30, 
                     ),
                SizedBox(height: 5),
                Text(tag,  style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold ),  ),
                SizedBox(height: 5),
                widget.loading? TextLoading(): Text(count, style: TextStyle(color: countColor, fontWeight: FontWeight.bold , fontSize: 20 ),)
              ],)
            ),
  );
}


  @override
  Widget build(BuildContext context) {
    return Container(
    child: Column(children: [
      Container(
        padding: EdgeInsets.only(top:10, bottom:5),
        child: widget.loading? Padding(padding: EdgeInsets.symmetric(vertical: 10)) :  Text("Last Updated: ${widget.lastUpdated}", 
              style: TextStyle(fontStyle: FontStyle.italic, fontSize:10  ), 
        )
        ),
      Container(
        padding: EdgeInsets.symmetric(vertical: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
          getContainer("TOTAL CASES", widget.total, Colors.grey, "search.png"),
          getContainer("DEATHS", widget.deaths, Colors.red[400], "death.png"),
          getContainer("RECOVERED", widget.recovered, Colors.green[400], "recovered.png"),
        ],)
      )
    ],)
  );










  }






}