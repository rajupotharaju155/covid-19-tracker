import 'dart:math';
import 'package:covid_19/screens/home_page/components/chartDash.dart';
import 'package:covid_19/screens/home_page/components/faqDash.dart';
import 'package:covid_19/screens/home_page/components/footer.dart';
import 'package:covid_19/screens/home_page/components/stateTable.dart';
import 'package:covid_19/screens/home_page/components/upperDash.dart';
import 'package:covid_19/utilities/services.dart';
import 'package:covid_19/test_page.dart';
import 'package:flutter/material.dart';





class HomePage extends StatefulWidget {
  HomePage({this.checkCon, this.connected});
  final VoidCallback checkCon;
  final bool connected;
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> { 


TestPage tg = new TestPage();
bool loading = true;
bool noData = false;
Map country;
double fatalityRate;
double recoveryRate;
String lastUpdated;
List<String> myStatesList = new List();
Map myCountryData;
Map myStateData;



double roundDouble(double value, int places){ 
   double mod = pow(10.0, places); 
   return ((value * mod).round().toDouble() / mod); 
}
  void getData() async{
    setState(() {
      loading = true;
    });

    try{

        myCountryData = await Services().getCountry();

        myStateData = await Services().getStatesIndia();

        if(myCountryData.isNotEmpty && myStateData.isNotEmpty){
              fatalityRate = ( double.parse(myCountryData['Deceased']) / double.parse(myCountryData['Confirmed']) ) *100 ;
              fatalityRate = roundDouble(fatalityRate, 2);
              recoveryRate = ( double.tryParse(myCountryData['Recovered'] ) / double.tryParse(myCountryData['Confirmed']) ) *100 ;
              recoveryRate = roundDouble(recoveryRate, 2);
              lastUpdated = myCountryData['Last Updated'];
              setState(() {
                loading = false;
                noData = false;
                print("got all data");
              });
            }
        else{
          setState(() {
            noData = true;
          });
              print("Data is empty");
            }
  }
    catch(e) {
      print("data could not be fetched"); 
      setState(() {
        noData = true;
      });
    }
 

  }

  @override
  void initState() {
    super.initState();
   getData() ;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 2,
        backgroundColor:  Colors.white,
        leading: Container(
   
          margin: EdgeInsets.only(left: 10),
           decoration: BoxDecoration(
        //   border: Border.all(color: Colors.black)
            ),
          child: Image(image: AssetImage('assets/logos/Icon1.png'),
                width: 35,
               height: 35,
                fit: BoxFit.contain,
                ),
        ),
        centerTitle: false,
        title: Container(
          decoration: BoxDecoration(
        //    border: Border.all(color: Colors.black)
            ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("CORONAVIRUS", style: TextStyle(letterSpacing: 2.5, fontSize: 18, color: Colors.black)),
              Text("PANDEMIC",  style: TextStyle(letterSpacing: 1.5, color: Colors.black, fontSize: 13), ),
              Text("Tracker", style: TextStyle(color: Colors.red[700], fontSize: 10, letterSpacing: 1), )
            ],
          ),
        ),
      actions: [

        FlatButton.icon(
                splashColor: Colors.green,
                onPressed: ()
                 {
                   widget.checkCon();
                   print(widget.connected);
                   widget.connected?  getData() : print("no connection so no DATA") ;
              },
                icon: Icon(Icons.refresh, color: Colors.green[400],), 
                label:  Text("Refresh", style: TextStyle( color: Colors.green[400], fontWeight: FontWeight.bold, fontSize: 16 )
                )
                )
     
      ],
      ),
      backgroundColor: Colors.grey[50],
          body:  noData?  NoDataPage()  :   MyBody(myCountryData: myCountryData,  fatalityRate: fatalityRate, recoveryRate: recoveryRate,
                                           myStateData: myStateData, loading: loading, lastUpdated: lastUpdated, )
    );
  }
}

class MyBody extends StatefulWidget {
  MyBody({this.myCountryData,this.fatalityRate, this.recoveryRate, this.myStateData, this.loading , this.lastUpdated});
  final Map myCountryData;
  final Map myStateData;
  final double fatalityRate;
  final double recoveryRate;
  final String lastUpdated;
  final bool loading;
  @override
  _MyBodyState createState() => _MyBodyState();
}

class _MyBodyState extends State<MyBody> {
  @override
  Widget build(BuildContext context) {
        return ListView(
          children: <Widget>[
          
          //UPPER DASHBOARD
          UpperDash(myCountryData: widget.myCountryData, loading: widget.loading, lastUpdated: widget.lastUpdated),        
          //Chart section
          ChartDash(fatalityRate: widget.fatalityRate, recoveryRate: widget.recoveryRate, loading: widget.loading, ),
          //STATE BANNER
          StateBanner(),
          //STATE DATA TABLE
          StateDataTable(myStateData: widget.myStateData, loading: widget.loading, lastUpdated: widget.lastUpdated, ),
          //FAQ SECTION
          FaqDash(),
          //FOOTER
          Footer(),
    
      ],
    );
  }

}

class NoDataPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 40),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("Server error:" , 
                    style: TextStyle(color: Colors.black54, fontWeight: FontWeight.bold, fontSize: 25) 
                    ),
                    Text("We're working to resolve this issue",
                     style: TextStyle(color: Colors.black54, fontWeight: FontWeight.bold, fontSize: 20) 
                     ),
                     SizedBox(height: 10),
                     Text("Please refresh after some time,",
                     style: TextStyle(color: Colors.black54, fontWeight: FontWeight.bold, fontSize: 15)
                     ),
                     Text(" if you encounter this page multiple times",
                     style: TextStyle(color: Colors.black54, fontWeight: FontWeight.bold, fontSize: 15)
                     ),
                      Text(" please send the screen shot to",
                     style: TextStyle(color: Colors.black54, fontWeight: FontWeight.bold, fontSize: 15)
                     ),
                     Text("rajuedu4you@gmail.com",
                     style: TextStyle(color: Colors.black54, fontWeight: FontWeight.bold, fontSize: 15)
                     )
                  ],
                )
                )      
    );
  }
}