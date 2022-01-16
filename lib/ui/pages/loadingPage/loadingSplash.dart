import 'package:covid_19_tracker/ui/pages/homePage/home_page.dart';
import 'package:flutter/material.dart';

class LoadingSplash extends StatefulWidget {
  LoadingSplash({Key key}) : super(key: key);

  @override
  _LoadingSplashState createState() => _LoadingSplashState();
}

class _LoadingSplashState extends State<LoadingSplash> {
  @override
  void initState() {
    super.initState();
    navigationTopage();
  }

  void navigationTopage() {
    Future.delayed(Duration(seconds: 6)).then((value) {
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (BuildContext context) => HomePage()));

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color(0xff301f43),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              flex: 3,
              child: Container(
                child: Image.asset('assets/gif/coronagif.gif'),
              ),
            ),
              Expanded(
                flex: 1,
                  child: Center(
                    child: 
                  CircularProgressIndicator(
                    backgroundColor: Colors.white,
                  )
              
              ),
              )

       
          ],
        ),
      ),
    );
  }
}


// FadeAnimatedTextKit(
//                             textAlign: TextAlign.center,
//                             alignment: Alignment.center,
//                             onTap: () {
//                               print("Tap Event");
//                             },
//                             text: ["TRACK CORONA", "सावधान रहोना"],
//                             textStyle: TextStyle(
//                               letterSpacing: 2,
//                               fontSize:  22.0,
//                               color: Colors.white 
//                             ),
//                           // )