
import 'dart:io';
import 'package:covid_19/screens/home_page/home_page.dart';
import 'package:flutter/material.dart';
import 'package:package_info/package_info.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:url_launcher/url_launcher.dart';

class CheckConnection extends StatefulWidget {
  @override
  _CheckConnectionState createState() => _CheckConnectionState();
}

const app_drive_url =
'https://www.notion.so/Track-Corona-Apk-23d32c1864f8494d87d44e369d80bc29';

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



_launchURL(String url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}


_showVersionDialog(context) async {
  await showDialog<String>(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      String title = "New Update Available";
      String message =
          "There is a newer version of app available please update it now.";
      String btnLabel = "Update Now";
      String btnLabelCancel = "Later";
      return new AlertDialog(
              title: Text(title),
              content: Text(message),
              actions: <Widget>[
                FlatButton(
                  child: Text(btnLabel),

                  onPressed: () => _launchURL(app_drive_url),
                ),
                FlatButton(
                  child: Text(btnLabelCancel),
                  onPressed: () => Navigator.pop(context),
                ),
              ],
            );
    },
  );
}


versionCheck(context) async {
  //Get Current installed version of app
  final PackageInfo info = await PackageInfo.fromPlatform();
  double currentVersion = double.parse(info.version.trim().replaceAll(".", ""));

  //Get Latest version info from firebase config
  final RemoteConfig remoteConfig = await RemoteConfig.instance;

  try {
    // Using default duration to force fetching from remote server.
    await remoteConfig.fetch(expiration: const Duration(seconds: 0));
    await remoteConfig.activateFetched();
    remoteConfig.getString('force_update_current_version');
    double newVersion = double.parse(remoteConfig
        .getString('force_update_current_version')
        .trim()
        .replaceAll(".", ""));
        print("current version is:  $currentVersion");
        print("firebase version is  $newVersion");
    if (newVersion > currentVersion) {
      _showVersionDialog(context);
    }
  } on FetchThrottledException catch (exception) {
    // Fetch throttled.
    print(exception);
  } catch (exception) {
    print('Unable to fetch remote config. Cached or default values will be '
        'used');
  }
}


@override
  void initState() {
    super.initState();
    checkCon();
     versionCheck(context);
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
