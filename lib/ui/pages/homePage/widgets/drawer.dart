
import 'package:covid_19_tracker/services/apiservice.dart';
import 'package:covid_19_tracker/ui/pages/aboutPage/about_page.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:toast/toast.dart';

import 'package:easy_localization/easy_localization.dart';

import '../../../constants.dart';

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        // padding: EdgeInsets.symmetric(horizontal: 5),
        color: Color(0xff301f43),
        width: (MediaQuery.of(context).size.width + 50) / 2,
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 115,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage("assets/images/covid.jpeg"),
                  colorFilter: new ColorFilter.mode(
                      Colors.black.withOpacity(0.5), BlendMode.softLight),
                ),
              ),
            ),

            SizedBox(height: 10),
            // buildDrawerItem(
            //     "Map View", Icons.location_pin, handleMapView, context),
            buildDrawerItem(
                "FAQ", Icons.question_answer_outlined, handleFaq, context),
            buildDrawerItem(
                "About us", Icons.info_outline_rounded, handleAboutUs, context),
            buildDrawerItem("Language", Icons.chat_bubble_outline_rounded,
                handleLanuage, context),
            // buildVersionItem(),
            Expanded(
                child: Container(
                    alignment: Alignment.bottomCenter,
                    child: buildDrawerItem("v1.0.0",
                        Icons.developer_mode_outlined, handleVersion, context)))
          ],
        ));
  }

  Widget buildDrawerItem(String title, IconData _iconData, Function handler,
      BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {
          handler(context);
        },
        splashColor: Colors.grey[300].withOpacity(0.3),
        hoverColor: Colors.black,
        child: Container(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 9),
            decoration: BoxDecoration(
              border: Border(
                  bottom: BorderSide(width: 0.5, color: Colors.grey[600])),
            ),
            // width: double.infinity,
            child: Row(
              children: [
                Icon(
                  _iconData,
                  size: 26,
                  color: kPrimaryColor,
                ),
                SizedBox(width: 9),
                Text(
                  title,
                  style: TextStyle(
                      fontSize: 17,
                      color: Colors.grey[200],
                      fontWeight: FontWeight.w400),
                ).tr(),
              ],
            )),
      ),
    );
  }

  // void handleMapView(BuildContext context) {
    // Navigator.of(context).push(
    //     PageTransition(type: PageTransitionType.rightToLeft, child: Iframe()));
  //   //write your logic here
  // }

  void handleFaq(BuildContext context) {
    Navigator.of(context).pop();
    Navigator.of(context).push(ApiService().buildPageRouteBuilder(
        'https://www.who.int/csr/disease/coronavirus_infections/faq_dec12/en/'));
  }

  void handleAboutUs(BuildContext context) {
    Navigator.of(context).pop();
    Navigator.of(context).push(
        PageTransition(type: PageTransitionType.rightToLeft, child: AboutUs()));

  }

  void handleLanuage(BuildContext context) {
    Navigator.of(context).pop();
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Choose Language",
                    style: TextStyle(fontWeight: FontWeight.bold))
                .tr(),
            content: Container(
                height: 250,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      FlatButton(
                        onPressed: () {
                          context.locale = Locale('en', 'US');
                          Navigator.of(context).pop();
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: kPrimaryColor),
                              color: context.locale == Locale('en', 'US')
                                  ? Color(0xff301f43)
                                  : Colors.transparent,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5))),
                          child: ListTile(
                              leading: Text(
                            "English",
                            style: TextStyle(
                              fontSize: 17,
                              color: context.locale == Locale('en', 'US')
                                  ? Colors.grey[300]
                                  : Colors.black,
                            ),
                          )),
                        ),
                      ),
                      FlatButton(
                        onPressed: () {
                          context.locale = Locale('hi', 'IN');
                          Navigator.of(context).pop();
                        },
                        child: Container(
                          // margin: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              border: Border.all(color: kPrimaryColor),
                              color: context.locale == Locale('hi', 'IN')
                                  ? Color(0xff301f43)
                                  : Colors.transparent,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5))),
                          child: ListTile(
                              leading: Text(
                            "हिंदी",
                            style: TextStyle(
                              fontSize: 20,
                              color: context.locale == Locale('hi', 'IN')
                                  ? Colors.grey[300]
                                  : Colors.black,
                            ),
                          )),
                        ),
                      ),
                      FlatButton(
                        onPressed: () {
                          context.locale = Locale('te', 'IN');
                          Navigator.of(context).pop();
                        },
                        child: Container(
                          // margin: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              border: Border.all(color: kPrimaryColor),
                              color: context.locale == Locale('te', 'IN')
                                  ? Color(0xff301f43)
                                  : Colors.transparent,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5))),
                          child: ListTile(
                              leading: Text(
                            "తెలుగు",
                            style: TextStyle(
                              fontSize: 20,
                              color: context.locale == Locale('te', 'IN')
                                  ? Colors.grey[300]
                                  : Colors.black,
                            ),
                          )),
                        ),
                      )
                    ])),
          );
        });
  }

  void handleVersion(BuildContext context) {
    print("Version pressed");
    Toast.show("Raju Task", context);
  }
}
