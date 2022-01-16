import '../../../constants.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class StateHeader extends StatelessWidget {
  final VoidCallback sortByConfirmed;
  final VoidCallback sortByRecovered;
  final VoidCallback sortByDeaths;
  final VoidCallback sortByLocation;
  StateHeader({
    this.sortByConfirmed, 
  this.sortByRecovered, 
  this.sortByDeaths,
  this.sortByLocation});
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
                    Text("State wise info",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white
                      )
                    ).tr(),
                  ],
                ))
            ],
          ),
        ),
        Container(
          child: Row(
            children: [
              Expanded(
                flex: 4,
                child: GestureDetector(
                   onTap: () =>sortByLocation(),
                                  child: Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Row(
                      children: [
                        Text("Location",
                        style: TextStyle(
                          fontSize: context.locale == Locale('hi', 'IN') ? 16: 12,
                          fontWeight: FontWeight.bold,
                          color: Colors.white
                        ),).tr(),
                        Container(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.arrow_drop_up, size: 13, color: Colors.white,),
                                Icon(Icons.arrow_drop_down, size: 13, color: Colors.white,)
                              ],
                            ),
                          )
                      ],
                    )
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: GestureDetector(
                  onTap: () =>sortByConfirmed(),
                                  child: Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Row(
                      children: [
                        Text("Confirmed",
                        style: TextStyle(
                          fontSize: context.locale == Locale('hi', 'IN') ? 16: 12,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),).tr(),

                        Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.arrow_drop_up, size: 13, color: Colors.white,),
                              Icon(Icons.arrow_drop_down, size: 13, color: Colors.white,)
                            ],
                          ),
                        )
                      ],
                    )
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: GestureDetector(
                  onTap: () =>sortByRecovered(),
                                  child: Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Row(
                      children: [
                        Text("Recovered",
                        style: TextStyle(
                          fontSize: context.locale == Locale('hi', 'IN') ? 16: 12,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),).tr(),
                        Container(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.arrow_drop_up, size: 13, color: Colors.white,),
                                Icon(Icons.arrow_drop_down, size: 13, color: Colors.white,)
                              ],
                            ),
                          )
                      ],
                    )
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: GestureDetector(
                  onTap: () =>sortByDeaths(),
                                  child: Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Row(
                      children: [
                        Text("Death",
                        style: TextStyle(
                          fontSize: context.locale == Locale('hi', 'IN') ? 16: 12,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),).tr(),
                        Container(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.arrow_drop_up, size: 13, color: Colors.white,),
                                Icon(Icons.arrow_drop_down, size: 13, color: Colors.white,)
                              ],
                            ),
                          )
                      ],
                    )
                  ),
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