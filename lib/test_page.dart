import 'package:flutter/material.dart';


class TestPage extends StatelessWidget {
  TestPage({this.myStateData});
  final Map myStateData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          appBar: AppBar(
            title: Text("Test page")
          ),
          body:  ListView(
                      children: <Widget> [ Center(
              child: Container(
                height: 200,
                decoration: BoxDecoration(border: Border.all(color: Colors.red, width:  4),),

                child: ListView(
                //  scrollDirection: Axis.horizontal,
                  children: <Widget> [
                    Container(
                       height: 200,
                decoration: BoxDecoration(
                  color: Colors.red,
                  border: Border.all(color: Colors.red, width:  4),),
                    ),
                    Container(
                      width: 100,
                       height: 200,
                decoration: BoxDecoration(
                  color: Colors.yellow,
                  border: Border.all(color: Colors.red, width:  4),),
                    ),
                    Container(
                       height: 200,
                decoration: BoxDecoration(
                  color: Colors.green,
                  border: Border.all(color: Colors.red, width:  4),),
                    ),
                    Container(
                      child: DataTable(
                  columns: [
                      DataColumn(label: Container(
                        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 7),
                        decoration: BoxDecoration(color: Colors.grey),
                        child: Text('State'))),
                      DataColumn(label: Text('Confirmed')),
                      DataColumn(label: Text('Recovered'  )),
                      DataColumn(label: Text('Deaths'  )),
                  ],
                  rows: [
                      DataRow(cells: [
                        DataCell(Text('1')),
                        DataCell(Text('Arya')),
                        DataCell(Text('6')),
                        DataCell(Text('6')),
                      ]),
                      DataRow(cells: [
                        DataCell(Text('12')),
                        DataCell(Text('John')),
                        DataCell(Text('9')),
                        DataCell(Text('6')),
                      ]),
                      DataRow(cells: [
                        DataCell(Text('42')),
                        DataCell(Text('Tony')),
                        DataCell(Text('8')),
                        DataCell(Text('6')),
                      ]),
                  ],
                ),
                    ),
                  ]
                 ),
              ),
            ),
                      ]
          ),
    );
  }
}