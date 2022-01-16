import 'package:covid_19_tracker/services/apiservice.dart';
import 'package:covid_19_tracker/ui/pages/errorPage/serviceErrorPage.dart';
import 'package:covid_19_tracker/ui/pages/homePage/widgets/loading.dart';
import 'package:covid_19_tracker/ui/pages/statePage/widgets/cityHeader.dart';
import 'package:covid_19_tracker/ui/pages/statePage/widgets/cityItem.dart';
import 'package:covid_19_tracker/ui/pages/statePage/widgets/state_info_card.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:covid_19_tracker/models/apimodel.dart';
import 'package:flutter/material.dart';
import '../../constants.dart';
import 'package:easy_localization/easy_localization.dart';

class StateDataPage extends StatefulWidget {
  StateDataPage({this.stateName});
  final String stateName;

  @override
  _StateDataPageState createState() => _StateDataPageState();
}

class _StateDataPageState extends State<StateDataPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  bool loading = false;
  bool serviceError = false;
  ApiModel _stateData;
  List<ApiModel> _cityData = new List<ApiModel>();
  ScrollController _outerListController;
  ScrollController _innerListController;
  ScrollPhysics _outerScrollPhysics = AlwaysScrollableScrollPhysics();
  ScrollPhysics _innerScrollPhysics = NeverScrollableScrollPhysics();

  void runAPIFunction() async {
    setState(() {
      loading = true;
    });
      final data = await ApiService().getStateData(widget.stateName);
      if(data is bool){
         print("Error occured");
        serviceError = true;
      }else{
        _stateData = data.stateData;
        _cityData = data.cityList;
        serviceError = false;
      }
    setState(() {
      loading = false;
    });
  }

  _outerListscrollListener() {
    print("Outer scroll: " + _outerListController.position.pixels.toString());

    if (_outerListController.offset >=
            _outerListController.position.maxScrollExtent &&
        !_outerListController.position.outOfRange) {
      print("reached bottom of outer");
      setState(() {
        _innerScrollPhysics = AlwaysScrollableScrollPhysics();
      });
    }

    if (_outerListController.offset <=
            _outerListController.position.minScrollExtent &&
        !_outerListController.position.outOfRange) {
      _innerScrollPhysics = NeverScrollableScrollPhysics();
      _outerScrollPhysics = AlwaysScrollableScrollPhysics();
      print("reached top of outer");
      setState(() {});
    }
  }

  _innerListscrollListener() {
    print("Inners scroll: " + _innerListController.position.pixels.toString());
    if (_innerListController.offset <=
            _innerListController.position.minScrollExtent &&
        !_innerListController.position.outOfRange) {
      _innerScrollPhysics = NeverScrollableScrollPhysics();
      _outerScrollPhysics = AlwaysScrollableScrollPhysics();
      print("reached top of inner");
      setState(() {});
    }
  }

  void initState() {
    super.initState();
    runAPIFunction();
    _outerListController = ScrollController();
    _innerListController = ScrollController();
    _outerListController.addListener(_outerListscrollListener);
    _innerListController.addListener(_innerListscrollListener);
    _outerScrollPhysics = AlwaysScrollableScrollPhysics();
    _innerScrollPhysics = NeverScrollableScrollPhysics();
  }

  @override
  Widget build(BuildContext context) {
    print(widget.stateName.length);
    return Scaffold(
        backgroundColor: Color(0xff1C1228),
        key: _scaffoldKey,
        appBar: AppBar(
          backgroundColor: Color(0xff1C1228),
          automaticallyImplyLeading: true,
          title: Text(
              widget.stateName.toUpperCase(),
              style: GoogleFonts.robotoMono(
                fontSize:widget.stateName.length > 20 ? 12 : 18,
                letterSpacing: 1
              ),
            ).tr(),
        ),
        body: loading
            ? Loading() 
            :
             serviceError ?
            ServiceErrorPage()
            : ListView(
                physics: _outerScrollPhysics,
                controller: _outerListController,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Text(
                        //   widget.stateName.toUpperCase(),
                        //   style: TextStyle(
                        //       fontSize: 18,
                        //       fontWeight: FontWeight.bold,
                        //       color: Colors.white),
                        // ),
                        Row(
                          children: [
                            Text(
                              "Last Updated: ",
                              style: TextStyle(
                                fontStyle: FontStyle.italic,
                                color: Colors.grey[400],
                                fontSize: context.locale == Locale('hi', 'IN')
                                    ? 14
                                    : 12,
                              ),
                            ).tr(),
                            Text(
                              _stateData.updatedAt,
                              style: TextStyle(
                                  fontStyle: FontStyle.italic,
                                  color: Colors.grey[400],
                                  fontSize: 11),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(
                        left: 10, top: 20, right: 10, bottom: 40),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: kPrimaryColor.withOpacity(0.03),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(50),
                        bottomRight: Radius.circular(50),
                      ),
                    ),
                    child: Wrap(
                      runSpacing: 20,
                      spacing: 20,
                      children: <Widget>[
                        StateInfoCard(
                          title: "Confirmed Cases",
                          // subtitle: _stateData.todayNewConfirmed.toString(),
                          iconColor: Color(0xFFFF8C00),
                          effectedNum: _stateData.totalCases,
                          press: () {},
                        ),
                        StateInfoCard(
                          title: "Active Cases",
                          // subtitle: _stateData.todayNewActive.toString(),
                          iconColor: Color(0xFF5856D6),
                          effectedNum: _stateData.totalActive,
                          press: () {},
                        ),
                        StateInfoCard(
                          title: "Total Recovered",
                          // subtitle: _stateData.todayNewRecovered.toString(),
                          iconColor: Color(0xFF50E3C2),
                          effectedNum: _stateData.totalRecoveries,
                          press: () {},
                        ),
                        StateInfoCard(
                          title: "Total Deaths",
                          // subtitle: _stateData.todayNewDeaths.toString(),
                          iconColor: Color(0xFFFF2D55),
                          effectedNum: _stateData.totalDeaths,
                          press: () {},
                        ),
                      ],
                    ),
                  ),
                  CityHeader(),
                  Container(
                      height: MediaQuery.of(context).size.height - 150,
                      // * 3.7,
                      decoration: BoxDecoration(
                          // border: Border.all(color: Colors.white,)
                          ),
                      child: ListView.builder(
                          physics: _innerScrollPhysics,
                          controller: _innerListController,
                          // shrinkWrap: true,
                          itemCount: _cityData.length,
                          // itemExtent: 79,
                          itemBuilder: (context, index) {
                            return CityItem(city: _cityData[index]);
                          })),
                ],
              ));
  }

}
