import 'package:flutter/material.dart';
import 'package:toast/toast.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../constants.dart';
import 'widgets/animation.dart';
import 'widgets/appbar_about.dart';

class AboutUs extends StatefulWidget {
  @override
  _AboutUsState createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  final int delayedAmount = 500;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff1C1228),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(110.0),
        child: GetAboutAppBar(),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: Container(
            child: ListView(
              children: [
                // developerInfo(
                //   "Application Developer", 
                //   "Payal Pawar",
                //   "https://www.linkedin.com/in/payal-pawar-a7b960182", 
                //   "payal.jpg", 700),
                //   developerInfo(
                //     "Application Developer",
                //     "Mayuresh Surve",
                //     "https://www.linkedin.com/in/mayuresh-surve/",
                //     "mayuresh.jpg",
                //     1200),
                developerInfo(
                    "Application Developer",
                    "Raju Potharaju",
                    "https://linkedin.com/in/rajupotharaju155/",
                    "raju.jpg",
                    1700),

                salutations(),    
                openSourceInfo()
              ],
            )),
      ),
    );
  }

  Widget developerInfo(String tag, String name, String url, String img, int d) {
    return DelayedAnimation(
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
                  color: kPrimaryColor,
                ),
                SizedBox(width: 10),
                Text(
                  tag,
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 15),
                )
              ],
            )),
            Container(
              margin: EdgeInsets.symmetric(vertical: 5),
              decoration: BoxDecoration(
                  color: Colors.grey[800],
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                  border: Border.all(color: kPrimaryColor)),
              child: ListTile(
                title: Text(name, style: TextStyle(color: Colors.grey[200])),
                subtitle: Text(
                  "Atharva College of Engineering, Mumbai",
                  style: TextStyle(color: Colors.grey[400], fontSize: 10),
                ),
                leading: Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(color: Colors.grey, offset: Offset(2, 2))
                      ],
                      //  border: Border.all(color: Colors.black),
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          fit: BoxFit.fill,
                          image: AssetImage('assets/images/developers/$img'))),
                  // child: Image.asset(
                  //   'assets/developers/$img',
                  //   fit: BoxFit.cover,
                  // )
                ),
                trailing: IconButton(
                    icon: Icon(
                      Icons.open_in_new,
                      color: kPrimaryColor,
                    ),
                    onPressed: () {
                      _launchURL(url);
                    }),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget salutations(){
      return DelayedAnimation(
        delay: 2000,
              child: Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Our Salutations",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18
                            ),
                            ),
                            Divider(color: Colors.grey[600],),
                            GestureDetector(
                              onTap: () =>  _launchURL('https://www.linkedin.com/in/krunal-gediya/'),
                              child: Row(
                                children: [
                                  Icon(Icons.arrow_forward_ios_sharp, color: Colors.white, size: 13),
                                  SizedBox(width: 5),
                                  Text("Krunal Gediya ",
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.blue[800]
                                  ),
                                  ),
                                  Text("(API Developer)",
                                  style: TextStyle(
                                    fontSize: 10,
                                    color: Colors.grey[400]
                                  ),
                                  )
                                ],
                              ),
                            ),

                            GestureDetector(
                              onTap: () => _launchURL('https://www.behance.net/gallery/89471537/Portfolio'),
                              child: Row(
                                children: [
                                  Icon(Icons.arrow_forward_ios_sharp, color: Colors.white, size: 13),
                                  SizedBox(width: 5),
                                  Text("Vikrant Patankar ",
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.blue[800]
                                  ),
                                  ),
                                  Text("(App logo designer)",
                                  style: TextStyle(
                                    fontSize: 10,
                                    color: Colors.grey[400]
                                  ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
      );
  }

  Widget openSourceInfo() {
    return DelayedAnimation(
      delay: 2200,
      child: Container(
        margin: EdgeInsets.only(top: 5),
        child: Column(children: [
          Container(
            padding: EdgeInsets.all(10),
            child: Text(
                "This is an open sourced app meant only for educational purposes",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 11,
                    color: Colors.grey[300])),
          ),
          GestureDetector(
              child: Container(
                width: 200,
                height: 50,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    border: Border.all(color: Colors.grey),
                    image: DecorationImage(
                        image: AssetImage("assets/images/github.jpg"),
                        fit: BoxFit.fill)),
                // button text
              ),
              onTap: () {
                Toast.show("Redirect to github repo", context,
                    gravity: Toast.CENTER);
                _launchURL("https://github.com/rajupotharaju155/covid-19-tracker/"); 
                //if you ve reached till here, fork me on github :)
              }),
          Container(
            padding: EdgeInsets.all(8),
            child: Text(
              "Version: 1.0.0",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.normal,
                  fontSize: 11,
                  color: Colors.grey[400]),
            ),
          )
        ]),
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
