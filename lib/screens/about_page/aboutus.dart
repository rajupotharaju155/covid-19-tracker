import 'package:covid_19/animation/delayed_animation.dart';
import 'package:flutter/material.dart';
import 'package:covid_19/screens/about_page/components/app_bar.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutUs extends StatefulWidget {
  @override
  _AboutUsState createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
     final int delayedAmount = 500;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
                  preferredSize: Size.fromHeight(125.0),
                  child: GetAboutAppBar()  ,
          ),
          body: Container(
            padding: EdgeInsets.symmetric(horizontal:5),
            color: Colors.grey[300],
            child: Container(
              margin: EdgeInsets.only(top: 20),
              child: ListView(
                  children: [
                      developerInfo("Application Developer", "Raju Potharaju", "https://linkedin.com/in/rajupotharaju155/", "raju.jpg", 700),
                      developerInfo("API Developer", "Krunal Gediya", "https://www.linkedin.com/in/krunal-gediya/", "krunal.jpeg", 1200),
                      developerInfo("Application Logo Designer", "Vikrant Patankar", "https://www.behance.net/gallery/89471537/Portfolio", "vikrant.jpeg", 1700),
                      openSourceInfo()
                ],
                )
            ),
          ),
      
    );
  }

Widget developerInfo(String tag, String name, String url, String img, int d) {
return 
  DelayedAnimation(
    delay: d,
      child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
              children: <Widget>[
                    Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                      Container(
                        width: 5, 
                        height: 25,
                        color: Colors.black54, 
                      ),
                      SizedBox(width: 10),
                      Text(tag, style: TextStyle(color: Colors.black54,fontWeight: FontWeight.bold, fontSize: 15), )
                    ],)
                  ),
                        Container(

                          margin: EdgeInsets.symmetric(vertical:5),
                          decoration: BoxDecoration(
                            boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey,
                                    offset: Offset(1, 1))
                                ],

                            color: Colors.white,
                            borderRadius: BorderRadius.only(topLeft: Radius.circular(20), bottomRight: Radius.circular(20) )
                            ),
                          
                          child: ListTile(
                            title: Text(name, style: TextStyle( )),
                            subtitle: Text("Student, Athrava College of Engineering, Mumbai",
                            style: TextStyle(fontSize: 10), ),
                            leading: Container(
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey,
                                    offset: Offset(2, 2))
                                ],
                              //  border: Border.all(color: Colors.black),
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                  fit: BoxFit.fill,
                                  image: AssetImage('assets/developers/$img'))
                                ),
                           //   child: Image.asset('assets/developers/$img', fit: BoxFit.cover,  )
                            ),
                            trailing: IconButton(icon: Icon(Icons.open_in_new, color: Colors.blueAccent, ), onPressed: () {_launchURL(url);} ),
                            ),
                        ),
                      ],
                    ),
    ),
  );
}



Widget openSourceInfo() {
  return DelayedAnimation(
    delay: 2000,
      child: Container(
      margin: EdgeInsets.only(top: 20),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(10),
            child: Text("This is an open sourced app meant only for educational purposes", 
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 11,
              color: Colors.black54
            )),
          ),
          GestureDetector(
                child: Container(
                width: 200,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                  border: Border.all(color: Colors.grey),
                  image: DecorationImage(
                    image:AssetImage("assets/images/github.jpg"), 
                    fit:BoxFit.fill
                  )
                  ),
               // button text
                ),
                onTap:(){
                 _launchURL("https://github.com/rajupotharaju155");  //if you ve reached till here, fork me on github :)
                print("you clicked my");
                }
),

Container(
  padding: EdgeInsets.all(8),
  child: Text("Version: 1.0.0", 
style: TextStyle(
  fontWeight: FontWeight.bold,
  fontStyle: FontStyle.normal,
  fontSize: 11,
  color: Colors.black54
), ),)
        ]
      ),
    ),
  );
}


_launchURL(String url) async {
  //const url = url;
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}











}

