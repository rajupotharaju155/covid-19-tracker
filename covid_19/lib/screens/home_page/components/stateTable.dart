import 'package:covid_19/screens/iframes/iframe1.dart';
import 'package:covid_19/utilities/loading.dart';
import 'package:covid_19/screens/state_detail/stateDetail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_page_transition/flutter_page_transition.dart';

class StateDataTable extends StatefulWidget {
  StateDataTable({this.myStateData, this.loading, this.lastUpdated });
  final Map myStateData;
  final bool loading;
  final String lastUpdated;
  @override
  _StateDataTableState createState() => _StateDataTableState();
}

class _StateDataTableState extends State<StateDataTable> {
ScrollController _controller = ScrollController(
  initialScrollOffset: 60.0,
  keepScrollOffset: true,
);


  @override
  Widget build(BuildContext context) {
        return widget.loading? Loading() :  Container ( 
          margin: EdgeInsets.symmetric(horizontal:5),
          padding: EdgeInsets.all(5),
          height: 330,
          decoration: BoxDecoration (
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10)),
            border: Border.all(color: Colors.grey[400], width:  1),
              boxShadow: [
                  BoxShadow(
                    color: Colors.white,
                    blurRadius: 5, // soften the shadow
                    spreadRadius: 5, //extend the shadow
                    offset: Offset(
                      5.0, // Move to right 10  horizontally
                      5.0, // Move to bottom 10 Vertically
                    ),
                  )
                ],
            ),

            child: ListView(
              controller: _controller,
              //  scrollDirection: Axis.horizontal,
                children: <Widget> [
                  Container(
                child:  DataTable(
                  dividerThickness: 1,
                  columnSpacing: 3,
                  columns: getMyColumns(),
                  rows: widget.loading? RingLoading(size: 30) : getMyRows(),
              ),
                  ),
                ]
                )
      );

}


//function that returns heading of columns
List<DataColumn> getMyColumns() { 

    List<DataColumn> mycolumn =  [
              DataColumn(label: Opacity(opacity: 0.0,child: Text("State", style: TextStyle( color: Colors.black, fontSize: 17,  ),  ))),
              DataColumn(label: Opacity(opacity: 0.0,  child: Center(child: Text('Confirmed', style: TextStyle( color: Colors.red[200], fontSize: 17,  ),  )))),
              DataColumn(label: Opacity(opacity: 0.0, child: Center(child: Text('Recovered', style: TextStyle( color: Colors.green, fontSize: 17  ),    )))),
              DataColumn(label: Opacity(opacity: 0.0,child: Center(child: Text('Deaths' , style: TextStyle( color: Colors.grey, fontSize: 17,  ),   )))),
    ];
    return mycolumn;
  }


//function returns the data in each row
List<DataRow> getMyRows()  {

List<DataRow> list = new List();

  widget.myStateData.forEach((key, value) {
      list.add(
          DataRow(
              cells: [
                DataCell(
                  Text(key.toString().toUpperCase(), 
                  style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 12 )
                  ), 
                  onTap: () { 
                  Navigator.of(context).push(PageTransition(type: PageTransitionType.slideInLeft, child: StateDetail(stateName: key, lastUpdated: widget.lastUpdated,)));   
                  } 
          ),
          DataCell(Center(child: Text(value['Confirmed'].toString(),  style: TextStyle(color: Colors.red[400], fontWeight: FontWeight.bold, fontSize: 18) ))),
          DataCell(Center(child: Text(value['Recovered'].toString(),  style: TextStyle(color: Colors.greenAccent[400], fontWeight: FontWeight.bold, fontSize: 18) )) ),
          DataCell(Center(child: Text(value['Deceased'].toString(),  style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold, fontSize: 18)  ))),
         ]
              )
                ); 
});
    return list;
}




} //end of class

class StateBanner extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
  return  Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
    Container(
      decoration: BoxDecoration(
      //  border: Border.all(color: Colors.black)
      ),
      padding: EdgeInsets.only(top:20, left:10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
              width: 5, 
              height: 25,
              color: Colors.green[700], 
            ),
            SizedBox(width: 10),
            Text("STATES AFFECTED", style: TextStyle(color: Colors.green[700],fontWeight: FontWeight.bold, fontSize: 20), ),
        
          ],
          ),
      Container(
        margin: EdgeInsets.symmetric(horizontal:6),
        padding: EdgeInsets.symmetric(vertical:5),
            child: RaisedButton.icon(
              color: Colors.green[200],
              icon: Icon(Icons.map, color: Colors.green[800],  ),
              splashColor: Colors.green[400],
              onPressed: (){
                    Navigator.of(context).push(PageTransition(type: PageTransitionType.slideInLeft, child: Iframe() ));   
      
              },
              label: Text("Visualize Map", style: TextStyle(color: Colors.green[800], ) )
              )
        )
      ],
      ),
    ),
    Container(
      padding: EdgeInsets.only(left: 10),
      child: Text("Source: patientdb.covid19india.org ",
      style: TextStyle(color: Colors.grey[600], fontSize: 12, fontWeight: FontWeight.normal )
      )
    ),
    Container(
      padding: EdgeInsets.only(left: 10),
      child: Row(
        children: <Widget>[
          Icon(Icons.info, size: 11, ),
          SizedBox(width: 4,),
          Text("Tap on state to now more", style: TextStyle(fontSize: 12, color: Colors.black)),
        ],
      )
    ),
    Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(topLeft: Radius.circular(15), topRight: Radius.circular(15)),
          color: Colors.grey[200],
        //   border: Border.all(color: Colors.red, width: 2 )
        ),
        margin: EdgeInsets.all(5),
    
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
          getColData("State / UT", 3, Colors.black),
          getColData("Confirmed", 2, Colors.red),
          getColData("Recovered", 2, Colors.green),
          getColData("Deceased", 2, Colors.grey[700])
    ],
    )
     )
    ],
  ); 

  }

Widget getColData(String tag, int f, Color txtColor ) {
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

  }