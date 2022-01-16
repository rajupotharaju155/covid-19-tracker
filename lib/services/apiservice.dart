import 'dart:convert';
import '../models/apimodel.dart';
import '../ui/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

import 'package:easy_localization/easy_localization.dart';
class ApiService{

  Future<dynamic> getDataFromApi() async { 
    try {
     MasterModel _apiModel =  await getDataFromKrunalApi();
     return _apiModel;
    } catch (e) {
      print("error occured: in KRUNAL API "+ e.toString());
      try {
          final DateFormat formatter = DateFormat('yyyy-MM-dd');
          final String formattedDate = formatter.format(DateTime.now());
          print(formattedDate);
          var url = 'https://api.covid19tracking.narrativa.com/api/$formattedDate/country/india';
          var response =  await http.get(url);
          var newData = json.decode(response.body);

          // print("total data is: " + newData['total'].toString());
          int totalDeaths = newData['dates']['$formattedDate']['countries']['India']['today_deaths'];
          int toatlRecoveries = newData['dates']['$formattedDate']['countries']['India']['today_recovered'];
          int totalCases = newData['dates']['$formattedDate']['countries']['India']['today_confirmed'];
          
          ApiModel _countryData = new ApiModel(
              totalCases: newData['dates']['$formattedDate']['countries']['India']['today_confirmed'],
              totalActive: newData['dates']['$formattedDate']['countries']['India']['today_open_cases'],
              totalRecoveries: newData['dates']['$formattedDate']['countries']['India']['today_recovered'],
              totalDeaths: newData['dates']['$formattedDate']['countries']['India']['today_deaths'],
              todayNewConfirmed: newData['dates']['$formattedDate']['countries']['India']['today_new_confirmed'],
              todayNewRecovered: newData['dates']['$formattedDate']['countries']['India']['today_new_recovered'],
              todayNewDeaths: newData['dates']['$formattedDate']['countries']['India']['today_new_deaths'],
              todayNewActive: newData['dates']['$formattedDate']['countries']['India']['today_new_open_cases'],
              updatedAt: newData['updated_at'],
              fatalityRate: double.parse(((totalDeaths/totalCases)*100).toStringAsFixed(2)),
              recoveryRate: double.parse(((toatlRecoveries/totalCases)*100).toStringAsFixed(2))
          );
          print("Regions data is: ");
          // print(newData['dates']['$formattedDate']['countries']['India']['regions'].toString());
          List regionsList = newData['dates']['$formattedDate']['countries']['India']['regions'];
          // print(regionsList);
          int n = 1;
          List<ApiModel> _stateList = new List<ApiModel>();
          regionsList.forEach((state) {
            // print(state['today_confirmed']);
            if(state['today_confirmed'] != null){
            _stateList.add(
              ApiModel(
                locationName: state['name'],
                totalCases: state['today_confirmed'],
                totalActive: state['today_open_cases'],
                totalRecoveries: state['today_recovered'],
                totalDeaths: state['today_deaths'],
                todayNewConfirmed: state['today_new_confirmed'],
              )
            );
            }
            n= n +1;
          });
          MasterModel  _masterModel = new MasterModel(
              countryData: _countryData,
              stateList: _stateList
          );
          return _masterModel;
      } catch (e) {
        print("Error occured in narrative api also");
      return false;
      }
    }
    
  }


  Future<dynamic> getDataFromKrunalApi() async {
    var url = 'https://krazycovidindia.azurewebsites.net/api/all';
    var response =  await http.get(url);
    var newData = json.decode(response.body);
    print("Update at: ------------" + newData['all']['Last Updated']);
    ApiModel _countryData = new ApiModel(
          totalCases: int.parse(newData['all']['Confirmed']),
          totalActive: int.parse(newData['all']['Active']),
          totalRecoveries: int.parse(newData['all']['Recovered']),
          totalDeaths: int.parse(newData['all']['Deceased']),
          fatalityRate: double.parse(((int.parse(newData['all']['Deceased'])/int.parse(newData['all']['Confirmed']))*100).toStringAsFixed(2)),
          recoveryRate: double.parse(((int.parse(newData['all']['Recovered'])/int.parse(newData['all']['Confirmed']))*100).toStringAsFixed(2)),
          todayNewActive: 0,
          todayNewConfirmed: 0,
          todayNewDeaths: 0,
          todayNewRecovered: 0,
          updatedAt: newData['all']['Last Updated'],
    ); 
        print("Regions data is: ");
          // print(newData['dates']['$formattedDate']['countries']['India']['regions'].toString());
         Map regionsList = newData['states'];
          List<ApiModel> _stateList = new List<ApiModel>();
          regionsList.forEach((state, value) {           // _stateList.add(
            _stateList.add(
              ApiModel(
                locationName: state,
                totalCases: int.parse(value['all_total']['Confirmed']),
                totalActive: int.parse(value['all_total']['Active']),
                totalRecoveries: int.parse(value['all_total']['Recovered']),
                totalDeaths: int.parse(value['all_total']['Deceased']),
              )
            );
          });
          MasterModel  _masterModel = new MasterModel(
              countryData: _countryData,
              stateList: _stateList
          );
    return _masterModel;
  }



 Future<dynamic> getStateData(String stateName)async {
  try{
    var url = 'https://krazycovidindia.azurewebsites.net/api/all';
    var response = await http.get(url);
    var newData = json.decode(response.body);
    Map regionList = newData['states'][stateName];
    Map _cityData = regionList['cityData'];
     List<ApiModel> _cityList = new List<ApiModel>();

    _cityData.forEach((city, value) {
      _cityList.add(ApiModel(
        locationName: city,
        totalCases: value,
      ));
    });
   ApiModel _stateData = new ApiModel(
      locationName: stateName,
      updatedAt: regionList['all_total']['Last Updated'],
      totalCases: int.parse(regionList['all_total']['Confirmed']),
      totalActive: int.parse(regionList['all_total']['Active']),
      totalRecoveries: int.parse(regionList['all_total']['Recovered']),
      totalDeaths: int.parse(regionList['all_total']['Deceased']),
  );
   StateMasterModel  _masterModel = new StateMasterModel(
              stateData: _stateData,
              cityList: _cityList
  );
    return _masterModel;
  }catch(e){
    return false;
  }
}



  //to push in web view
        PageRouteBuilder buildPageRouteBuilder(String url) {
      return PageRouteBuilder(
          pageBuilder: (_, __, ___) => WebviewScaffold(
              hidden: true,
              url: url,
              enableAppScheme: true,
              appCacheEnabled: true,
              ignoreSSLErrors: true,
              appBar: AppBar(
                backgroundColor:  Color(0xff1C1228),
                title: Text("WHO FAQs",
                style: GoogleFonts.robotoMono()
                ),
              ),
              initialChild: Container(
                color: Colors.grey[200],
                alignment: Alignment.center,
                child: Center(
                    child: Card(
                  child: Container(
                    width: 230,
                    height: 60,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation<Color>(kPrimaryColor),
                          backgroundColor: kPrimaryColor.withOpacity(0.2),
                        ),
                        Text(
                          "Please Wait...",
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        ).tr()
                      ],
                    ),
                  ),
                )),
              )),
            transitionsBuilder: (context, animation, secondaryAnimation, child) =>
                FadeTransition(
                  opacity: animation,
                  child: child,
            ));
      }


}