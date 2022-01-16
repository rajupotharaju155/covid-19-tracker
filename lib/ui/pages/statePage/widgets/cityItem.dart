import 'package:covid_19_tracker/models/apimodel.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class CityItem extends StatelessWidget {
  final ApiModel city;
  CityItem({
    this.city,
  });
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        splashColor: Colors.white,
        hoverColor: Colors.white,
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
                    flex: 3,
                    child: Center(
                      child: Padding(
                          padding: const EdgeInsets.only(left: 10.0),
                          child: Text(
                            city.locationName.toUpperCase(),
                            style: TextStyle(
                                fontSize: context.locale == Locale('hi', 'IN')
                                    ? 18
                                    : city.locationName.length > 21
                                    ? 14
                                    : 15,
                                color: Colors.white),
                          ).tr()),
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Center(
                        child: Text(
                          city.totalCases.toString(),
                          style: TextStyle(color: Colors.redAccent),
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
