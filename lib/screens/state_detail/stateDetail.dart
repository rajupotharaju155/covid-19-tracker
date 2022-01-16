import 'dart:io';
import 'package:covid_19/utilities/services.dart';
import 'package:covid_19/screens/home_page/components/footer.dart';
import 'package:covid_19/screens/state_detail/components/app_bar.dart';
import 'package:covid_19/screens/state_detail/components/city_table.dart';
import 'package:covid_19/screens/state_detail/components/upper_dash.dart';
import 'package:covid_19/utilities/services.dart';
import 'package:flutter/material.dart';

class StateDetail extends StatefulWidget {
  StateDetail({ this.stateName, this.lastUpdated});
  final String stateName;
  final String lastUpdated;
 
  @override
  _StateDetailState createState() => _StateDetailState();
}

class _StateDetailState extends State<StateDetail> {

Map data;
bool loading;
String total;
String deaths;
String recovered;
Map cityData;
int cityCount;
bool noData = false;
List<Widget> list = new List();

  void getstateData() async {

    try{
    data =  await Services().getStateDetail(widget.stateName);

    if(data.isNotEmpty &&  data['cityData'].isNotEmpty){
        setState(() {
          cityData = data['cityData'];
          total = data['all_total']['Confirmed'].toString()  ;
          deaths = data['all_total']['Deceased'].toString()  ;
          recovered = data['all_total']['Recovered'].toString()  ;
          cityCount = cityData.length;
          loading = false;
          noData = false;
        });
    }
    else{
      setState(() {
         noData = true;
      });
      throw SocketException("can not download data");
    }
    }
    catch(e) {
        setState(() {
          noData = true;
        });
    }

  }

@override
  void initState() {
    super.initState();
    print(widget.stateName);
    setState(() {
      loading = true;
    });
    getstateData();

  }

  @override
  Widget build(BuildContext context) {
      double screenWidth = MediaQuery. of(context).size.width; //to get screen width of mobile
          return Scaffold(
                appBar: PreferredSize(
                  preferredSize: Size.fromHeight(150.0),
                  child: GetAppBar(screenWidth: screenWidth, stateName: widget.stateName),
          ),
        body:  noData? NoDataForState() :     Container(
            padding: EdgeInsets.symmetric(horizontal:10),
            color: Colors.grey[300],
            child: ListView(
            children: <Widget>[ 

              GetUpperDash(loading: loading, lastUpdated: widget.lastUpdated, total: total, deaths: deaths, recovered: recovered,),
              GetCityTable(cityData: cityData, loading: loading,),
              Footer()
            ],
          ),
        ),
      
    );
  }

}


class NoDataForState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("No internal Data available for this State / UT" , 
                    style: TextStyle(color: Colors.black54, fontWeight: FontWeight.bold, fontSize: 15) 
                    ),
          ],
        )
      ),

    );
  }
}