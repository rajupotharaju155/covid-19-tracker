
import 'package:covid_19/utilities/loading.dart';
import 'package:flutter/material.dart';


class GetCityTable extends StatefulWidget {
  GetCityTable({this.cityData, this.loading});
  final Map cityData;
  final bool loading;
  @override
  _GetCityTableState createState() => _GetCityTableState();
}

class _GetCityTableState extends State<GetCityTable> {

List<Widget> list = new List() ;

  Widget getColData(tag, int f, Color txtColor ) {
  return Flexible(
    flex: f,
    fit: FlexFit.tight,
      child: Container( 
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Colors.white,
              border: Border.all(color: Colors.grey[300], width: 1 )
            ),
          //  margin: EdgeInsets.all(5),
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 12),
            child: Center(child: Text(tag, style: TextStyle( fontSize: 11  ,color: txtColor, fontWeight: FontWeight.bold), ))
           ),
  );
}




Widget getTableupperSection(String tag, String count) {
  return Container(
           decoration: BoxDecoration(
             borderRadius: BorderRadius.only(topLeft: Radius.circular(15), topRight: Radius.circular(15)),
                color: Colors.grey[200],
             //   border: Border.all(color: Colors.red, width: 2 )
              ),
         //     margin: EdgeInsets.all(1),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
                getColData(tag.toUpperCase(), 3, Colors.black),
                getColData(count.toString(), 2, Colors.red),
                
          ],)
         );
}

List<Widget> buildRows() {
     widget.cityData.forEach((key, value) {
       list.add(
          getTableupperSection(key, value.toString())
       );
     });
     return list;
      
}
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        getTableupperSection("CITY", "Confirm"),
        Container(
              height: 1.5,
              color: Colors.black
            ),
        Container(
          margin: EdgeInsets.only(bottom: 5),
          decoration: BoxDecoration(
          ),
          height: 280,
          child:  widget.loading? Loading(): ListView(
            children: buildRows() 
          ) 

        )

      ],
    );
  }
}