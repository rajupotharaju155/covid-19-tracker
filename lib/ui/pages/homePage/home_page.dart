import 'package:covid_19_tracker/models/apimodel.dart';
import 'package:covid_19_tracker/services/apiservice.dart';
import 'package:covid_19_tracker/ui/pages/MapPage/map_iframe.dart';
import 'package:covid_19_tracker/ui/pages/errorPage/serviceErrorPage.dart';
import 'package:covid_19_tracker/ui/pages/homePage/widgets/drawer.dart';
import 'package:covid_19_tracker/ui/pages/homePage/widgets/indicator.dart';
import 'package:covid_19_tracker/ui/pages/homePage/widgets/info_card.dart';
import 'package:covid_19_tracker/ui/pages/homePage/widgets/loading.dart';
import 'package:covid_19_tracker/ui/pages/homePage/widgets/stateHeader.dart';
import 'package:covid_19_tracker/ui/pages/homePage/widgets/stateItem.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:covid_19_tracker/ui/constants.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:page_transition/page_transition.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  ApiModel _countryData;
  List<ApiModel> _stateList;
  ScrollController _outerListController;
  ScrollController _innerListController;
  bool insideListCanScroll = false;
  bool serviceError = false;
  bool loading = false;
  ScrollPhysics _outerScrollPhysics = AlwaysScrollableScrollPhysics();
  ScrollPhysics _innerScrollPhysics = NeverScrollableScrollPhysics();
  bool isEnglish = true;
  bool confirmedInAscending = true;
  bool recoveredInAscending = true;
  bool deathsInAscending = true;
  bool locationInAscending = true;
  void runAPIFunction() async {
    setState(() {
      loading = true;
    });
    final data = await ApiService().getDataFromApi();
    // final data = await ApiService().getDataFromKrunalApi();
    if (data is bool) {
      print("Error occured");
      serviceError = true;
    } else {
      _countryData = data.countryData;
      _stateList = data.stateList;
      // _stateList.sort((a,b) => a.totalActive.compareTo(b.totalActive));

      serviceError = false;
    }
      setState(() {
    loading = false;
  });
  }

  _outerListscrollListener() {
    if (_outerListController.offset >=
            _outerListController.position.maxScrollExtent &&
        !_outerListController.position.outOfRange) {
      setState(() {
        _innerScrollPhysics = AlwaysScrollableScrollPhysics();
      });
    }

    if (_outerListController.offset <=
            _outerListController.position.minScrollExtent &&
        !_outerListController.position.outOfRange) {
      _innerScrollPhysics = NeverScrollableScrollPhysics();
      _outerScrollPhysics = AlwaysScrollableScrollPhysics();
      setState(() {});
    }
  }

  _innerListscrollListener() {
    if (_innerListController.offset <=
            _innerListController.position.minScrollExtent &&
        !_innerListController.position.outOfRange) {
      _innerScrollPhysics = NeverScrollableScrollPhysics();
      _outerScrollPhysics = AlwaysScrollableScrollPhysics();
      setState(() {});
    }
  }

  @override
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
    return Scaffold(
      //splash dark #301f43
      //more daark #2B1B3C
// #261835
// #21152E
// #1C1228
      backgroundColor: Color(0xff1C1228),
      key: _scaffoldKey,
      appBar: buildAppBar(),
      drawer: CustomDrawer(),
      body: loading
          ? Loading()
          :
          serviceError ?
          ServiceErrorPage()
          : ListView(
              physics: _outerScrollPhysics,
              controller: _outerListController,
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(left: 20),
                  color: kPrimaryColor.withOpacity(0.03),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            child: SpinKitRipple(
                                color: Color(0xFFFF2D55), size: 25.0),
                          ),
                          Text(
                            "Live",
                            style: TextStyle(
                                color: Color(0xFFFF2D55),
                                fontWeight: FontWeight.bold,
                                fontSize: 15),
                          ).tr(),
                          Padding(
                              padding: EdgeInsets.only(left: 100, right: 50)),
                        ],
                      ),
                      Row(children: <Widget>[
                        // SizedBox(width: 15),
                        Text("All India Status",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize:
                                        context.locale == Locale('hi', 'IN')
                                            ? 22
                                            : 20,
                                    fontWeight: FontWeight.bold))
                            .tr()
                      ]),
                      Row(
                        children: [
                          // SizedBox(width: 15,),
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
                            _countryData.updatedAt,
                            style: TextStyle(
                                fontStyle: FontStyle.italic,
                                color: Colors.grey[400],
                                fontSize: 11),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  padding:
                      EdgeInsets.only(left: 10, top: 20, right: 10, bottom: 40),
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
                      InfoCard(
                        title: "Confirmed Cases",
                        subtitle: _countryData.todayNewConfirmed.toString(),
                        iconColor: Color(0xFFFF8C00),
                        effectedNum: _countryData.totalCases,
                        press: () {},
                      ),
                      InfoCard(
                        title: "Active Cases",
                        subtitle: _countryData.todayNewActive.toString(),
                        iconColor: Color(0xFF5856D6),
                        effectedNum: _countryData.totalActive,
                        press: () {},
                      ),
                      InfoCard(
                        title: "Total Recovered",
                        subtitle: _countryData.todayNewRecovered.toString(),
                        iconColor: Color(0xFF50E3C2),
                        effectedNum: _countryData.totalRecoveries,
                        press: () {},
                      ),
                      InfoCard(
                        title: "Total Deaths",
                        subtitle: _countryData.todayNewDeaths.toString(),
                        iconColor: Color(0xFFFF2D55),
                        effectedNum: _countryData.totalDeaths,
                        press: () {},
                      ),
                      LineIndicator(
                        indicatorName: "Recovery Rate",
                        percentage: _countryData.recoveryRate,
                        indicatorColor: Colors.greenAccent,
                      ),
                      LineIndicator(
                        indicatorName: "Fatality Rate",
                        percentage: _countryData.fatalityRate,
                        indicatorColor: Color(0xFFFF2D55).withOpacity(0.8),
                      ),
                    ],
                  ),
                ),
                //  MayureshDropDown(stateList: _stateList,),
                StateHeader(
                  sortByConfirmed: sortByConfirmed,
                  sortByRecovered: sortByRecovered,
                  sortByDeaths: sortByDeaths,
                  sortByLocation: sortByLocation
                ),
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
                        itemCount: _stateList.length,
                        // itemExtent: 79,
                        itemBuilder: (context, index) {
                          return StateItem(state: _stateList[index]);
                        })),
              ],
            ),
    
    floatingActionButton: FloatingActionButton(
      backgroundColor:  Color(0xff301f43),
      shape: CircleBorder(side: BorderSide(
      color: Colors.grey[300]
      )),
      onPressed: (){
         Navigator.of(context).push(
        PageTransition(type: PageTransitionType.rightToLeft, child: Iframe()));
    
      },
      child: Icon(Icons.location_pin,color: Colors.grey[300] )
    ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: kPrimaryColor.withOpacity(.03),
      elevation: 0,
      leading: IconButton(
        icon: SvgPicture.asset("assets/icons/menu.svg"),
        onPressed: () {
          _scaffoldKey.currentState.openDrawer();
        },
      ),
      actions: <Widget>[
        IconButton(
          icon: Icon(
            Icons.refresh_outlined,
            color: kPrimaryColor,
            size: 30,
          ),
          // SvgPicture.asset("assets/icons/search.svg"),
          onPressed: () {
            runAPIFunction();
          },
        ),
      ],
    );
  }

