import 'package:covid_19_tracker/ui/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:countup/countup.dart';
import 'package:easy_localization/easy_localization.dart';

class StateInfoCard extends StatelessWidget {
  final String title;
  final int effectedNum;
  final Color iconColor;
  final Function press;
  const StateInfoCard({
    Key key,
    this.title,
    this.effectedNum,
    this.iconColor,
    this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return GestureDetector(
          onTap: press,
          child: Container(
            width: constraints.maxWidth / 2 - 10,
            // Here constraints.maxWidth provide us the available width for the widget
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              // border: Border.all()
            ),
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        // wrapped within an expanded widget to allow for small density device
                        Container(
                          alignment: Alignment.center,
                          height: 30,
                          width: 30,
                          decoration: BoxDecoration(
                            // border: Border.all(),
                            color: iconColor.withOpacity(0.12),
                            shape: BoxShape.circle,
                          ),
                          child: SvgPicture.asset(
                            "assets/icons/running.svg",
                            height: 12,
                            width: 12,
                            color: iconColor,
                          ),
                        ),
                        SizedBox(width: 5),
                        Text(
                          title,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: context.locale == Locale('hi', 'IN') ? 17: 12,
                          ),
                        ).tr(),
                      ],
                    ),
                  ),


                  Container(
                    decoration: BoxDecoration(
                      // border: Border.all()
                    ),
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Countup(
                          begin: 0,
                          end: effectedNum.toDouble(),
                          duration: Duration(seconds: 3),
                          separator: ',',
                          style: Theme.of(context)
                              .textTheme
                              .headline6
                              .copyWith(
                              fontWeight: FontWeight.bold,
                              color: kTextColor
                          ),
                        ),
                        Text("People",
                          style: TextStyle(
                              fontSize: context.locale == Locale('hi', 'IN') ? 14: 12,
                              height: 2,
                              color: kTextColor
                          ),
                        ).tr(),
                      ],
                    ),
                  ),

                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
