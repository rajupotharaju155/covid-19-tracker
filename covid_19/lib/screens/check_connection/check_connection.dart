
import 'dart:io';
import 'package:covid_19/screens/home_page/home_page.dart';
import 'package:flutter/material.dart';


class CheckConnection extends StatefulWidget {
  @override
  _CheckConnectionState createState() => _CheckConnectionState();
}

class _CheckConnectionState extends State<CheckConnection> {
bool _connected =  true;

void checkCon() async {
  print("checking.....");
  try {
        final result = await InternetAddress.lookup('google.com');
        if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
      setState(() {
        print("connected");
        _connected = true;
      });
        }
} on SocketException catch (_) {
      setState(() {
        print("Not connected");
        _connected = false;
      });
}
}


@override
  void initState() {
    super.initState();
    checkCon();
  }


  @override
  Widget build(BuildContext context) {
    return _connected? HomePage(checkCon: checkCon,  connected: _connected, ) : errorPage();
  }


Widget errorPage() {
  return  SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Center(
          child: Container(
            decoration: BoxDecoration(
        //      border: Border.all(color: Colors.white)
              ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("Ooops!" , style: TextStyle(color: Colors.greenAccent, fontSize: 30 ) ),
              SizedBox(height: 10,),
              Text("Slow or no internet connection", style: TextStyle(color: Colors.white),),
              Text("Please check your internet settings",  style: TextStyle(color: Colors.white),),
              Center(
                child: IconButton(icon: Icon(Icons.refresh, size: 50, color: Colors.greenAccent,  ), onPressed: () {
                  checkCon();
                }  ),
              ) ,
            ],
        ),
          ),)
      ),
  );
}

}