void sortByConfirmed(){
  print("sorting..");
  if(confirmedInAscending){
     print("ascending");
  Comparator<ApiModel> apiComparator = (a, b) => a.totalActive.compareTo(b.totalActive);
  _stateList.sort(apiComparator);
  confirmedInAscending = false;

  }else{
    print("descending");
    Comparator<ApiModel> apiComparator = (a, b) => b.totalActive.compareTo(a.totalActive);
  _stateList.sort(apiComparator);
  confirmedInAscending = true;

  }
    setState(() {
    
  });
}

void sortByRecovered(){
  print("sorting..");
  if(recoveredInAscending){
     print("ascending");
  Comparator<ApiModel> apiComparator = (a, b) => a.totalRecoveries.compareTo(b.totalRecoveries);
  _stateList.sort(apiComparator);
  recoveredInAscending = false;

  }else{
    print("descending");
    Comparator<ApiModel> apiComparator = (a, b) => b.totalRecoveries.compareTo(a.totalRecoveries);
  _stateList.sort(apiComparator);
  recoveredInAscending = true;

  }
    setState(() {
    
  });
}

void sortByDeaths(){
  print("sorting..");
  if(deathsInAscending){
     print("ascending");
  Comparator<ApiModel> apiComparator = (a, b) => a.totalDeaths.compareTo(b.totalDeaths);
  _stateList.sort(apiComparator);
  deathsInAscending = false;

  }else{
    print("descending");
    Comparator<ApiModel> apiComparator = (a, b) => b.totalDeaths.compareTo(a.totalDeaths);
  _stateList.sort(apiComparator);
  deathsInAscending = true;

  }
    setState(() {
    
  });
}

void sortByLocation(){
  print("sorting..");
  if(locationInAscending){
     print("ascending");
  Comparator<ApiModel> apiComparator = (a, b) => a.locationName.compareTo(b.locationName);
  _stateList.sort(apiComparator);
  locationInAscending = false;

  }else{
    print("descending");
    Comparator<ApiModel> apiComparator = (a, b) => b.locationName.compareTo(a.locationName);
  _stateList.sort(apiComparator);
  locationInAscending = true;

  }
    setState(() {
    
  });
}

}
