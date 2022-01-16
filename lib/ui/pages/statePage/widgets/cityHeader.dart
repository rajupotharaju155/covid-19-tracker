import 'package:covid_19_tracker/ui/constants.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class CityHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.only(bottom: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.symmetric(horizontal: 5),
                height: 30,
                width: 5,
                color: kPrimaryColor,
              ),
              Container(
                  child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text("District wise info",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white))
                      .tr(),
                ],
              ))
            ],
          ),
        ),
        Container(
          child: Row(
            children: [
              Expanded(
                flex: 3,
                child: Center(
                  child: Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: Text(
                        "Location",
                        style: TextStyle(
                            fontSize:
                                context.locale == Locale('hi', 'IN') ? 16 : 12,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ).tr()),
                ),
              ),
              Expanded(
                flex: 3,
                child: Center(
                  child: Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: Text(
                        "Confirmed",
                        style: TextStyle(
                          fontSize:
                              context.locale == Locale('hi', 'IN') ? 16 : 12,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ).tr()),
                ),
              ),
            ],
          ),
        ),
        Divider(
          color: Colors.white,
        ),
      ],
    );
  }
}
