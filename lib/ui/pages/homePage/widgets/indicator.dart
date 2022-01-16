import 'package:countup/countup.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:easy_localization/easy_localization.dart';


class LineIndicator extends StatelessWidget {
  final String indicatorName;
  final double percentage;
  final Color indicatorColor;

  const LineIndicator({Key key, this.indicatorName, this.percentage, this.indicatorColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(8))
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(padding: EdgeInsets.only(left: 9, top: 5),
          child: Text(indicatorName,
          style: TextStyle(
            fontSize: context.locale == Locale('hi', 'IN') ? 17: 14,
          ),
          ).tr(),
          ),
          Padding(
                  padding: EdgeInsets.all(5.0),
                  child: new LinearPercentIndicator(
                    width: MediaQuery.of(context).size.width - 50,
                    animation: true,
                    lineHeight: 15.0,
                    animationDuration: 5000,
                    percent: percentage/100,
                    center: 
                    Countup(
                        begin: 0,
                        end: percentage.toDouble(),
                        precision:1,
                        duration: Duration(seconds: 3),
                        separator: ',',
                        suffix: "%",
                        style: TextStyle(
                          fontSize:  10,
                          fontWeight: FontWeight.bold
                        ),
                    ),
                    // Text(percentage.toString()+"%",
                    // style: TextStyle(
                    //   fontSize:  10,
                    //   fontWeight: FontWeight.bold
                    // ),
                    // ),
                    linearStrokeCap: LinearStrokeCap.roundAll,
                    progressColor: indicatorColor,
                  ),
                ),
        ],
      )
    );
  }
}