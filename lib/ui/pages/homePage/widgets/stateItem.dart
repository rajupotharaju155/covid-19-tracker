
import 'package:covid_19_tracker/models/apimodel.dart';
import 'package:covid_19_tracker/ui/pages/statePage/stateDataPage.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:easy_localization/easy_localization.dart';

class StateItem extends StatelessWidget {
  final ApiModel state;
  StateItem({
    this.state,
  });
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        splashColor: Colors.white,
        hoverColor: Colors.white,
        onTap: () {
          Navigator.of(context).push(
            PageTransition(
              type: PageTransitionType.rightToLeft,
              child: StateDataPage(
                stateName: state.locationName,
              )));
        },
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height / 10,
              decoration: BoxDecoration(
                  // border: Border.all()
                  ),
              // padding: EdgeInsets.symmetric(vertical: 5),
              child: Row(
                children: [
                  Expanded(
                    flex: 4,
                    child: Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: Text(
                          state.locationName.toUpperCase(),
                          style: TextStyle(
                              fontSize: context.locale == Locale('hi', 'IN')
                                  ? 18
                                  : state.locationName.length > 21
                                      ? 14
                                      : 15,
                              color: Colors.white),
                        ).tr()),
                  ),
                  Expanded(
                    flex: 3,
                    child: Center(
                        child: Text(
                      state.totalCases.toString(),
                      style: TextStyle(color: Colors.redAccent),
                    )),
                  ),
                  Expanded(
                    flex: 3,
                    child: Center(
                        child: Text(
                      state.totalRecoveries.toString(),
                      style: TextStyle(color: Colors.greenAccent),
                    )),
                  ),
                  Expanded(
                    flex: 2,
                    child: Center(
                        child: Text(
                      state.totalDeaths.toString(),
                      style: TextStyle(color: Colors.grey[300]),
                    )),
                  ),
                ],
              ),
            ),
            Container(
              alignment: Alignment.centerRight,
              child: Container(
                width: 250,
                height: 0.2,
                color: Colors.white.withOpacity(0.7),
              ),
            )
          ],
        ),
      ),
    );
  }
}
